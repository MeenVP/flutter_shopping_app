import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/cart/cart.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final List<CartItem> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartError) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is! CartLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = state.cart;
          return CartView(cart: data);
        },
      ),
    );
  }
}

class CartView extends StatelessWidget {
  final List<CartItem> cart;
  const CartView({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    if (cart.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          scrollDirection: Axis.vertical,
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final item = cart[index];
            return ListTile(
              leading: Image.network(
                item.product.image,
                width: 35,
              ),
              title: Text(item.product.title),
              subtitle: Text('price: ${item.product.price}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<CartBloc>(context).add(ItemRemoved(item));
                },
              ),
            );
          },
        ),
      );
    }
    return const Center(child: Text('Card Empty'));
  }
}
