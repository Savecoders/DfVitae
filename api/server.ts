import express, { type Request, type Response, type NextFunction, type Express } from 'express';
import cors from 'cors';
import getProductsScrape from './src/libs/products.scraping';
import { SeedService } from './src/services/seed.service';
import analyticsRoutes from './src/routes/analytics.routes';
import productsRoutes from './src/routes/products.routes';
import ordersRoutes from './src/routes/orders.routes';
import { errorHandler, notFoundHandler } from './src/middleware/errorHandler';
import { requestLogger, analyticsLogger } from './src/middleware/logger';

const app: Express = express();

// Middleware
app.use(express.json());
app.use(
  cors({
    origin: ['http://localhost:3000', 'http://localhost:5173'],
    credentials: true,
  }),
);

// Logging middleware
app.use(requestLogger);
app.use(analyticsLogger);

// Routes
app.use('/api/analytics', analyticsRoutes);
app.use('/api/products', productsRoutes);
app.use('/api/orders', ordersRoutes);

const port = process.env.PORT || 8080;

// Middleware to handle errors
// home route
app.get('/', async (req: Request, res: Response, next: NextFunction): Promise<void> => {
  try {
    res.status(200).json({
      message: '🚀 Tech Store Data Mining API - Ready for Business Intelligence!',
      success: true,
      version: '1.0.0',
      features: [
        '🔍 Customer Segmentation (K-Means)',
        '🛒 Market Basket Analysis (Apriori)',
        '📈 Sales Prediction (Linear Regression)',
        '📊 Comprehensive Analytics Dashboard',
        '🎯 Product Recommendations',
        '📋 Real-time Metrics',
      ],
      endpoints: {
        analytics: '/api/analytics',
        products: '/api/products',
        orders: '/api/orders',
        scraper: '/api/scrapper',
        seed: '/api/seed',
      },
      timestamp: new Date().toISOString(),
    });
  } catch (error: unknown) {
    next(error);
  }
});

// scraper fetch data
app.get('/api/scrapper', async (req: Request, res: Response, next: NextFunction): Promise<void> => {
  try {
    const products = await getProductsScrape();
    res.status(200).json({
      message: 'Products fetched successfully',
      success: true,
      data: products,
    });
  } catch (error: unknown) {
    next(new Error((error as Error).message));
  }
});

// seed data
app.get('/api/seed', async (req: Request, res: Response, next: NextFunction): Promise<void> => {
  try {
    const seedService = new SeedService();
    await seedService.seed();
    res.status(200).json({
      message: 'Database seeded successfully',
      success: true,
    });
  } catch (error: unknown) {
    next(new Error((error as Error).message));
  }
});

// Error handling middleware (debe ir al final)
app.use(notFoundHandler);
app.use(errorHandler);

app.listen(port, () => {
  console.log(`
🚀 ====================================
   Tech Store Data Mining API
🚀 ====================================
📡 Server running on port ${port}
🔗 API Base URL: http://localhost:${port}
📊 Analytics: http://localhost:${port}/api/analytics
🛍️  Products: http://localhost:${port}/api/products
📋 Orders: http://localhost:${port}/api/orders
⏰ Started at: ${new Date().toISOString()}
🚀 ====================================
  `);
});
