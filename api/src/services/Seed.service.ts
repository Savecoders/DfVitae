import fs from 'fs';
import { type Product } from '../types/Product';
import path from 'path';
import { PrismaClient } from '../../generated/prisma';

export class SeedService {
  private readonly data_load_path = '../../data/loads/seed.json';
  async seed() {
    console.log('Seeding database...');
    // Load the data from the JSON file
    const dataPath = path.join(__dirname, this.data_load_path);

    const rawData = JSON.parse(fs.readFileSync(dataPath, 'utf8'));

    const prisma = new PrismaClient();

    // delete all existing data
    await prisma.details.deleteMany();
    await prisma.products.deleteMany();
    await prisma.orders.deleteMany();
    await prisma.orderItems.deleteMany();

    // seed products

    try {
      await Promise.all(
        rawData.data.map(async (product: Product) => {
          // Create a new Product object first
          const newProduct = await prisma.products.create({
            data: {
              title: product.title,
              price: product.price,
              imageUrl: product.imageUrl || '',
              availability: product.availability,
              stock: product.stock,
            },
          });

          // Create the details with a reference to the product
          await prisma.details.create({
            data: {
              ref: product.details.ref || '',
              description: product.details.description || '',
              warranty: product.details.warranty || '',
              reference: product.details.referiences ? product.details.referiences.join(', ') : '',
              product: {
                connect: { id: newProduct.id },
              },
            },
          });
        }),
      );
    } catch (error) {
      console.error('Error seeding database:', error);
      return;
    } finally {
      // Disconnect from the database
      await prisma.$disconnect();
    }
    console.log('Database seeded successfully!');
  }
}
