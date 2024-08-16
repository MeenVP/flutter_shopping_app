import 'package:flutter_shopping_app/catalog/catalog.dart';

class Catalog {
  final List<Product> products;

  const Catalog({required this.products});

  Product getById(int id) {
    return products.firstWhere((element) => element.id == id);
  }

  Product getByPosition(int position) => products[position];

  factory Catalog.fromList(List<Product> products) {
    return Catalog(products: products);
  }
}
