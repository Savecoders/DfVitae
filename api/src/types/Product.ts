export interface TechDataSheet {
  label: string;
}

export interface Details {
  ref: string;
  referiences?: string[];
  description: string;
  techDataSheet?: TechDataSheet[];
  warranty: string;
  stock: number;
}

export interface Product {
  title: string;
  price: number;
  stock?: number;
  imageUrl: string;
  availability?: boolean;
  details: Partial<Omit<Details, 'stock'>>;
}
