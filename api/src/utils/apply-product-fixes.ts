import fs from 'fs';
import path from 'path';
import { fixProductStructure } from './fix-product-structure';

const dataPath = path.join(__dirname, '../../data/loads/data.json');
const rawData = JSON.parse(fs.readFileSync(dataPath, 'utf8'));

// Fix the product structure
const fixedData = {
  data: fixProductStructure(rawData.data),
};

const outputPath = path.join(__dirname, '../../data/loads/fixed-data.json');
fs.writeFileSync(outputPath, JSON.stringify(fixedData, null, 2));

console.log(`Fixed product structure and saved to ${outputPath}`);
console.log(`Total products processed: ${fixedData.data.length}`);
