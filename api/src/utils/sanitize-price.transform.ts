export default function sanitizePrice(value: string): number {
  // Remove any non-numeric characters (except for decimal point)
  const cleanedValue = value.replace(/[^0-9.]/g, '');

  // Parse the cleaned string to a float
  const parsedValue = parseFloat(cleanedValue);

  // Check if the parsed value is a valid number
  if (isNaN(parsedValue)) {
    throw new Error('Invalid price format');
  }

  return parsedValue;
}
