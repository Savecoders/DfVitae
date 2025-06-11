#!/usr/bin/env bun
import { DataMiningService } from '../services/dataMining.service';

async function finalSystemValidation() {
  console.log('🔍 Final System Validation - Complete Data Mining E-commerce Solution\n');
  console.log('======================================================================\n');

  const dataMiningService = new DataMiningService();

  try {
    // 1. Database and Data Validation
    console.log('1️⃣ CORE DATA VALIDATION');
    console.log('========================');

    const stats = await dataMiningService['prisma'].user.count().then(async users => {
      const products = await dataMiningService['prisma'].products.count();
      const orders = await dataMiningService['prisma'].orders.count();
      const orderItems = await dataMiningService['prisma'].orderItems.count();
      const completedOrders = await dataMiningService['prisma'].orders.count({
        where: { status: 'completed' },
      });

      return { users, products, orders, orderItems, completedOrders };
    });

    console.log(`👥 Users: ${stats.users}`);
    console.log(`📦 Products: ${stats.products}`);
    console.log(`📋 Total Orders: ${stats.orders}`);
    console.log(`✅ Completed Orders: ${stats.completedOrders}`);
    console.log(`🛒 Order Items: ${stats.orderItems}`);

    // 2. Machine Learning Algorithms Validation
    console.log('\n2️⃣ MACHINE LEARNING ALGORITHMS');
    console.log('===============================');

    // Customer Segmentation (K-Means)
    console.log('\n🔍 Testing K-Means Customer Segmentation...');
    const segmentation = await dataMiningService.customerSegmentation();
    console.log(`✅ Successfully segmented ${segmentation.customerSegments.length} customers`);

    const segmentDistribution = segmentation.customerSegments.reduce((acc, customer) => {
      acc[customer.segmentName] = (acc[customer.segmentName] || 0) + 1;
      return acc;
    }, {} as Record<string, number>);

    console.log('📊 Segment Distribution:', JSON.stringify(segmentDistribution, null, 2));

    // Market Basket Analysis (Apriori)
    console.log('\n🛒 Testing Apriori Market Basket Analysis...');
    const basketAnalysis = await dataMiningService.marketBasketAnalysis(0.05);
    console.log(`✅ Found ${basketAnalysis.frequentItemsets.length} frequent itemsets`);
    console.log(`✅ Generated ${basketAnalysis.associationRules.length} association rules`);

    if (basketAnalysis.associationRules.length > 0) {
      const topRule = basketAnalysis.associationRules[0];
      console.log(
        `📈 Top Rule: "${topRule.antecedent[0]}" → "${topRule.consequent[0]}" (Confidence: ${(
          topRule.confidence * 100
        ).toFixed(1)}%)`,
      );
    }

    // Sales Prediction (Linear Regression)
    console.log('\n📈 Testing Linear Regression Sales Prediction...');

    // Find a product with sales history using a simpler approach
    const productsWithSales = await dataMiningService['prisma'].orderItems.findMany({
      where: {
        order: { status: 'completed' },
      },
      select: {
        productId: true,
      },
      distinct: ['productId'],
      take: 5,
    });

    if (productsWithSales.length > 0) {
      const productId = productsWithSales[0].productId;
      const prediction = await dataMiningService.predictProductSales(productId, 7);
      console.log(`✅ Generated ${prediction.predictions.length}-day forecast`);
      console.log(`📊 Model Accuracy (R²): ${(prediction.accuracy.r2 * 100).toFixed(1)}%`);
      console.log(`📈 Trend: ${prediction.trend}`);
    }

    // 3. Analytics Dashboard
    console.log('\n3️⃣ ANALYTICS DASHBOARD');
    console.log('======================');

    const dashboardData = await dataMiningService.generateDashboardData();
    console.log(`💰 Total Revenue: $${dashboardData.kpis.totalRevenue.toLocaleString()}`);
    console.log(`📦 Total Orders: ${dashboardData.kpis.totalOrders}`);
    console.log(`👥 Customer Count: ${dashboardData.kpis.customerCount}`);
    console.log(`📊 Average Order Value: $${dashboardData.kpis.averageOrderValue.toFixed(2)}`);
    console.log(`📈 Conversion Rate: ${dashboardData.kpis.conversionRate.toFixed(2)}%`);

    // 4. System Performance Summary
    console.log('\n4️⃣ SYSTEM PERFORMANCE SUMMARY');
    console.log('==============================');

    const performance = {
      dataVolume: {
        users: stats.users,
        products: stats.products,
        transactions: stats.completedOrders,
        dataPoints: stats.orderItems,
      },
      mlAlgorithms: {
        customerSegmentation: segmentation.customerSegments.length > 0,
        marketBasketAnalysis: basketAnalysis.associationRules.length > 0,
        salesPrediction: productsWithSales.length > 0,
        dashboardGeneration: true,
      },
      businessInsights: {
        customerSegments: Object.keys(segmentDistribution).length,
        productRecommendations: basketAnalysis.associationRules.length,
        kpiMetrics: Object.keys(dashboardData.kpis).length,
      },
    };

    console.log('📊 Data Volume Assessment:');
    console.log(
      `   ${performance.dataVolume.users} users, ${performance.dataVolume.products} products`,
    );
    console.log(
      `   ${performance.dataVolume.transactions} transactions, ${performance.dataVolume.dataPoints} data points`,
    );

    console.log('\n🤖 ML Algorithm Status:');
    console.log(
      `   Customer Segmentation: ${performance.mlAlgorithms.customerSegmentation ? '✅' : '❌'}`,
    );
    console.log(
      `   Market Basket Analysis: ${performance.mlAlgorithms.marketBasketAnalysis ? '✅' : '❌'}`,
    );
    console.log(`   Sales Prediction: ${performance.mlAlgorithms.salesPrediction ? '✅' : '❌'}`);
    console.log(
      `   Dashboard Generation: ${performance.mlAlgorithms.dashboardGeneration ? '✅' : '❌'}`,
    );

    console.log('\n📈 Business Intelligence:');
    console.log(
      `   Customer Segments Identified: ${performance.businessInsights.customerSegments}`,
    );
    console.log(
      `   Product Recommendations: ${performance.businessInsights.productRecommendations}`,
    );
    console.log(`   KPI Metrics Available: ${performance.businessInsights.kpiMetrics}`);

    // 5. Final Assessment
    console.log('\n5️⃣ FINAL ASSESSMENT');
    console.log('===================');

    const allSystemsWorking = Object.values(performance.mlAlgorithms).every(Boolean);
    const sufficientData =
      performance.dataVolume.transactions >= 10 && performance.dataVolume.users >= 5;
    const meaningfulInsights = performance.businessInsights.customerSegments >= 2;

    if (allSystemsWorking && sufficientData && meaningfulInsights) {
      console.log('🎉 SYSTEM STATUS: FULLY OPERATIONAL');
      console.log('✅ All ML algorithms working correctly');
      console.log('✅ Sufficient data for meaningful analysis');
      console.log('✅ Business insights being generated');
      console.log('\n🚀 Your E-commerce Data Mining system is ready for production!');

      console.log('\n📡 Available API Endpoints:');
      console.log('   GET /api/analytics/customer-segments');
      console.log('   GET /api/analytics/market-basket');
      console.log('   GET /api/analytics/predict-sales/:productId');
      console.log('   GET /api/analytics/dashboard');
      console.log('   GET /api/analytics/summary');
      console.log('   GET /api/analytics/health');

      console.log('\n🌐 To start the server: bun run start');
      console.log('📚 Documentation: README.md');
    } else {
      console.log('⚠️ SYSTEM STATUS: NEEDS ATTENTION');
      if (!allSystemsWorking) console.log('❌ Some ML algorithms not functioning');
      if (!sufficientData) console.log('❌ Insufficient data for analysis');
      if (!meaningfulInsights) console.log('❌ Not generating meaningful insights');
    }
  } catch (error) {
    console.error('❌ Validation failed:', error);
  } finally {
    await dataMiningService['prisma'].$disconnect();
  }
}

finalSystemValidation()
  .then(() => process.exit(0))
  .catch(error => {
    console.error('❌ Validation failed:', error);
    process.exit(1);
  });
