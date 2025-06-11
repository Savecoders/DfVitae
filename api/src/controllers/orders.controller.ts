import type { Request, Response } from 'express';
import { PrismaClient } from '../../generated/prisma';
import { StatusOrder } from '../types/Order';

const prisma = new PrismaClient();

export class OrdersController {
  // Obtener todas las órdenes con filtros
  async getAllOrders(req: Request, res: Response) {
    try {
      const { page = '1', limit = '10', status, userId, startDate, endDate } = req.query;

      const pageNumber = parseInt(page as string);
      const limitNumber = parseInt(limit as string);
      const skip = (pageNumber - 1) * limitNumber;

      // Construir filtros
      const whereClause: any = {};

      if (status && Object.values(StatusOrder).includes(status as StatusOrder)) {
        whereClause.status = status;
      }

      if (userId) {
        whereClause.userId = userId;
      }

      if (startDate || endDate) {
        whereClause.createdAt = {};
        if (startDate) whereClause.createdAt.gte = new Date(startDate as string);
        if (endDate) whereClause.createdAt.lte = new Date(endDate as string);
      }

      const [orders, total] = await Promise.all([
        prisma.orders.findMany({
          where: whereClause,
          skip,
          take: limitNumber,
          include: {
            user: {
              select: {
                id: true,
                name: true,
                email: true,
              },
            },
            items: {
              include: {
                product: {
                  select: {
                    id: true,
                    title: true,
                    price: true,
                    imageUrl: true,
                  },
                },
              },
            },
          },
          orderBy: {
            createdAt: 'desc',
          },
        }),
        prisma.orders.count({ where: whereClause }),
      ]);

      // Calcular métricas de las órdenes
      const ordersWithMetrics = orders.map(order => ({
        ...order,
        metrics: {
          itemCount: order.items.length,
          totalQuantity: order.items.reduce((sum, item) => sum + item.quantity, 0),
          averageItemPrice:
            order.items.length > 0
              ? order.items.reduce((sum, item) => sum + item.price, 0) / order.items.length
              : 0,
        },
      }));

      res.json({
        success: true,
        data: {
          orders: ordersWithMetrics,
          pagination: {
            page: pageNumber,
            limit: limitNumber,
            total,
            totalPages: Math.ceil(total / limitNumber),
          },
        },
        message: 'Orders retrieved successfully',
      });
    } catch (error) {
      console.error('❌ Error getting orders:', error);
      res.status(500).json({
        success: false,
        error: 'Failed to retrieve orders',
        details: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  // Obtener métricas de órdenes
  async getOrderMetrics(req: Request, res: Response) {
    try {
      const { period = '30' } = req.query;
      const days = parseInt(period as string);
      const startDate = new Date();
      startDate.setDate(startDate.getDate() - days);

      // Métricas generales
      const [
        totalOrders,
        completedOrders,
        pendingOrders,
        cancelledOrders,
        revenueData,
        averageOrderValue,
      ] = await Promise.all([
        prisma.orders.count({
          where: { createdAt: { gte: startDate } },
        }),
        prisma.orders.count({
          where: {
            status: StatusOrder.completed,
            createdAt: { gte: startDate },
          },
        }),
        prisma.orders.count({
          where: {
            status: StatusOrder.pending,
            createdAt: { gte: startDate },
          },
        }),
        prisma.orders.count({
          where: {
            status: StatusOrder.cancelled,
            createdAt: { gte: startDate },
          },
        }),
        prisma.orders.aggregate({
          where: {
            status: StatusOrder.completed,
            createdAt: { gte: startDate },
          },
          _sum: { totalPrice: true },
        }),
        prisma.orders.aggregate({
          where: {
            status: StatusOrder.completed,
            createdAt: { gte: startDate },
          },
          _avg: { totalPrice: true },
        }),
      ]);

      // Órdenes por día (últimos 7 días)
      const dailyOrders = await prisma.orders.groupBy({
        by: ['createdAt'],
        where: {
          createdAt: {
            gte: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000),
          },
        },
        _count: true,
        _sum: { totalPrice: true },
      });

      const dailyMetrics = dailyOrders.reduce((acc, order) => {
        const date = order.createdAt.toISOString().split('T')[0];
        if (!acc[date]) {
          acc[date] = { count: 0, revenue: 0 };
        }
        acc[date].count += order._count;
        acc[date].revenue += order._sum.totalPrice || 0;
        return acc;
      }, {} as Record<string, { count: number; revenue: number }>);

      res.json({
        success: true,
        data: {
          summary: {
            totalOrders,
            completedOrders,
            pendingOrders,
            cancelledOrders,
            totalRevenue: revenueData._sum.totalPrice || 0,
            averageOrderValue: averageOrderValue._avg.totalPrice || 0,
            conversionRate: totalOrders > 0 ? (completedOrders / totalOrders) * 100 : 0,
          },
          daily: dailyMetrics,
          period: `${days} days`,
        },
        message: 'Order metrics retrieved successfully',
      });
    } catch (error) {
      console.error('❌ Error getting order metrics:', error);
      res.status(500).json({
        success: false,
        error: 'Failed to retrieve order metrics',
        details: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  // Obtener una orden específica
  async getOrderById(req: Request, res: Response) {
    try {
      const { id } = req.params;

      const order = await prisma.orders.findUnique({
        where: { id },
        include: {
          user: {
            select: {
              id: true,
              name: true,
              email: true,
            },
          },
          items: {
            include: {
              product: {
                include: {
                  details: true,
                },
              },
            },
          },
        },
      });

      if (!order) {
        return res.status(404).json({
          success: false,
          error: 'Order not found',
        });
      }

      res.json({
        success: true,
        data: order,
        message: 'Order retrieved successfully',
      });
    } catch (error) {
      console.error('❌ Error getting order:', error);
      res.status(500).json({
        success: false,
        error: 'Failed to retrieve order',
        details: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  // Obtener órdenes por estado
  async getOrdersByStatus(req: Request, res: Response) {
    try {
      const ordersByStatus = await prisma.orders.groupBy({
        by: ['status'],
        _count: true,
        _sum: { totalPrice: true },
        _avg: { totalPrice: true },
      });

      const statusMetrics = ordersByStatus.map(status => ({
        status: status.status,
        count: status._count,
        totalRevenue: status._sum.totalPrice || 0,
        averageValue: status._avg.totalPrice || 0,
      }));

      res.json({
        success: true,
        data: statusMetrics,
        message: 'Orders by status retrieved successfully',
      });
    } catch (error) {
      console.error('❌ Error getting orders by status:', error);
      res.status(500).json({
        success: false,
        error: 'Failed to retrieve orders by status',
        details: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }
}
