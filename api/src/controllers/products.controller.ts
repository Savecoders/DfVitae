import type { Request, Response } from 'express';
import { PrismaClient } from '../../generated/prisma';

const prisma = new PrismaClient();

export class ProductsController {
  // Obtener todos los productos con paginación
  async getAllProducts(req: Request, res: Response) {
    try {
      const { page = '1', limit = '10', search = '' } = req.query;
      const pageNumber = parseInt(page as string);
      const limitNumber = parseInt(limit as string);
      const skip = (pageNumber - 1) * limitNumber;

      const whereClause = search
        ? {
            title: {
              contains: search as string,
              mode: 'insensitive' as const,
            },
          }
        : {};

      const [products, total] = await Promise.all([
        prisma.products.findMany({
          where: whereClause,
          skip,
          take: limitNumber,
          include: {
            details: true,
            OrderItems: {
              include: {
                order: true,
              },
            },
          },
          orderBy: {
            createdAt: 'desc',
          },
        }),
        prisma.products.count({ where: whereClause }),
      ]);

      // Calcular métricas de ventas para cada producto
      const productsWithMetrics = products.map(product => {
        const completedOrders = product.OrderItems.filter(
          item => item.order.status === 'completed',
        );

        const totalSales = completedOrders.reduce((sum, item) => sum + item.quantity, 0);

        const totalRevenue = completedOrders.reduce(
          (sum, item) => sum + item.price * item.quantity,
          0,
        );

        return {
          ...product,
          metrics: {
            totalSales,
            totalRevenue,
            averageOrderValue:
              completedOrders.length > 0 ? totalRevenue / completedOrders.length : 0,
          },
        };
      });

      res.json({
        success: true,
        data: {
          products: productsWithMetrics,
          pagination: {
            page: pageNumber,
            limit: limitNumber,
            total,
            totalPages: Math.ceil(total / limitNumber),
          },
        },
        message: 'Products retrieved successfully',
      });
    } catch (error) {
      console.error('❌ Error getting products:', error);
      res.status(500).json({
        success: false,
        error: 'Failed to retrieve products',
        details: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  // Obtener un producto por ID
  async getProductById(req: Request, res: Response) {
    try {
      const { id } = req.params;

      const product = await prisma.products.findUnique({
        where: { id },
        include: {
          details: true,
          OrderItems: {
            include: {
              order: {
                include: {
                  user: {
                    select: {
                      id: true,
                      name: true,
                      email: true,
                    },
                  },
                },
              },
            },
          },
        },
      });

      if (!product) {
        return res.status(404).json({
          success: false,
          error: 'Product not found',
        });
      }

      // Calcular métricas detalladas
      const completedOrders = product.OrderItems.filter(item => item.order.status === 'completed');

      const metrics = {
        totalSales: completedOrders.reduce((sum, item) => sum + item.quantity, 0),
        totalRevenue: completedOrders.reduce((sum, item) => sum + item.price * item.quantity, 0),
        uniqueCustomers: new Set(completedOrders.map(item => item.order.userId)).size,
        averageQuantityPerOrder:
          completedOrders.length > 0
            ? completedOrders.reduce((sum, item) => sum + item.quantity, 0) / completedOrders.length
            : 0,
      };

      res.json({
        success: true,
        data: {
          ...product,
          metrics,
        },
        message: 'Product retrieved successfully',
      });
    } catch (error) {
      console.error('❌ Error getting product:', error);
      res.status(500).json({
        success: false,
        error: 'Failed to retrieve product',
        details: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  // Obtener productos más vendidos
  async getTopSellingProducts(req: Request, res: Response) {
    try {
      const { limit = '10' } = req.query;
      const limitNumber = parseInt(limit as string);

      const topProducts = await prisma.orderItems.groupBy({
        by: ['productId'],
        _sum: {
          quantity: true,
          price: true,
        },
        _count: {
          orderId: true,
        },
        orderBy: {
          _sum: {
            quantity: 'desc',
          },
        },
        take: limitNumber,
      });

      // Obtener detalles de los productos
      const productsWithDetails = await Promise.all(
        topProducts.map(async item => {
          const product = await prisma.products.findUnique({
            where: { id: item.productId },
            include: { details: true },
          });

          return {
            product,
            sales: {
              totalQuantity: item._sum.quantity || 0,
              totalRevenue: item._sum.price || 0,
              totalOrders: item._count.orderId || 0,
            },
          };
        }),
      );

      res.json({
        success: true,
        data: productsWithDetails,
        message: 'Top selling products retrieved successfully',
      });
    } catch (error) {
      console.error('❌ Error getting top products:', error);
      res.status(500).json({
        success: false,
        error: 'Failed to retrieve top selling products',
        details: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  // Obtener productos con bajo stock
  async getLowStockProducts(req: Request, res: Response) {
    try {
      const { threshold = '10' } = req.query;
      const stockThreshold = parseInt(threshold as string);

      const lowStockProducts = await prisma.products.findMany({
        where: {
          stock: {
            lte: stockThreshold,
          },
          availability: true,
        },
        include: {
          details: true,
          OrderItems: {
            where: {
              order: {
                status: 'completed',
              },
            },
          },
        },
        orderBy: {
          stock: 'asc',
        },
      });

      // Calcular velocidad de venta para cada producto
      const productsWithVelocity = lowStockProducts.map(product => {
        const recentOrders = product.OrderItems.filter(item => {
          const orderDate = new Date(item.createdAt);
          const thirtyDaysAgo = new Date();
          thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);
          return orderDate >= thirtyDaysAgo;
        });

        const monthlyVelocity = recentOrders.reduce((sum, item) => sum + item.quantity, 0);

        return {
          ...product,
          salesVelocity: {
            last30Days: monthlyVelocity,
            estimatedDaysUntilStockout:
              product.stock && monthlyVelocity > 0
                ? Math.floor((product.stock / monthlyVelocity) * 30)
                : null,
          },
        };
      });

      res.json({
        success: true,
        data: productsWithVelocity,
        message: 'Low stock products retrieved successfully',
        parameters: { threshold: stockThreshold },
      });
    } catch (error) {
      console.error('❌ Error getting low stock products:', error);
      res.status(500).json({
        success: false,
        error: 'Failed to retrieve low stock products',
        details: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }
}
