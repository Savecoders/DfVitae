import puppeteer from 'puppeteer';
import type { Details } from '../types/Product';

export async function extractProductDetails(productUrl: string): Promise<Partial<Details>> {
  console.log(`Opening new browser for product details: ${productUrl}`);

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

  try {
    const page = await browser.newPage();
    await page.setDefaultNavigationTimeout(30000);
    await page.goto(productUrl, { waitUntil: 'networkidle2' });

    const details = await page.evaluate(() => {
      const ref = document.querySelector('.product-reference span')?.textContent?.trim() || '';

      // Extract stock information
      const stockElement = document.querySelector('.product-quantities span');
      const stockText = stockElement?.textContent?.trim() || '';
      const stockMatch = stockText.match(/(\d+)/);
      const stock = stockMatch ? parseInt(stockMatch[1], 10) : 0;

      const description = document.querySelector('.product-description')?.textContent?.trim() || '';

      // warranty information
      const warrantyElement = document.querySelector('.product-warranty');
      const warranty = warrantyElement?.textContent?.trim() || '';

      // get technical data sheet if available
      const techDataElements = document.querySelectorAll('.product-features li');
      const techDataSheet = Array.from(techDataElements).map(item => ({
        label: item.textContent?.trim() || '',
      }));

      return {
        ref,
        stock,
        description,
        warranty,
        techDataSheet: techDataSheet.length > 0 ? techDataSheet : undefined,
      };
    });

    return details;
  } catch (error) {
    console.error(`Error extracting details from ${productUrl}:`, error);
    return {};
  } finally {
    await browser.close();
  }
}
