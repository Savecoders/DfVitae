import { SimpleLinearRegression as MLRegression } from 'ml-regression';
import { Matrix } from 'ml-matrix';
import { kmeans } from 'ml-kmeans';
import * as tf from '@tensorflow/tfjs-node';
const MLStat = require('ml-stat');

export class SimpleLinearRegression {
  public slope: number = 0;
  public intercept: number = 0;
  public r2: number = 0;
  private mlRegression: MLRegression;

  constructor(x: number[], y: number[]) {
    if (x.length !== y.length || x.length === 0) {
      throw new Error('Arrays must have the same non-zero length');
    }

    // Use ml-regression library for more robust calculations
    this.mlRegression = new MLRegression(x, y);

    this.slope = this.mlRegression.slope;
    this.intercept = this.mlRegression.intercept;

    // Calculate R² using ml-matrix for better numerical stability
    const yMatrix = new Matrix([y]);
    const predictedY = x.map(xi => this.predict(xi));

    const yMean = yMatrix.mean('row')[0];
    const yMeanValue = Array.isArray(yMean) ? yMean[0] : yMean;
    const totalSumSquares = y.reduce((sum, yi) => sum + Math.pow(yi - yMeanValue, 2), 0);
    const residualSumSquares = y.reduce((sum, yi, i) => sum + Math.pow(yi - predictedY[i], 2), 0);

    this.r2 = totalSumSquares === 0 ? 0 : 1 - residualSumSquares / totalSumSquares;
  }

  predict(x: number): number {
    return this.mlRegression.predict(x);
  }
}

export class SimpleKMeans {
  public clusters: number[] = [];
  public centroids: number[][] = [];

  constructor(data: number[][], k: number, options: any = {}) {
    if (data.length === 0 || k <= 0) {
      throw new Error('Invalid input parameters');
    }

    const maxIterations = options.maxIterations || 100;

    // Use ml-kmeans library for more robust clustering
    const result = kmeans(data, k, {
      maxIterations,
      initialization: 'random',
      seed: options.seed || Math.floor(Math.random() * 1000000),
    });

    this.clusters = result.clusters;
    this.centroids = result.centroids;
  }

  // Keep compatibility methods for existing code
  private findNearestCentroid(point: number[], centroids: number[][]): number {
    let minDistance = Infinity;
    let nearestCentroid = 0;

    for (let i = 0; i < centroids.length; i++) {
      const distance = this.euclideanDistance(point, centroids[i]);
      if (distance < minDistance) {
        minDistance = distance;
        nearestCentroid = i;
      }
    }

    return nearestCentroid;
  }

  private euclideanDistance(point1: number[], point2: number[]): number {
    let sum = 0;
    for (let i = 0; i < point1.length; i++) {
      sum += Math.pow(point1[i] - point2[i], 2);
    }
    return Math.sqrt(sum);
  }
}

export function normalizeData(data: number[][]): number[][] {
  if (data.length === 0) return data;

  // Use ml-matrix for more efficient calculations
  const matrix = new Matrix(data);
  const means = matrix.mean('column');
  const stds = matrix.standardDeviation('column');

  // Normalize each column (feature)
  const normalized = matrix.clone();
  for (let j = 0; j < matrix.columns; j++) {
    const mean = means[j];
    const std = stds[j] || 1; // Avoid division by zero

    for (let i = 0; i < matrix.rows; i++) {
      normalized.set(i, j, (matrix.get(i, j) - mean) / std);
    }
  }

  return normalized.to2DArray();
}

// Advanced algorithms using TensorFlow.js and ml-stat

/**
 * Advanced Linear Regression using TensorFlow.js for better performance with large datasets
 */
export class TensorFlowLinearRegression {
  private model: tf.Sequential | null = null;
  public slope: number = 0;
  public intercept: number = 0;
  public r2: number = 0;

  constructor(x: number[], y: number[]) {
    if (x.length !== y.length || x.length === 0) {
      throw new Error('Arrays must have the same non-zero length');
    }

    this.buildAndTrainModel(x, y);
  }

  private async buildAndTrainModel(x: number[], y: number[]): Promise<void> {
    // Convert data to tensors
    const xTensor = tf.tensor2d(x.map(val => [val]));
    const yTensor = tf.tensor2d(y.map(val => [val]));

    // Create a simple linear model
    this.model = tf.sequential({
      layers: [tf.layers.dense({ inputShape: [1], units: 1 })],
    });

    // Compile the model
    this.model.compile({
      optimizer: tf.train.sgd(0.01),
      loss: 'meanSquaredError',
    });

    // Train the model
    await this.model.fit(xTensor, yTensor, {
      epochs: 100,
      verbose: 0,
    });

    // Extract weights
    const weights = this.model.getWeights();
    const slope = await weights[0].data();
    const intercept = await weights[1].data();

    this.slope = slope[0];
    this.intercept = intercept[0];

    // Calculate R²
    this.r2 = this.calculateR2(x, y);

    // Clean up tensors
    xTensor.dispose();
    yTensor.dispose();
  }

