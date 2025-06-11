#!/usr/bin/env bun
// filepath: /home/save/Dev/Learn/Science/BI/Project/api/src/scripts/seed-demo-data.ts

import { PrismaClient } from '../../generated/prisma';
import { StatusOrder } from '../types/Order';

async function seedDemoData() {
  console.log('🌱 Seeding demo data for Data Mining...\n');

  const prisma = new PrismaClient();

  try {
    // 1. Crear usuarios de prueba
    console.log('👥 Creating demo users...');

    const users = await Promise.all([
      prisma.user.create({
        data: {
          id: 'user1',
          name: 'John Doe',
          email: 'john.doe@example.com',
          password: 'hashed_password_1',
        },
      }),
      prisma.user.create({
        data: {
          id: 'user2',
          name: 'Jane Smith',
          email: 'jane.smith@example.com',
          password: 'hashed_password_2',
        },
      }),
      prisma.user.create({
        data: {
          id: 'user3',
          name: 'Michael Johnson',
          email: 'michael.johnson@example.com',
          password: 'hashed_password_3',
        },
      }),
      prisma.user.create({
        data: {
          id: 'user4',
          name: 'Emily Brown',
          email: 'emily.brown@example.com',
          password: 'hashed_password_4',
        },
      }),
    ]);

    console.log(`✅ Created ${users.length} users`);

    // 2. Obtener algunos productos existentes
    console.log('📦 Getting existing products...');
    const products = await prisma.products.findMany({ take: 20 });

    if (products.length === 0) {
      console.log('⚠️  No products found. Please run seed first!');
      return;
    }

    console.log(`📦 Found ${products.length} products`);

    // 3. Crear órdenes de prueba
    console.log('🛒 Creating demo orders...');

    const orders = [];
    const orderItems = [];

    // John's orders (Premium customer)
    for (let i = 0; i < 8; i++) {
      const orderId = `order_john_${i + 1}`;
      const randomProducts = products
        .sort(() => 0.5 - Math.random())
        .slice(0, Math.floor(Math.random() * 3) + 1);
      const totalPrice = randomProducts.reduce((sum, product) => sum + product.price, 0);

      const orderDate = new Date();
      orderDate.setDate(orderDate.getDate() - (i * 10 + Math.floor(Math.random() * 10)));

      orders.push({
        id: orderId,
        userId: 'user1',
        status: i < 6 ? StatusOrder.completed : StatusOrder.pending,
        totalPrice,
        createdAt: orderDate,
        updatedAt: orderDate,
      });

      randomProducts.forEach((product, index) => {
        orderItems.push({
          id: `item_john_${i + 1}_${index + 1}`,
          orderId,
          productId: product.id,
          quantity: Math.floor(Math.random() * 2) + 1,
          price: product.price,
          createdAt: orderDate,
          updatedAt: orderDate,
        });
      });
    }

    // Jane's orders (Gold customer)
    for (let i = 0; i < 5; i++) {
      const orderId = `order_jane_${i + 1}`;
      const randomProducts = products
        .sort(() => 0.5 - Math.random())
        .slice(0, Math.floor(Math.random() * 2) + 1);
      const totalPrice = randomProducts.reduce((sum, product) => sum + product.price, 0);

      const orderDate = new Date();
      orderDate.setDate(orderDate.getDate() - (i * 15 + Math.floor(Math.random() * 10)));

      orders.push({
        id: orderId,
        userId: 'user2',
        status: i < 4 ? StatusOrder.completed : StatusOrder.cancelled,
        totalPrice,
        createdAt: orderDate,
        updatedAt: orderDate,
      });

      randomProducts.forEach((product, index) => {
        orderItems.push({
          id: `item_jane_${i + 1}_${index + 1}`,
          orderId,
          productId: product.id,
          quantity: 1,
          price: product.price,
          createdAt: orderDate,
          updatedAt: orderDate,
        });
      });
    }

    // Michael's orders (Silver customer)
    for (let i = 0; i < 3; i++) {
      const orderId = `order_michael_${i + 1}`;
      const randomProducts = products.sort(() => 0.5 - Math.random()).slice(0, 1);
      const totalPrice = randomProducts.reduce((sum, product) => sum + product.price, 0);

      const orderDate = new Date();
      orderDate.setDate(orderDate.getDate() - (i * 20 + Math.floor(Math.random() * 15)));

      orders.push({
        id: orderId,
        userId: 'user3',
        status: StatusOrder.completed,
        totalPrice,
        createdAt: orderDate,
        updatedAt: orderDate,
      });

      randomProducts.forEach((product, index) => {
        orderItems.push({
          id: `item_michael_${i + 1}_${index + 1}`,
          orderId,
          productId: product.id,
          quantity: 1,
          price: product.price,
          createdAt: orderDate,
          updatedAt: orderDate,
        });
      });
    }

    // Emily's orders (Bronze customer - 1 order)
    const orderId = 'order_emily_1';
    const randomProduct = products[Math.floor(Math.random() * products.length)];
    const orderDate = new Date();
    orderDate.setDate(orderDate.getDate() - 60);

    orders.push({
      id: orderId,
      userId: 'user4',
      status: StatusOrder.completed,
      totalPrice: randomProduct.price,
      createdAt: orderDate,
      updatedAt: orderDate,
    });

    orderItems.push({
      id: 'item_emily_1_1',
      orderId,
      productId: randomProduct.id,
      quantity: 1,
      price: randomProduct.price,
      createdAt: orderDate,
      updatedAt: orderDate,
    });

    // 4. Insertar órdenes en la base de datos
    console.log('💾 Inserting orders into database...');

    for (const order of orders) {
      await prisma.orders.create({ data: order });
    }

    console.log(`✅ Created ${orders.length} orders`);

    // 5. Insertar items de órdenes
    console.log('📋 Inserting order items...');

    for (const item of orderItems) {
      await prisma.orderItems.create({ data: item });
    }

    console.log(`✅ Created ${orderItems.length} order items`);

    // 6. Mostrar resumen
    console.log('\n📊 Demo Data Summary:');
    console.log(`   👥 Users: ${users.length}`);
    console.log(`   🛒 Orders: ${orders.length}`);
    console.log(`   📋 Order Items: ${orderItems.length}`);
    console.log(
      `   💰 Total Revenue: $${orders
        .filter(o => o.status === StatusOrder.completed)
        .reduce((sum, o) => sum + o.totalPrice, 0)
        .toFixed(2)}`,
    );

    console.log('\n🎉 Demo data seeded successfully!');
    console.log('\n🚀 You can now test the Data Mining endpoints:');
    console.log('   📍 http://localhost:8080/api/analytics/customer-segments');
    console.log('   📍 http://localhost:8080/api/analytics/market-basket');
    console.log('   📍 http://localhost:8080/api/analytics/dashboard');
  } catch (error) {
    if ((error as any).code === 'P2002') {
      console.log('⚠️  Demo data already exists. Skipping...');
    } else {
      console.error('❌ Error seeding demo data:', error);
      throw error;
    }
  } finally {
    await prisma.$disconnect();
  }
}

// Run the seeding
seedDemoData().catch(console.error);
