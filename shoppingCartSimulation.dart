void main() {
  // Sample list of item prices
  List<double> itemPrices = [5.99, 15.49, 25.00, 8.50, 100.00, 4.75];

  // Calculate total price of items in the cart
  double totalPrice = calculateTotal(itemPrices, taxRate: 0.07);
  print('Total Price (including tax): \$${totalPrice.toStringAsFixed(2)}');

  // Filter items that are below a certain price threshold (e.g., $10)
  var filteredItems = itemPrices.where((price) => price >= 10).toList();
  print('Filtered Items (above \$10): $filteredItems');

  // Apply a discount of 10% to the original prices
  double discountRate = 0.10;
  List<double> discountedPrices = applyDiscount(itemPrices, (price) => price * (1 - discountRate));
  print('Discounted Prices: $discountedPrices');

  // Calculate final price after discount
  double finalPrice = calculateTotal(discountedPrices, taxRate: 0.07);
  print('Final Price (after discount and tax): \$${finalPrice.toStringAsFixed(2)}');

  // Calculate special discount based on the factorial of the number of items
  double specialDiscount = calculateFactorialDiscount(itemPrices.length);
  specialDiscount = specialDiscount > 100 ? 100 : specialDiscount; // Cap the discount at 100%
  finalPrice -= (finalPrice * specialDiscount / 100);
  
  // Ensure final price does not go below zero
  finalPrice = finalPrice < 0 ? 0 : finalPrice;
  
  print('Final Price (after special discount): \$${finalPrice.toStringAsFixed(2)}');
}

// Function to calculate the total price with optional tax
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double total = prices.fold(0, (sum, price) => sum + price); // Sum up all prices
  return total * (1 + taxRate); // Apply tax
}

// Function to apply a discount to a list of prices using a higher-order function
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList(); // Apply discount function to each price
}

// Recursive function to calculate factorial and derive a discount percentage
double calculateFactorialDiscount(int n) {
  if (n <= 1) return 1.0; // Base case - return as double
  return n * calculateFactorialDiscount(n - 1); // Recursive case
}