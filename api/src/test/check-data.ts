#!/usr/bin/env bun
import { PrismaClient } from '../../generated/prisma';

const prisma = new PrismaClient();

async function checkData() {
  console.log('📋 Checking current data state...\n');

  // Check basic counts
  const userCount = await prisma.user.count();
  const productCount = await prisma.products.count();
  const orderCount = await prisma.orders.count();
  const orderItemCount = await prisma.orderItems.count();

  console.log(`👥 Users: ${userCount}`);
  console.log(`📦 Products: ${productCount}`);
  console.log(`📋 Orders: ${orderCount}`);
  console.log(`🛒 Order Items: ${orderItemCount}\n`);

  // Check order items distribution by product
  const productSales = await prisma.orderItems.groupBy({
    by: ['productId'],
    _count: {
      productId: true,
    },
    _sum: {
      quantity: true,
    },
    orderBy: {
      _count: {
        productId: 'desc',
      },
    },
    take: 10,
  });

  console.log('📊 Top 10 products by sales frequency:');
  for (const sale of productSales) {
    const product = await prisma.products.findUnique({
      where: { id: sale.productId },
      select: { title: true },
    });
    console.log(
      `   ${product?.title?.substring(0, 50)}... - ${sale._count.productId} orders, ${
        sale._sum.quantity
      } units`,
    );
  }

  // Check if we have products with multiple sales
  const productsWithMultipleSales = productSales.filter(p => p._count.productId >= 2);
  console.log(`\n🎯 Products with 2+ sales: ${productsWithMultipleSales.length}`);

  // Check order dates distribution
  const orderDates = await prisma.orders.findMany({
    select: {
      createdAt: true,
      status: true,
    },
    where: {
      status: 'completed',
    },
    orderBy: {
      createdAt: 'asc',
    },
  });

  console.log(`\n📅 Completed orders date range:`);
  if (orderDates.length > 0) {
    console.log(`   From: ${orderDates[0].createdAt.toISOString().split('T')[0]}`);
    console.log(
      `   To: ${orderDates[orderDates.length - 1].createdAt.toISOString().split('T')[0]}`,
    );
    console.log(`   Count: ${orderDates.length}`);
  }

  await prisma.$disconnect();
}

checkData().catch(console.error);
