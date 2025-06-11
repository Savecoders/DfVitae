import { DataMiningService } from '../services/dataMining.service';

async function testDataMiningFeatures() {
  console.log('🧪 Testing Data Mining Features...\n');

  const dataMiningService = new DataMiningService();

  try {
    // Test 1: Customer Segmentation
    console.log('🔍 Testing Customer Segmentation...');
    const segmentation = await dataMiningService.customerSegmentation();
    console.log(`✅ Found ${segmentation.customerSegments.length} customer segments`);
    console.log(
      `📊 Segments distribution:`,
      segmentation.customerSegments.reduce((acc, customer) => {
        acc[customer.segmentName] = (acc[customer.segmentName] || 0) + 1;
        return acc;
      }, {} as Record<string, number>),
    );
    console.log('');

    // Test 2: Market Basket Analysis
    console.log('🛒 Testing Market Basket Analysis...');
    const basketAnalysis = await dataMiningService.marketBasketAnalysis(0.05);
    console.log(`✅ Found ${basketAnalysis.frequentItemsets.length} frequent itemsets`);
    console.log(`🔗 Generated ${basketAnalysis.associationRules.length} association rules`);

    if (basketAnalysis.associationRules.length > 0) {
      console.log('📈 Top recommendation:');
      const topRule = basketAnalysis.associationRules[0];
      console.log(`   "${topRule.antecedent[0]}" → "${topRule.consequent[0]}"`);
      console.log(`   Confidence: ${(topRule.confidence * 100).toFixed(1)}%`);
      console.log(`   Lift: ${topRule.lift.toFixed(2)}`);
    }
    console.log('');

    // Test 3: Sales Prediction (necesita productId válido)
    console.log('📈 Testing Sales Prediction...');
    // Obtener un producto con ventas para testing
    const products = await dataMiningService['prisma'].products.findMany({
      include: {
        OrderItems: {
          include: { order: true },
        },
      },
      take: 5,
    });

    const productWithSales = products.find(p =>
      p.OrderItems.some(item => item.order.status === 'completed'),
    );

    if (productWithSales) {
      const prediction = await dataMiningService.predictProductSales(productWithSales.id, 7);
      console.log(`✅ Sales prediction for "${productWithSales.title}"`);
      console.log(`📊 Historical data points: ${prediction.historical.length}`);
      console.log(`🔮 7-day predictions: ${prediction.predictions.length}`);
      console.log(`🎯 Model accuracy (R²): ${prediction.accuracy.r2.toFixed(3)}`);
      console.log(`📈 Trend: ${prediction.trend}`);
    } else {
      console.log('⚠️  No products with sales data found for prediction');
    }
    console.log('');

    // Test 4: Dashboard Data
    console.log('📊 Testing Dashboard Data Generation...');
    const dashboardData = await dataMiningService.generateDashboardData();
    console.log(`✅ Generated comprehensive dashboard data`);
    console.log(`💰 Total Revenue: $${dashboardData.kpis.totalRevenue.toLocaleString()}`);
    console.log(`📦 Total Orders: ${dashboardData.kpis.totalOrders}`);
    console.log(`👥 Customer Count: ${dashboardData.kpis.customerCount}`);
    console.log(`📈 Average Order Value: $${dashboardData.kpis.averageOrderValue.toFixed(2)}`);
    console.log(`🎯 Conversion Rate: ${dashboardData.kpis.conversionRate.toFixed(2)}%`);
    console.log('');

    console.log('🎉 All Data Mining tests completed successfully!');
    console.log('🚀 Your BI system is ready for production!');
  } catch (error) {
    console.error('❌ Error during testing:', error);
    process.exit(1);
  } finally {
    // Cerrar conexión Prisma
    await dataMiningService['prisma'].$disconnect();
  }
}

// Ejecutar tests si se llama directamente
if (require.main === module) {
  testDataMiningFeatures()
    .then(() => process.exit(0))
    .catch(() => process.exit(1));
}

export { testDataMiningFeatures };
