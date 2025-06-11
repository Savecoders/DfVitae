// Customer Segmentation Types
export interface CustomerSegmentData {
  userId: string;
  recency: number;
  frequency: number;
  monetary: number;
  segment: number;
  segmentName: 'Premium' | 'Gold' | 'Silver' | 'Bronze';
}

export interface ClusterResult {
  clusters: number[];
  centroids: number[][];
  customerSegments: CustomerSegmentData[];
  silhouetteScore?: number;
}

// Market Basket Analysis Types
export interface Transaction {
  transactionId: string;
  items: string[];
  userId: string;
  date: Date;
}

export interface FrequentItemset {
  itemset: string[];
  support: number;
  count: number;
}

export interface AssociationRule {
  antecedent: string[];
  consequent: string[];
  support: number;
  confidence: number;
  lift: number;
  conviction: number;
  leverage: number;
}

export interface MarketBasketResult {
  frequentItemsets: FrequentItemset[];
  associationRules: AssociationRule[];
  insights: string[];
}

// Sales Prediction Types
export interface SalesPredictionData {
  date: string;
  sales: number;
  predicted?: number;
  confidence?: number;
}

export interface PredictionResult {
  productId: string;
  historical: SalesPredictionData[];
  predictions: SalesPredictionData[];
  accuracy: {
    mse: number;
    rmse: number;
    mae: number;
    r2: number;
  };
  trend: 'increasing' | 'decreasing' | 'stable';
  seasonality?: boolean;
}

// Analytics Dashboard Types
export interface KPIMetrics {
  totalRevenue: number;
  totalOrders: number;
  averageOrderValue: number;
  customerCount: number;
  conversionRate: number;
  topProducts: Array<{
    productId: string;
    productName: string;
    sales: number;
    revenue: number;
  }>;
}

export interface CustomerInsights {
  segments: CustomerSegmentData[];
  churnRisk: Array<{
    userId: string;
    riskScore: number;
    lastOrderDate: Date;
  }>;
  lifetimeValue: Array<{
    userId: string;
    ltv: number;
    predictedLtv: number;
  }>;
}

export interface ProductInsights {
  recommendations: AssociationRule[];
  demandForecast: PredictionResult[];
  inventoryOptimization: Array<{
    productId: string;
    currentStock: number;
    recommendedStock: number;
    reason: string;
  }>;
}

export interface DashboardData {
  kpis: KPIMetrics;
  customerInsights: CustomerInsights;
  productInsights: ProductInsights;
  trends: {
    salesTrend: Array<{ date: string; sales: number; orders: number }>;
    categoryTrends: Array<{ category: string; growth: number }>;
  };
}

// Machine Learning Types
export interface MLFeatures {
  [key: string]: number | string | boolean;
}

export interface TrainingData {
  features: MLFeatures[];
  labels: number[];
  testSize?: number;
  validationSize?: number;
}

export interface ModelPerformance {
  accuracy: number;
  precision: number;
  recall: number;
  f1Score: number;
  confusion_matrix?: number[][];
  roc_auc?: number;
}

export interface MLModel {
  type: 'classification' | 'regression' | 'clustering';
  algorithm: string;
  parameters: Record<string, any>;
  performance: ModelPerformance;
  createdAt: Date;
  version: string;
}

// Time Series Analysis
export interface TimeSeriesPoint {
  timestamp: Date;
  value: number;
  trend?: number;
  seasonal?: number;
  residual?: number;
}

export interface TimeSeriesAnalysis {
  data: TimeSeriesPoint[];
  decomposition: {
    trend: number[];
    seasonal: number[];
    residual: number[];
  };
  stationarity: {
    isStationary: boolean;
    pValue: number;
    criticalValues: Record<string, number>;
  };
  forecasts: TimeSeriesPoint[];
}

// Recommendation System Types
export interface RecommendationInput {
  userId?: string;
  productId?: string;
  category?: string;
  limit?: number;
}

export interface Recommendation {
  productId: string;
  productName: string;
  score: number;
  reason: string;
  type: 'collaborative' | 'content-based' | 'hybrid';
}

export interface RecommendationResult {
  recommendations: Recommendation[];
  confidence: number;
  algorithm: string;
  context: RecommendationInput;
}
