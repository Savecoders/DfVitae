import puppeteer from 'puppeteer';
import PriceSanitizer from '../utils/sanitize-price.transform';
import RemoveDots from '../utils/remove-dots.transform';
import type { Details, Product } from '../types/Product';
import { extractProductDetails } from './details.scraping';

async function getProductsScrape() {
  const browser = await puppeteer.launch({
    headless: true,
    executablePath:
      process.env.NODE_ENV === 'production'
        ? process.env.PUPPETEER_EXECUTABLE_PATH
        : puppeteer.executablePath(),
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
      '--PUPPETEER_DISABLE_HEADLESS_WARNING',
      '--no-zygote',
      '--single-process',
    ],
  });

  const url = process.env.PAGE_SCRAPER_STORE_URL as string;
  const page = await browser.newPage();
  await page.setDefaultNavigationTimeout(0);

  let currentPageUrl: string | null = url;
  const allProducts = [];
  let pageCount = 0;

  try {
    console.log('Starting product scraping process...');

    while (currentPageUrl) {
      pageCount++;
      console.log(`Scraping page ${pageCount}: ${currentPageUrl}`);

      await page.goto(currentPageUrl, { waitUntil: 'networkidle2' });

      // Wait for product elements to load
      await page.waitForSelector('.product-item', { timeout: 10000 }).catch(() => {
        console.log('Could not find product items on this page');
        throw new Error('Product items not found');
      });

      // Scrape products on the current page
      const products = await page.evaluate(() => {
        const productElements = document.querySelectorAll('.product-item');
        console.log(`Found ${productElements.length} products on this page`);

        return Array.from(productElements).map(product => {
          const title =
            product
              .querySelector('.product-description > .product-title > a')
              ?.textContent?.trim() || '';
          const price = product.querySelector('.price')?.textContent?.trim() || '';
          const imageUrl =
            product.querySelector('.thumbnail.product-thumbnail > img')?.getAttribute('src') || '';

          // Get the product URL for detailed scraping later
          const productUrl =
            product
              .querySelector('.product-description > .product-title > a')
              ?.getAttribute('href') || '';
          const availability = product.querySelector('.availability')?.textContent?.trim() || '';

          return {
            title,
            price,
            imageUrl,
            productUrl,
            availability: availability.includes('In stock'),
          };
        });
      });

      const enrichedProducts = [];
      for (const product of products) {
        const title = RemoveDots(product.title);
        const priceNumber = PriceSanitizer(product.price);

        // If we have a product URL, scrape additional details
        if (product.productUrl) {
          console.log(`Processing product: ${title}`);
          try {
            const details = await extractProductDetails(product.productUrl);

            const enrichedProduct: Product = {
              title,
              price: priceNumber,
              imageUrl: product.imageUrl,
              availability: product.availability,
              stock: details.stock,
              details: details,
            };

            enrichedProducts.push(enrichedProduct);
          } catch (error) {
            console.error(`Failed to extract details for ${title}:`, error);
            enrichedProducts.push({
              title,
              price: priceNumber,
              imageUrl: product.imageUrl,
              availability: product.availability,
              details: {}, // Fallback to empty details if extraction fails
            });
          }
        } else {
          // Add product without details if no URL is available
          enrichedProducts.push({
            title,
            price: priceNumber,
            imageUrl: product.imageUrl,
            availability: product.availability,
            details: {},
          });
        }
      }

      console.log(`Processed ${enrichedProducts.length} products from page ${pageCount}`);
      allProducts.push(...enrichedProducts);

      // Find the next page link - using the specific pagination structure from the site
      // the pagination structure is like this:
      // <nav class="pagination">
      // </nav>
      currentPageUrl = await page.evaluate(baseUrl => {
        // Look for the next page link in the pagination
        const nextPageLink = document.querySelector('a.next.js-search-link');

        if (nextPageLink) {
          const href = nextPageLink.getAttribute('href');
          if (href) {
            return new URL(href, baseUrl).toString();
          }
        }

        // If no direct next link found, try to determine based on current page
        const currentPageElement = document.querySelector('.pagination li.current');
        if (currentPageElement) {
          const currentPageNumber = parseInt(currentPageElement.textContent?.trim() || '0', 10);

          // Look for the next page in sequence
          const nextPageItem = document.querySelector(
            `.pagination li a[rel="nofollow"][href*="page=${currentPageNumber + 1}"]`,
          );
          if (nextPageItem) {
            const href = nextPageItem.getAttribute('href');
            if (href) {
              return new URL(href, baseUrl).toString();
            }
          }
        }

        return null;
      }, currentPageUrl);
    }

    console.log(`Scraping completed. Total products found: ${allProducts.length}`);
  } catch (error) {
    console.error('Error during scraping:', error);
  } finally {
    await browser.close();
  }

  return allProducts;
}

export default getProductsScrape;
