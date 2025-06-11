import type { Request, Response, NextFunction } from 'express';

export const requestLogger = (req: Request, res: Response, next: NextFunction) => {
  const start = Date.now();

  // Log de inicio de request
  console.log(`🔍 ${new Date().toISOString()} - ${req.method} ${req.url} - IP: ${req.ip}`);

  // Log de query params si existen
  if (Object.keys(req.query).length > 0) {
    console.log(`📋 Query params:`, req.query);
  }

  // Log de body si existe (solo para POST, PUT, PATCH)
  if (['POST', 'PUT', 'PATCH'].includes(req.method) && req.body) {
    console.log(`📦 Body:`, req.body);
  }

  // Interceptar la respuesta para logging
  const originalSend = res.send;
  res.send = function (data) {
    const duration = Date.now() - start;
    const statusColor = res.statusCode >= 400 ? '🔴' : res.statusCode >= 300 ? '🟡' : '🟢';

    console.log(`${statusColor} ${res.statusCode} - ${req.method} ${req.url} - ${duration}ms`);

    // Log de errores
    if (res.statusCode >= 400) {
      console.log(`❌ Error response:`, JSON.parse(data));
    }

    return originalSend.call(this, data);
  };

  next();
};

export const analyticsLogger = (req: Request, res: Response, next: NextFunction) => {
  if (req.url.startsWith('/api/analytics')) {
    console.log(`🔬 Analytics Request: ${req.method} ${req.url}`);
    console.log(`⏰ Timestamp: ${new Date().toISOString()}`);

    if (req.params) {
      console.log(`📊 Params:`, req.params);
    }
  }

  next();
};
