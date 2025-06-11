import { Router } from 'express';
import type { Request, Response } from 'express';
import { DataMiningService } from '../services/dataMining.service';

const router = Router();
const dataMiningService = new DataMiningService();

/**
 * GET /api/analytics/customer-segments
 * Obtiene la segmentación de clientes usando K-Means clustering
 */
router.get('/customer-segments', async (req: any, res: any) => {
  try {
    const segments = await dataMiningService.customerSegmentation();

    res.json({
      success: true,
      data: segments,
      message: 'Customer segmentation completed successfully',
      timestamp: new Date().toISOString(),
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Failed to perform customer segmentation',
      details: error instanceof Error ? error.message : 'Unknown error',
      timestamp: new Date().toISOString(),
    });
  }
});

// ==================== MARKET BASKET ANALYSIS ====================

/**
 * GET /api/analytics/market-basket
 * Realiza análisis de cesta de mercado (Market Basket Analysis)
 * Query params: minSupport (default: 0.05)
 */
router.get('/market-basket', async (req: any, res: any) => {
  try {
    const { minSupport = '0.05' } = req.query;
    const supportThreshold = parseFloat(minSupport as string);

    if (supportThreshold < 0 || supportThreshold > 1) {
      return res.status(400).json({
        success: false,
        error: 'minSupport must be between 0 and 1',
        timestamp: new Date().toISOString(),
      });
    }

    const basketAnalysis = await dataMiningService.marketBasketAnalysis(supportThreshold);

    res.json({
      success: true,
      data: basketAnalysis,
      parameters: { minSupport: supportThreshold },
      message: 'Market basket analysis completed successfully',
      timestamp: new Date().toISOString(),
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Failed to perform market basket analysis',
      details: error instanceof Error ? error.message : 'Unknown error',
      timestamp: new Date().toISOString(),
    });
  }
});

// ==================== SALES PREDICTION ====================

/**
 * GET /api/analytics/predict-sales/:productId
 * Predice las ventas futuras de un producto específico
 * Params: productId
 * Query params: days (default: 30)
 */
router.get('/predict-sales/:productId', async (req: any, res: any) => {
  try {
    const { productId } = req.params;
    const { days = '30' } = req.query;

    const daysToPredict = parseInt(days as string);

    if (isNaN(daysToPredict) || daysToPredict < 1 || daysToPredict > 365) {
      return res.status(400).json({
        success: false,
        error: 'days must be a number between 1 and 365',
        timestamp: new Date().toISOString(),
      });
    }

    const prediction = await dataMiningService.predictProductSales(productId, daysToPredict);

    res.json({
      success: true,
      data: prediction,
      parameters: { productId, days: daysToPredict },
      message: 'Sales prediction completed successfully',
      timestamp: new Date().toISOString(),
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Failed to predict sales',
      details: error instanceof Error ? error.message : 'Unknown error',
      timestamp: new Date().toISOString(),
    });
  }
});

// ==================== COMPREHENSIVE DASHBOARD ====================

/**
 * GET /api/analytics/dashboard
 * Obtiene todos los datos analíticos para el dashboard
 */
router.get('/dashboard', async (req: any, res: any) => {
  try {
    console.log('📊 Processing comprehensive dashboard request...');

    const dashboardData = await dataMiningService.generateDashboardData();

    res.json({
      success: true,
      data: dashboardData,
      message: 'Dashboard data generated successfully',
      timestamp: new Date().toISOString(),
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Failed to generate dashboard data',
      details: error instanceof Error ? error.message : 'Unknown error',
      timestamp: new Date().toISOString(),
    });
  }
});

// ==================== ANALYTICS SUMMARY ====================

/**
 * GET /api/analytics/summary
 * Obtiene un resumen rápido de métricas principales
 */
router.get('/summary', async (req: any, res: any) => {
  try {
    console.log('📋 Processing analytics summary request...');

    const [segments, basket] = await Promise.all([
      dataMiningService.customerSegmentation(),
      dataMiningService.marketBasketAnalysis(0.1),
    ]);

    const summary = {
      customerSegments: {
        total: segments.customerSegments.length,
        distribution: segments.customerSegments.reduce((acc, customer) => {
          acc[customer.segmentName] = (acc[customer.segmentName] || 0) + 1;
          return acc;
        }, {} as Record<string, number>),
      },
      marketBasket: {
        totalRules: basket.associationRules.length,
        strongRules: basket.associationRules.filter(rule => rule.confidence > 0.7).length,
        topRecommendations: basket.associationRules.slice(0, 3).map(rule => ({
          from: rule.antecedent[0],
          to: rule.consequent[0],
          confidence: Math.round(rule.confidence * 100),
          lift: Math.round(rule.lift * 100) / 100,
        })),
      },
      insights: [
        ...basket.insights.slice(0, 3),
        `Found ${segments.customerSegments.length} customers across ${
          Object.keys(
            segments.customerSegments.reduce((acc, c) => ({ ...acc, [c.segmentName]: true }), {}),
          ).length
        } segments`,
      ],
    };

    res.json({
      success: true,
      data: summary,
      message: 'Analytics summary generated successfully',
      timestamp: new Date().toISOString(),
    });
  } catch (error) {
    console.error('❌ Analytics summary error:', error);
    res.status(500).json({
      success: false,
      error: 'Failed to generate analytics summary',
      details: error instanceof Error ? error.message : 'Unknown error',
      timestamp: new Date().toISOString(),
    });
  }
});

// ==================== HEALTH CHECK ====================

/**
 * GET /api/analytics/health
 * Verifica el estado del servicio de analytics
 */
router.get('/health', (req: any, res: any) => {
  res.json({
    success: true,
    service: 'Data Mining Analytics API',
    status: 'healthy',
    version: '1.0.0',
    endpoints: [
      'GET /api/analytics/customer-segments',
      'GET /api/analytics/market-basket',
      'GET /api/analytics/predict-sales/:productId',
      'GET /api/analytics/dashboard',
      'GET /api/analytics/summary',
      'GET /api/analytics/health',
    ],
    timestamp: new Date().toISOString(),
  });
});

export default router;
