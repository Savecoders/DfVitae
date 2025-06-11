export interface Details {
  id: string;
  ref: string;
  reference: string;
  description: string;
  warranty: string;
  createdAt: Date;
  updatedAt: Date;
  productId: string;
}

// Interface for scraped product data (before saving to database)
export interface ScrapedProduct {
  title: string;
  price: number;
  stock?: number;
  imageUrl?: string;
  availability?: boolean;
  details?: Partial<Details>[];
}

export interface Product {
  id: string;
  title: string;
  price: number;
  stock?: number;
  imageUrl?: string;
  createdAt: Date;
  updatedAt: Date;
  availability?: boolean;
  details?: Details[];
}

export interface ProductWithSales extends Product {
  totalSales: number;
  averageRating?: number;
  salesTrend: number[];
}

export interface ProductPrediction {
  productId: string;
  product: Product;
  predictedSales: number[];
  accuracy: number;
  trend: 'up' | 'down' | 'stable';
}

export interface ProductCategory {
  name: string;
  keywords: string[];
}

export interface MarketBasketItem {
  productId: string;
  productName: string;
  frequency: number;
}
