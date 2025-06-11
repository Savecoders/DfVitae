export interface OrderItem {
  id: string;
  orderId: string;
  productId: string;
  quantity: number;
  price: number;
  createdAt: Date;
  updatedAt: Date;
}

export interface OrderItemWithProduct extends OrderItem {
  product: {
    id: string;
    title: string;
    price: number;
    imageUrl?: string;
  };
}

export interface BasketAnalysis {
  itemset: string[];
  support: number;
  confidence?: number;
  lift?: number;
}

export interface AssociationRule {
  antecedent: string[];
  consequent: string[];
  support: number;
  confidence: number;
  lift: number;
  conviction: number;
}
