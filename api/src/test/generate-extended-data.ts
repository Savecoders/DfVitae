#!/usr/bin/env bun
import { PrismaClient } from '../../generated/prisma';
import { StatusOrder } from '../types/Order';

const prisma = new PrismaClient();

async function generateExtendedDemoData() {
  console.log('🏗️ Generating extended demo data for better ML analysis...\n');

  try {
    // 1. Crear más usuarios para el análisis
    console.log('👥 Creating additional users...');

    const additionalUsers = [
      { name: 'Carlos Mendoza', email: 'carlos.mendoza@demo.com' },
      { name: 'Laura Jiménez', email: 'laura.jimenez@demo.com' },
      { name: 'Roberto Vargas', email: 'roberto.vargas@demo.com' },
      { name: 'Ana Torres', email: 'ana.torres@demo.com' },
      { name: 'Diego Ruiz', email: 'diego.ruiz@demo.com' },
      { name: 'Sofía Castro', email: 'sofia.castro@demo.com' },
    ];

    const createdUsers = [];
    for (const userData of additionalUsers) {
      const existingUser = await prisma.user.findUnique({
        where: { email: userData.email },
      });

      if (!existingUser) {
        const user = await prisma.user.create({
          data: userData,
        });
        createdUsers.push(user);
      }
    }

    console.log(`✅ Created ${createdUsers.length} additional users`);

    // 2. Obtener productos existentes
    const products = await prisma.products.findMany({ take: 50 });
    const allUsers = await prisma.user.findMany();

    console.log(`📦 Found ${products.length} products and ${allUsers.length} users`);

    // 3. Generar órdenes adicionales con patrones realistas
    console.log('📋 Creating diverse orders with realistic patterns...');

    const ordersToCreate = [];
    const orderItemsToCreate = [];

    // Generar 60 órdenes adicionales distribuidas en los últimos 4 meses
    for (let i = 0; i < 60; i++) {
      const randomUser = allUsers[Math.floor(Math.random() * allUsers.length)];

      // Fechas distribuidas en los últimos 4 meses
      const daysAgo = Math.floor(Math.random() * 120); // 0-120 días atrás
      const orderDate = new Date();
      orderDate.setDate(orderDate.getDate() - daysAgo);

      // Crear orden
      const order = {
        id: `order-${Date.now()}-${i}`,
        userId: randomUser.id,
        status: Math.random() > 0.1 ? StatusOrder.completed : StatusOrder.pending, // 90% completed
        totalPrice: 0, // Se calculará después
        createdAt: orderDate,
        updatedAt: orderDate,
      };

      ordersToCreate.push(order);

      // Crear items para la orden (1-4 productos por orden)
      const itemCount = Math.floor(Math.random() * 4) + 1;
      let orderTotal = 0;

      for (let j = 0; j < itemCount; j++) {
        const randomProduct = products[Math.floor(Math.random() * products.length)];
        const quantity = Math.floor(Math.random() * 3) + 1; // 1-3 unidades
        const itemTotal = randomProduct.price * quantity;
        orderTotal += itemTotal;

        orderItemsToCreate.push({
          id: `item-${Date.now()}-${i}-${j}`,
          orderId: order.id,
          productId: randomProduct.id,
          quantity,
          price: itemTotal,
          createdAt: orderDate,
          updatedAt: orderDate,
        });
      }

      order.totalPrice = orderTotal;
    }

    // Insertar órdenes
    console.log(`📝 Creating ${ordersToCreate.length} orders...`);
    await prisma.orders.createMany({
      data: ordersToCreate,
      skipDuplicates: true,
    });

    // Insertar items
    console.log(`🛒 Creating ${orderItemsToCreate.length} order items...`);
    await prisma.orderItems.createMany({
      data: orderItemsToCreate,
      skipDuplicates: true,
    });

    // 4. Verificar el estado final
    console.log('\n📊 Final data summary:');
    const finalStats = {
      users: await prisma.user.count(),
      products: await prisma.products.count(),
      orders: await prisma.orders.count(),
      orderItems: await prisma.orderItems.count(),
      completedOrders: await prisma.orders.count({
        where: { status: StatusOrder.completed },
      }),
    };

    console.log(`👥 Total Users: ${finalStats.users}`);
    console.log(`📦 Total Products: ${finalStats.products}`);
    console.log(`📋 Total Orders: ${finalStats.orders}`);
    console.log(`🛒 Total Order Items: ${finalStats.orderItems}`);
    console.log(`✅ Completed Orders: ${finalStats.completedOrders}`);

    // 5. Verificar productos con múltiples ventas
    const productSalesCheck = await prisma.orderItems.groupBy({
      by: ['productId'],
      _count: { productId: true },
      where: {
        order: { status: StatusOrder.completed },
      },
      having: {
        productId: { _count: { gte: 2 } },
      },
    });

    console.log(`🎯 Products with 2+ sales: ${productSalesCheck.length}`);
    console.log('\n🎉 Extended demo data generation completed!');
    console.log('🚀 The system should now have sufficient data for all ML algorithms.');
  } catch (error) {
    console.error('❌ Error generating extended demo data:', error);
    throw error;
  } finally {
    await prisma.$disconnect();
  }
}

// Ejecutar script
generateExtendedDemoData()
  .then(() => {
    console.log('✅ Script completed successfully');
    process.exit(0);
  })
  .catch(error => {
    console.error('❌ Script failed:', error);
    process.exit(1);
  });

export { generateExtendedDemoData };
