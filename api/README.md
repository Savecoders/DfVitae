# 🚀 Tech Store Data Mining API

Una API completa de Business Intelligence y Data Mining para e-commerce de tecnología, implementada con TypeScript, Prisma, y algoritmos de Machine Learning.

## 🌟 Características

### 🔍 **Customer Segmentation (K-Means)**

- Segmentación automática de clientes usando análisis RFM (Recency, Frequency, Monetary)
- Clasificación en 4 segmentos: Premium, Gold, Silver, Bronze
- Análisis de comportamiento de compra

### 🛒 **Market Basket Analysis (Apriori)**

- Descubre patrones de compra: "Los clientes que compran X también compran Y"
- Reglas de asociación con métricas de confianza, soporte y lift
- Recomendaciones automáticas de productos

### 📈 **Sales Prediction (Linear Regression)**

- Predicción de demanda futura por producto
- Análisis de tendencias de ventas
- Métricas de precisión (R², MSE, MAE)

### 📊 **Analytics Dashboard**

- KPIs en tiempo real (ingresos, órdenes, conversión)
- Insights de clientes y productos
- Visualización de tendencias de ventas

### 1. Environment Setup

Create a `.env` file in the `/api` directory with the following variables:

```bash
DATABASE_URL=mysql://root:yourpassword@localhost:3306/tech_shop
DATABASE_NAME=tech_shop
DATABASE_PASSWORD_ROOT=yourpassword
PAGE_SCRAPER_STORE_URL=https://your-scraping-target-site.com
PORT=8080
```

### 2. Start the MySQL Database

```bash
cd api
docker-compose up -d
```

This starts the MySQL database service and creates the necessary volume for data persistence.

### 3. Install Dependencies

```bash
cd api
bun install
```

### 4. Database Migration

Run the Prisma migrations to set up your database schema:

```bash
cd api
bunx prisma migrate deploy
```

## Running the Application

### Development Mode

```bash
cd api
bun run dev
```

This starts the server with hot-reloading enabled.

### Production Build

```bash
cd api
bun run build
```

The built files will be placed in the `/api/dist` directory.

## API Endpoints

- `GET /` - Health check endpoint
- `GET /api/scrapper` - Trigger web scraping and return scraped products
- `GET /api/seed` - Seed the database with data from `/api/data/loads/seed.json`

## Data Flow

1. The scraper collects product data from the configured e-commerce site
2. Data is processed through utility functions to standardize format
3. Processed data can be saved to the database using the seed endpoint
4. API endpoints provide access to the data for the client application

## Docker

The project uses Docker Compose to run the MySQL database. You can modify the `docker-compose.yml` file to add additional services as needed.

## Troubleshooting

- If you encounter issues with the database connection, make sure the MySQL service is running and the DATABASE_URL is correctly configured.
- For scraper issues, check that the target website structure hasn't changed and that the PAGE_SCRAPER_STORE_URL is set correctly.
- If Prisma throws errors, try running `bunx prisma generate` to regenerate the client.

## License

No defined license.
