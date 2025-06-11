import type { OrderItem } from './OrderItems';

export enum StatusOrder {
  pending = 'pending',
  completed = 'completed',
  cancelled = 'cancelled',
}

export interface Order {
  id: string;
  userId: string;
  status: StatusOrder;
  totalPrice: number;
  createdAt: Date;
  updatedAt: Date;
}

export interface OrderWithItems extends Order {
  items: OrderItem[];
  user?: {
    id: string;
    name?: string;
    email?: string;
  };
}

export interface SalesAnalytics {
  totalOrders: number;
  totalRevenue: number;
  averageOrderValue: number;
  conversionRate: number;
  periodComparison: {
    current: number;
    previous: number;
    change: number;
  };
}
