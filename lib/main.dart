import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/catalog/catalog.dart';

import 'package:flutter_shopping_app/cart/cart.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CatalogBloc(
              productRepository:
                  ProductRepository(productProvider: ProductProvider()))
            ..add(CatalogFetched()),
        ),
        BlocProvider(
            create: (context) => CartBloc(
                  cartRepository: CartRepository(),
                )..add(CartStarted())),
      ],
      child: MaterialApp(
        title: 'Flutter Shopping App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        ),
        home: const CatalogPage(),
      ),
    );
  }
}
