import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/cart/views/cart_page.dart';
import 'package:flutter_shopping_app/catalog/catalog.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'Catalog Page',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CartPage();
                }));
              },
            ),
          ],
        ),
        body: BlocBuilder<CatalogBloc, CatalogState>(
          builder: (context, state) {
            if (state is CatalogError) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is! CatalogLoaded) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final data = state.catalog;
            return CatalogView(catalog: data);
          },
        ),
      ),
    );
  }
}

class CatalogView extends StatelessWidget {
  final Catalog catalog;
  const CatalogView({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: catalog.products.length,
        itemBuilder: (context, index) {
          final product = catalog.getByPosition(index);
          return GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return ProductPage(product: product);
            })),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(product.image, height: 100, width: 100),
                    Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('\$${product.price}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
