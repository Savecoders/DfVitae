import { type Product } from '../types/Product';

/**
 * Fix product structure to match TypeScript interface
 * This ensures:
 * 1. stock is at the top level (not in details)
 * 2. details has all required fields
 * 3. All other fields are properly structured
 */
export function fixProductStructure(products: any[]): Product[] {
  return products.map(product => {
    // Create a fixed product object
    const fixedProduct: Product = {
      title: product.title || '',
      price:
        typeof product.price === 'number'
          ? product.price
          : parseFloat(String(product.price).replace(/[^\d.]/g, '')),
      imageUrl: product.imageUrl || '',
      availability: product.availability === undefined ? false : product.availability,
      details: {
        ref: product.details?.ref || '',
        description: product.details?.description || '',
        warranty: product.details?.warranty || '',
      },
    };

    // Handle stock - move from details to top level if needed
    if (product.stock !== undefined) {
      fixedProduct.stock = product.stock;
    } else if (product.details?.stock !== undefined) {
      fixedProduct.stock = product.details.stock;
    }

    // Add referiences if they exist
    if (product.details?.referiences) {
      fixedProduct.details.referiences = product.details.referiences;
    }

    // Add techDataSheet if it exists
    if (product.details?.techDataSheet) {
      fixedProduct.details.techDataSheet = product.details.techDataSheet;
    }

    return fixedProduct;
  });
}

/**
 * Apply the structure fix to your data.json file
 * Usage example:
 *
 * import rawData from '../../data/loads/data.json';
 * const fixedData = {
 *   data: fixProductStructure(rawData.data)
 * };
 * fs.writeFileSync('path/to/fixed-data.json', JSON.stringify(fixedData, null, 2));
 */
