import 'dart:convert';
import 'package:flutter_shopping_app/catalog/catalog.dart';

class ProductRepository {
  final ProductProvider productProvider;
  ProductRepository({required this.productProvider});

  Future<List<Product>> getAllProducts() async {
    try {
      final productsData = await productProvider.getAllProducts();
      final data = jsonDecode(productsData);
      final List<Product> products = [];
      for (var product in data) {
        products.add(Product.fromJson(product));
      }
      return products;
    } catch (e) {
      throw e.toString();
    }
  }
}
