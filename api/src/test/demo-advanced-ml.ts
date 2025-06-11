// Demonstracion de las nuevas funcionalidades con librerias especializadas
import {
  SimpleLinearRegression,
  SimpleKMeans,
  TensorFlowLinearRegression,
  AdvancedStatistics,
  TimeSeriesAnalysis,
  normalizeData,
} from '../utils/simple-regression';

console.log('🚀 Demostración de Data Mining con Librerías Especializadas\n');

// Datos de ejemplo
const sampleData = [
  [1, 10, 5.2],
  [2, 20, 6.1],
  [3, 15, 5.8],
  [4, 25, 7.2],
  [5, 30, 8.1],
  [6, 18, 6.5],
  [7, 35, 9.0],
  [8, 40, 9.8],
  [9, 22, 7.1],
  [10, 45, 10.5],
];

// Variables para regresión
const x = sampleData.map(row => row[0]);
const y = sampleData.map(row => row[1]);

console.log('📊 1. REGRESIÓN LINEAL MEJORADA');
console.log('=====================================');

// Regresión con ml-regression
const regression = new SimpleLinearRegression(x, y);
console.log(`✅ Usando ml-regression:`);
console.log(`   Pendiente: ${regression.slope.toFixed(3)}`);
console.log(`   Intercepto: ${regression.intercept.toFixed(3)}`);
console.log(`   R²: ${regression.r2.toFixed(3)}`);
console.log(`   Predicción para x=11: ${regression.predict(11).toFixed(2)}\n`);

console.log('🤖 2. REGRESIÓN CON TENSORFLOW.JS');
console.log('=====================================');

// Demostración de TensorFlow (asíncrono)
async function demonstrateTensorFlow() {
  try {
    const tfRegression = new TensorFlowLinearRegression(x, y);
    // Esperamos un poco para que el modelo se entrene
    await new Promise(resolve => setTimeout(resolve, 2000));

    console.log(`✅ Usando TensorFlow.js:`);
    console.log(`   Pendiente: ${tfRegression.slope.toFixed(3)}`);
    console.log(`   Intercepto: ${tfRegression.intercept.toFixed(3)}`);
    console.log(`   R²: ${tfRegression.r2.toFixed(3)}`);
    console.log(`   Predicción para x=11: ${tfRegression.predict(11).toFixed(2)}`);

    tfRegression.dispose(); // Limpia memoria
    console.log('   🧹 Memoria GPU/CPU liberada\n');
  } catch (error) {}
}

console.log('🎯 3. CLUSTERING CON ML-KMEANS');
console.log('=====================================');

// Clustering mejorado
const clusterData = sampleData.map(row => [row[1], row[2]]); // Usar columnas 2 y 3
const kmeans = new SimpleKMeans(clusterData, 3, { maxIterations: 50 });

console.log(`✅ Usando ml-kmeans:`);
console.log(`   Clusters encontrados: ${kmeans.clusters.length}`);
console.log(`   Centroides:`);
kmeans.centroids.forEach((centroid, i) => {
  console.log(`     Cluster ${i}: [${centroid.map(c => c.toFixed(2)).join(', ')}]`);
});
console.log(`   Asignaciones: ${kmeans.clusters.join(', ')}\n`);

console.log('📈 4. ESTADÍSTICAS AVANZADAS');
console.log('=====================================');

// Estadísticas con ml-stat
const values = y;
const stats = AdvancedStatistics.calculateStatistics(values);

console.log(`✅ Usando ml-stat:`);
console.log(`   Media: ${stats.mean.toFixed(2)}`);
console.log(`   Desviación estándar: ${stats.standardDeviation.toFixed(2)}`);
console.log(`   Varianza: ${stats.variance.toFixed(2)}`);
console.log(`   Mediana: ${stats.median.toFixed(2)}`);
console.log(`   Min: ${stats.min}, Max: ${stats.max}\n`);

// Detección de outliers
const outlierResult = AdvancedStatistics.detectOutliers(values, 1.5);
console.log(`🔍 Detección de outliers (umbral 1.5σ):`);
console.log(`   Outliers encontrados: ${outlierResult.outliers.length}`);
if (outlierResult.outliers.length > 0) {
  console.log(`   Valores atípicos: ${outlierResult.outliers.join(', ')}`);
  console.log(`   Índices: ${outlierResult.outlierIndices.join(', ')}`);
}
console.log(`   Datos limpios: ${outlierResult.cleanData.length} valores\n`);

console.log('🧮 5. NORMALIZACIÓN DE DATOS');
console.log('=====================================');

// Normalización con ml-matrix
const originalData = sampleData;
const normalizedData = normalizeData(originalData);

console.log(`✅ Usando ml-matrix para normalización:`);
console.log(`   Datos originales (primeras 3 filas):`);
originalData.slice(0, 3).forEach((row, i) => {
  console.log(`     Fila ${i + 1}: [${row.map(v => v.toFixed(2)).join(', ')}]`);
});
console.log(`   Datos normalizados (primeras 3 filas):`);
normalizedData.slice(0, 3).forEach((row, i) => {
  console.log(`     Fila ${i + 1}: [${row.map(v => v.toFixed(2)).join(', ')}]`);
});
console.log();

console.log('🔗 6. MATRIZ DE CORRELACIÓN');
console.log('=====================================');

// Matriz de correlación
const correlationMatrix = AdvancedStatistics.calculateCorrelationMatrix(originalData);
console.log(`✅ Matriz de correlación:`);
correlationMatrix.forEach((row, i) => {
  console.log(`   Var ${i + 1}: [${row.map(c => c.toFixed(3)).join(', ')}]`);
});
console.log();

// Ejecutar demo de TensorFlow al final
demonstrateTensorFlow().then(() => {
  console.log('🎉 ¡Demostración completada!');
  console.log('💡 Beneficios de las librerías especializadas:');
  console.log('   ✓ Mayor precisión numérica');
  console.log('   ✓ Mejor rendimiento con grandes datasets');
  console.log('   ✓ Algoritmos optimizados y probados');
  console.log('   ✓ Funcionalidades avanzadas (TensorFlow, LSTM)');
  console.log('   ✓ Manejo automático de memoria (GPU/CPU)');
  console.log('   ✓ Detección de outliers y estadísticas robustas');
});
