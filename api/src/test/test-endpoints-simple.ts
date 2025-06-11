#!/usr/bin/env bun
async function testEndpointsSimple() {
  console.log('🧪 Simple API Endpoint Test...\n');

  const baseUrl = 'http://localhost:3000';

  // Helper function to test an endpoint
  async function testEndpoint(name: string, endpoint: string) {
    try {
      console.log(`Testing ${name}...`);
      const response = await fetch(`${baseUrl}${endpoint}`);
      const data = await response.json();

      if (response.ok) {
        console.log(`✅ ${name}: Status ${response.status}`);
        return data;
      } else {
        console.log(`❌ ${name}: Status ${response.status} - ${data.message || 'Error'}`);
        return null;
      }
    } catch (error) {
      console.log(`⚠️ ${name}: Connection failed - Server might not be running`);
      return null;
    }
  }

  // Test all endpoints
  console.log('📡 Testing API endpoints (make sure server is running on port 3000)...\n');

  const results = {
    health: await testEndpoint('Health Check', '/api/analytics/health'),
    segments: await testEndpoint('Customer Segments', '/api/analytics/customer-segments'),
    basket: await testEndpoint('Market Basket', '/api/analytics/market-basket'),
    prediction: await testEndpoint(
      'Sales Prediction',
      '/api/analytics/predict-sales/00b98b2a-8b01-425c-9b0c-0b290d9c5d48',
    ),
    dashboard: await testEndpoint('Dashboard', '/api/analytics/dashboard'),
    summary: await testEndpoint('Summary', '/api/analytics/summary'),
  };

  console.log('\n📊 Test Results Summary:');
  console.log('=========================');

  const successCount = Object.values(results).filter(r => r !== null).length;
  const totalTests = Object.keys(results).length;

  console.log(`✅ Successful: ${successCount}/${totalTests}`);
  console.log(`❌ Failed: ${totalTests - successCount}/${totalTests}`);

  if (successCount === totalTests) {
    console.log('\n🎉 All endpoints are working correctly!');
    console.log('🚀 Your Data Mining API is ready for use!');
  } else {
    console.log('\n⚠️ Some endpoints failed. Make sure the server is running:');
    console.log('   bun run start');
  }

  return results;
}

// Show instructions if no server is running
console.log('🚀 Instructions:');
console.log('1. In one terminal, start the server: bun run start');
console.log('2. In another terminal, run this test: bun run src/scripts/test-endpoints-simple.ts');
console.log(
  '3. Or run both with: bun run start & sleep 3 && bun run src/scripts/test-endpoints-simple.ts\n',
);

testEndpointsSimple();
