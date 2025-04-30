import express, { type Request, type Response, type NextFunction, type Express } from 'express';
import getProductsScrape from './src/libs/products.scraping';
import { SeedService } from './src/services/Seed.service';
const app: Express = express();

app.use(express.json());

const port = process.env.PORT || 8080;

// Middleware to handle errors
// home route
app.get('/', async (req: Request, res: Response, next: NextFunction): Promise<void> => {
  try {
    res.status(200).json({
      message: 'Hurray!! we create our first server on bun js',
      success: true,
    });
  } catch (error: unknown) {
    res.status(500).json({
      message: 'Internal server error',
      success: false,
      error: (error as Error).message,
    });
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

app.listen(port, () => {
  console.log(`Server is up and running on port ${port}`);
});
