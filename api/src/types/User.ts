export interface User {
  id: string;
  name?: string;
  email?: string;
  password?: string;
  createdAt: Date;
  updatedAt: Date;
}

export interface UserWithOrders extends User {
  Orders: Order[];
}

export interface CustomerSegment {
  userId: string;
  segment: number;
  rfm: [number, number, number]; // [recency, frequency, monetary]
  segmentName: 'Premium' | 'Gold' | 'Silver' | 'Bronze';
}

export interface RFMAnalysis {
  recency: number;
  frequency: number;
  monetary: number;
}

import type { Order } from './Order';
