import { PrismaClient } from '../../generated/prisma';

async function healthCheck() {
  console.log('🔍 Running Health Check...\n');

  const prisma = new PrismaClient();
  const errors: string[] = [];
  const warnings: string[] = [];

  try {
    // Test 1: Database Connection
    console.log('1. Testing database connection...');
    await prisma.$connect();
    console.log('   ✅ Database connected successfully');

    // Test 2: Check Tables
    console.log('2. Checking database tables...');
    const [userCount, productCount, orderCount, orderItemCount] = await Promise.all([
      prisma.user.count(),
      prisma.products.count(),
      prisma.orders.count(),
      prisma.orderItems.count(),
    ]);

    console.log(`   📊 Users: ${userCount}`);
    console.log(`   📦 Products: ${productCount}`);
    console.log(`   📋 Orders: ${orderCount}`);
    console.log(`   🛒 Order Items: ${orderItemCount}`);

    if (userCount === 0) warnings.push('No users found - run seed data');
    if (productCount === 0) warnings.push('No products found - run scraper');
    if (orderCount === 0) warnings.push('No orders found - generate test orders');
    if (orderItemCount === 0) warnings.push('No order items found');

    // Test 3: Data Integrity
    console.log('3. Checking data integrity...');

    // Check for orders without items
    const ordersWithoutItems = await prisma.orders.findMany({
      where: {
        items: {
          none: {},
        },
      },
    });

    if (ordersWithoutItems.length > 0) {
      warnings.push(`${ordersWithoutItems.length} orders found without items`);
    }

    // Check for completed orders
    const completedOrders = await prisma.orders.count({
      where: { status: 'completed' },
    });

    if (completedOrders === 0) {
      warnings.push('No completed orders found - needed for analytics');
    } else {
      console.log(`   ✅ ${completedOrders} completed orders available for analysis`);
    }

    // Test 4: ML Dependencies
    console.log('4. Testing ML dependencies...');
    try {
      const { Matrix } = await import('ml-matrix');
      const KMeans = await import('ml-kmeans');
      const { SimpleLinearRegression } = await import('../utils/simple-regression');
      console.log('   ✅ All ML libraries loaded successfully');
    } catch (error) {
      errors.push(`ML dependencies error: ${error}`);
    }

    // Test 5: Data Mining Service
    console.log('5. Testing Data Mining Service...');
    try {
      const { DataMiningService } = await import('../services/dataMining.service');
      const service = new DataMiningService();

      // Quick test - just check if methods exist
      if (
        typeof service.customerSegmentation === 'function' &&
        typeof service.marketBasketAnalysis === 'function' &&
        typeof service.predictProductSales === 'function'
      ) {
        console.log('   ✅ Data Mining Service initialized correctly');
      } else {
        errors.push('Data Mining Service methods not found');
      }
    } catch (error) {
      errors.push(`Data Mining Service error: ${error}`);
    }

    // Summary
    console.log('\n📋 HEALTH CHECK SUMMARY');
    console.log('========================');

    if (errors.length === 0) {
      console.log('🟢 Status: HEALTHY');
    } else {
      console.log('🔴 Status: ERROR');
      console.log('\n❌ Errors:');
      errors.forEach(error => console.log(`   - ${error}`));
    }

    if (warnings.length > 0) {
      console.log('\n⚠️  Warnings:');
      warnings.forEach(warning => console.log(`   - ${warning}`));
    }

    if (errors.length === 0 && warnings.length === 0) {
      console.log('\n🎉 System is ready for Data Mining operations!');
      console.log('🚀 You can now start the server and test the analytics endpoints.');
    }

    console.log('\n📡 Available endpoints when server is running:');
    console.log('   - GET  /api/analytics/customer-segments');
    console.log('   - GET  /api/analytics/market-basket');
    console.log('   - GET  /api/analytics/predict-sales/:productId');
    console.log('   - GET  /api/analytics/dashboard');
    console.log('   - GET  /api/analytics/summary');
    console.log('   - GET  /api/products');
    console.log('   - GET  /api/orders');
  } catch (error) {
    console.error('❌ Health check failed:', error);
    return false;
  } finally {
    await prisma.$disconnect();
  }

  return errors.length === 0;
}

// Ejecutar si se llama directamente
if (require.main === module) {
  healthCheck()
    .then(success => process.exit(success ? 0 : 1))
    .catch(() => process.exit(1));
}

export { healthCheck };
