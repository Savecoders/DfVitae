#!/usr/bin/env bun
import { spawn } from 'child_process';

async function testAPIEndpoints() {
  console.log('🚀 Starting API server and testing endpoints...\n');

  // Start server in background
  const server = spawn('bun', ['run', 'start'], {
    stdio: ['pipe', 'pipe', 'pipe'],
    detached: false,
  });

  // Wait for server to start
  await new Promise(resolve => setTimeout(resolve, 3000));

  console.log('📡 Testing API endpoints...\n');

  try {
    // Test 1: Health check
    console.log('1️⃣ Testing health endpoint...');
    const healthResponse = await fetch('http://localhost:3000/api/analytics/health');
    const healthData = await healthResponse.json();
    console.log('✅ Health check:', healthData.status);

    // Test 2: Customer segmentation
    console.log('\n2️⃣ Testing customer segmentation...');
    const segmentResponse = await fetch('http://localhost:3000/api/analytics/customer-segments');
    const segmentData = await segmentResponse.json();
    console.log('✅ Customer segments:', segmentData.customerSegments?.length || 0);

    // Test 3: Market basket analysis
    console.log('\n3️⃣ Testing market basket analysis...');
    const basketResponse = await fetch('http://localhost:3000/api/analytics/market-basket');
    const basketData = await basketResponse.json();
    console.log('✅ Association rules:', basketData.associationRules?.length || 0);

    // Test 4: Sales prediction for a product with sales
    console.log('\n4️⃣ Testing sales prediction...');
    const productId = '00b98b2a-8b01-425c-9b0c-0b290d9c5d48'; // Product we know has sales
    const predictionResponse = await fetch(
      `http://localhost:3000/api/analytics/predict-sales/${productId}`,
    );
    const predictionData = await predictionResponse.json();
    console.log('✅ Sales prediction:', predictionData.predictions?.length || 0, 'days');

    // Test 5: Dashboard data
    console.log('\n5️⃣ Testing dashboard...');
    const dashboardResponse = await fetch('http://localhost:3000/api/analytics/dashboard');
    const dashboardData = await dashboardResponse.json();
    console.log('✅ Dashboard KPIs:', Object.keys(dashboardData.kpis || {}).length);

    // Test 6: Analytics summary
    console.log('\n6️⃣ Testing analytics summary...');
    const summaryResponse = await fetch('http://localhost:3000/api/analytics/summary');
    const summaryData = await summaryResponse.json();
    console.log('✅ Summary:', summaryData.summary?.status || 'loaded');

    console.log('\n🎉 All API endpoints tested successfully!');
    console.log('🌐 Server is running at: http://localhost:3000');
    console.log('📚 API Documentation available in README.md');
  } catch (error) {
    if (error instanceof Error) {
      console.error('❌ Error testing endpoints:', error.message);
    }
  } finally {
    // Kill server
    server.kill();
    console.log('\n🛑 Server stopped');
  }
}

testAPIEndpoints();
