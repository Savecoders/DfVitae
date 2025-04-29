export interface TechDataSheet {
  label: string;
}

export interface Details {
  ref: string;
  stock: number;
  referiences?: string[];
  description: string;
  techDataSheet?: TechDataSheet[];
  warranty: string;
}

export interface Product {
  title: string;
  price: number;
  imageUrl: string;
  availability?: boolean;
  details: Partial<Details>;
}
