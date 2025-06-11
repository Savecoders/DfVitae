import { Router } from 'express';
import { ProductsController } from '../controllers/products.controller';

const router = Router();
const productsController = new ProductsController();

/**
 * GET /api/products
 * Obtiene todos los productos con paginación y búsqueda
 * Query params: page, limit, search
 */
router.get('/', async (req, res) => {
  await productsController.getAllProducts(req, res);
});

/**
 * GET /api/products/top-selling
 * Obtiene los productos más vendidos
 * Query params: limit (default: 10)
 */
router.get('/top-selling', async (req, res) => {
  await productsController.getTopSellingProducts(req, res);
});

/**
 * GET /api/products/low-stock
 * Obtiene productos con bajo stock
 * Query params: threshold (default: 10)
 */
router.get('/low-stock', async (req, res) => {
  await productsController.getLowStockProducts(req, res);
});

/**
 * GET /api/products/:id
 * Obtiene un producto específico por ID
 */
router.get('/:id', async (req, res) => {
  await productsController.getProductById(req, res);
});

export default router;
