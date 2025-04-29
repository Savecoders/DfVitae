import getProductsScrape from '../libs/products.scraping';

export default class ScraperService {
  async getProducts() {
    try {
      const products = await getProductsScrape();
      return products;
    } catch (error) {
      console.error('Error scraping products:', error);
      throw new Error('Failed to scrape products');
    }
  }
}
