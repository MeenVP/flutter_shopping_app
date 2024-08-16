import 'package:flutter_shopping_app/cart/cart.dart';
import 'package:flutter_shopping_app/catalog/catalog.dart';

class CartRepository {
  final List<CartItem> _cartItems = [];

  List<CartItem> getCartItems() {
    return _cartItems;
  }

  void addItemByProduct(Product product) {
    _cartItems.add(CartItem(product: product));
  }

  void removeItem(CartItem item) {
    _cartItems.remove(item);
  }

  void clearCart() {
    _cartItems.clear();
  }
}
