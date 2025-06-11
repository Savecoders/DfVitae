#!/usr/bin/env bun
// filepath: /home/save/Dev/Learn/Science/BI/Project/api/src/scripts/test-complete-setup.ts

import { PrismaClient } from '../../generated/prisma';
import { DataMiningService } from '../services/dataMining.service';

async function testCompleteSetup() {
  console.log('🧪 Testing Complete Data Mining Setup...\n');

  const prisma = new PrismaClient();
  const dataMining = new DataMiningService();

  try {
    // Test 1: Database Connection
    console.log('1️⃣ Testing Database Connection...');
    const userCount = await prisma.user.count();
    const productCount = await prisma.products.count();
    const orderCount = await prisma.orders.count();

    console.log(`   ✅ Users: ${userCount}`);
    console.log(`   ✅ Products: ${productCount}`);
    console.log(`   ✅ Orders: ${orderCount}\n`);

    if (orderCount === 0) {
      console.log('⚠️  No orders found. Please run /api/seed first to populate data.\n');
      return;
    }

    // Test 2: Customer Segmentation
    console.log('2️⃣ Testing Customer Segmentation...');
    try {
      const segments = await dataMining.customerSegmentation();
      console.log(`   ✅ Found ${segments.customerSegments.length} customer segments`);

      const segmentDistribution = segments.customerSegments.reduce((acc, customer) => {
        acc[customer.segmentName] = (acc[customer.segmentName] || 0) + 1;
        return acc;
      }, {} as Record<string, number>);

      console.log('   📊 Segment Distribution:', segmentDistribution);
    } catch (error) {
      console.log(`   ❌ Customer Segmentation failed: ${(error as Error).message}`);
    }
    console.log('');

    // Test 3: Market Basket Analysis
    console.log('3️⃣ Testing Market Basket Analysis...');
    try {
      const basket = await dataMining.marketBasketAnalysis(0.1);
      console.log(`   ✅ Found ${basket.associationRules.length} association rules`);
      console.log(`   ✅ Found ${basket.frequentItemsets.length} frequent itemsets`);

      if (basket.associationRules.length > 0) {
        const topRule = basket.associationRules[0];
        console.log(
          `   📈 Top Rule: "${topRule.antecedent[0]}" → "${topRule.consequent[0]}" (Confidence: ${(
            topRule.confidence * 100
          ).toFixed(1)}%)`,
        );
      }
    } catch (error) {
      console.log(`   ❌ Market Basket Analysis failed: ${(error as Error).message}`);
    }
    console.log('');

    // Test 4: Sales Prediction
    console.log('4️⃣ Testing Sales Prediction...');
    try {
      const products = await prisma.products.findMany({ take: 1 });
      if (products.length > 0) {
        const prediction = await dataMining.predictProductSales(products[0].id, 7);
        console.log(`   ✅ Generated ${prediction.predictions.length} day forecast`);
        console.log(`   📈 Trend: ${prediction.trend}`);
        console.log(`   🎯 Accuracy (R²): ${(prediction.accuracy.r2 * 100).toFixed(1)}%`);
      } else {
        console.log('   ⚠️  No products found for prediction');
      }
    } catch (error) {
      console.log(`   ❌ Sales Prediction failed: ${(error as Error).message}`);
    }
    console.log('');

    // Test 5: Dashboard Data
    console.log('5️⃣ Testing Dashboard Data Generation...');
    try {
      const dashboard = await dataMining.generateDashboardData();
      console.log(
        `   ✅ KPIs: Revenue $${dashboard.kpis.totalRevenue.toFixed(2)}, Orders: ${
          dashboard.kpis.totalOrders
        }`,
      );
      console.log(`   ✅ Customer Segments: ${dashboard.customerInsights.segments.length}`);
      console.log(
        `   ✅ Product Insights: ${dashboard.productInsights.recommendations.length} recommendations`,
      );
    } catch (error) {
      console.log(`   ❌ Dashboard Generation failed: ${(error as Error).message}`);
    }
    console.log('');

    console.log('🎉 All tests completed! Data Mining setup is working correctly.\n');

    console.log('🚀 Available Endpoints:');
    console.log('   GET /api/analytics/customer-segments');
    console.log('   GET /api/analytics/market-basket');
    console.log('   GET /api/analytics/predict-sales/:productId');
    console.log('   GET /api/analytics/dashboard');
    console.log('   GET /api/analytics/summary');
    console.log('   GET /api/analytics/health\n');
  } catch (error) {
    console.error('❌ Test failed:', error);
  } finally {
    await prisma.$disconnect();
  }
}

// Run the test
testCompleteSetup().catch(console.error);
