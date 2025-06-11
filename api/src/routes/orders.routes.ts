import { Router } from 'express';
import { OrdersController } from '../controllers/orders.controller';

const router = Router();
const ordersController = new OrdersController();

/**
 * GET /api/orders
 * Obtiene todas las órdenes con filtros
 * Query params: page, limit, status, userId, startDate, endDate
 */
router.get('/', async (req, res) => {
  await ordersController.getAllOrders(req, res);
});

/**
 * GET /api/orders/metrics
 * Obtiene métricas de órdenes
 * Query params: period (days, default: 30)
 */
router.get('/metrics', async (req, res) => {
  await ordersController.getOrderMetrics(req, res);
});

/**
 * GET /api/orders/by-status
 * Obtiene órdenes agrupadas por estado
 */
router.get('/by-status', async (req, res) => {
  await ordersController.getOrdersByStatus(req, res);
});

/**
 * GET /api/orders/:id
 * Obtiene una orden específica por ID
 */
router.get('/:id', async (req, res) => {
  await ordersController.getOrderById(req, res);
});

export default router;
