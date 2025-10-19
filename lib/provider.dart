import 'package:flutter/material.dart';
import 'package:flutter_application_1/prodcut.dart';

/// Model for a single item in the cart
class CartItem {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

/// ✅ CartProvider – used with Provider in main.dart
class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  /// Number of unique products in the cart
  int get itemCount => _items.length;

  /// Total price of all items in the cart
  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  /// Add a product to the cart or increase its quantity
  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingCartItem) => CartItem(
          product: existingCartItem.product,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(product: product, quantity: 1),
      );
    }
    notifyListeners();
  }

  /// Decrease item quantity or remove if quantity is 1
  void decreaseItem(String productId) {
    if (!_items.containsKey(productId)) return;

    final currentItem = _items[productId]!;
    if (currentItem.quantity > 1) {
      _items.update(
        productId,
        (_) => CartItem(
          product: currentItem.product,
          quantity: currentItem.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  /// Remove a product completely from the cart
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  /// Empty the cart
  void clear() {
    _items.clear();
    notifyListeners();
  }
}