  private calculateR2(x: number[], y: number[]): number {
    const predictions = x.map(val => this.predict(val));
    const yMean = MLStat.array.mean(y);

    const totalSumSquares = y.reduce((sum, yi) => sum + Math.pow(yi - yMean, 2), 0);
    const residualSumSquares = y.reduce((sum, yi, i) => sum + Math.pow(yi - predictions[i], 2), 0);

    return totalSumSquares === 0 ? 0 : 1 - residualSumSquares / totalSumSquares;
  }

  predict(x: number): number {
    return this.slope * x + this.intercept;
  }

  dispose(): void {
    if (this.model) {
      this.model.dispose();
    }
  }
}

/**
 * Advanced Statistical Analysis using ml-stat
 */
export class AdvancedStatistics {
  static calculateCorrelationMatrix(data: number[][]): number[][] {
    const numFeatures = data[0].length;
    const correlationMatrix: number[][] = [];

    for (let i = 0; i < numFeatures; i++) {
      correlationMatrix[i] = [];
      for (let j = 0; j < numFeatures; j++) {
        const feature1 = data.map(row => row[i]);
        const feature2 = data.map(row => row[j]);
        correlationMatrix[i][j] = MLStat.array.covariance(feature1, feature2);
      }
    }

    return correlationMatrix;
  }

  static calculateStatistics(data: number[]): {
    mean: number;
    variance: number;
    standardDeviation: number;
    min: number;
    max: number;
    median: number;
  } {
    const sorted = [...data].sort((a, b) => a - b);
    const meanValue = MLStat.array.mean(data);
    const varianceValue = MLStat.array.variance(data);
    const stdValue = MLStat.array.standardDeviation(data);

    return {
      mean: meanValue,
      variance: varianceValue,
      standardDeviation: stdValue,
      min: sorted[0],
      max: sorted[sorted.length - 1],
      median:
        sorted.length % 2 === 0
          ? (sorted[sorted.length / 2 - 1] + sorted[sorted.length / 2]) / 2
          : sorted[Math.floor(sorted.length / 2)],
    };
  }

  static detectOutliers(
    data: number[],
    threshold: number = 2,
  ): {
    outliers: number[];
    outlierIndices: number[];
    cleanData: number[];
  } {
    const meanValue = MLStat.array.mean(data);
    const stdValue = MLStat.array.standardDeviation(data);

    const outliers: number[] = [];
    const outlierIndices: number[] = [];
    const cleanData: number[] = [];

    data.forEach((value, index) => {
      const zScore = Math.abs((value - meanValue) / stdValue);
      if (zScore > threshold) {
        outliers.push(value);
        outlierIndices.push(index);
      } else {
        cleanData.push(value);
      }
    });

    return { outliers, outlierIndices, cleanData };
  }
}

/**
 * Time Series Analysis using TensorFlow.js
 */
export class TimeSeriesAnalysis {
  private model: tf.Sequential | null = null;

  async buildLSTMModel(sequenceLength: number, features: number): Promise<void> {
    this.model = tf.sequential({
      layers: [
        tf.layers.lstm({
          units: 50,
          returnSequences: true,
          inputShape: [sequenceLength, features],
        }),
        tf.layers.dropout({ rate: 0.2 }),
        tf.layers.lstm({
          units: 50,
          returnSequences: false,
        }),
        tf.layers.dropout({ rate: 0.2 }),
        tf.layers.dense({ units: 1 }),
      ],
    });

    this.model.compile({
      optimizer: tf.train.adam(0.001),
      loss: 'meanSquaredError',
      metrics: ['mae'],
    });
  }

  async trainModel(xData: number[][][], yData: number[]): Promise<void> {
    if (!this.model) {
      throw new Error('Model not built. Call buildLSTMModel first.');
    }

    const xTensor = tf.tensor3d(xData);
    const yTensor = tf.tensor2d(yData.map(val => [val]));

    await this.model.fit(xTensor, yTensor, {
      epochs: 50,
      batchSize: 32,
      validationSplit: 0.1,
      verbose: 0,
    });

    xTensor.dispose();
    yTensor.dispose();
  }

  async predict(sequence: number[][]): Promise<number> {
    if (!this.model) {
      throw new Error('Model not trained.');
    }

    const inputTensor = tf.tensor3d([sequence]);
    const prediction = this.model.predict(inputTensor) as tf.Tensor;
    const result = await prediction.data();

    inputTensor.dispose();
    prediction.dispose();

    return result[0];
  }

  dispose(): void {
    if (this.model) {
      this.model.dispose();
    }
  }
}
