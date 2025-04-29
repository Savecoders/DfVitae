import express, { type Request, type Response, type NextFunction, type Express } from 'express';
import getProductsScrape from './src/libs/products.scraping';
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
    next(new Error((error as Error).message));
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

app.listen(port, () => {
  console.log(`Server is up and running on port ${port}`);
});
