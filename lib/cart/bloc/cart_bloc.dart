import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_shopping_app/cart/cart.dart';

import 'package:flutter_shopping_app/catalog/catalog.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.cartRepository}) : super(CartInitial()) {
    on<CartStarted>(_onInitial);
    on<ItemAdded>(onItemAdded);
    on<ItemRemoved>(onItemRemoved);
  }

  final CartRepository cartRepository;

  void _onInitial(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final List<CartItem> cart = cartRepository.getCartItems();
      emit(CartLoaded(cart: cart));
      return;
    } catch (e) {
      emit(CartError(error: e.toString()));
      return;
    }
  }

  void onItemAdded(ItemAdded event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      cartRepository.addItemByProduct(event.product);
      emit(CartLoaded(cart: cartRepository.getCartItems()));
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  void onItemRemoved(ItemRemoved event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      cartRepository.removeItem(event.item);
      emit(CartLoaded(cart: cartRepository.getCartItems()));
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }
}
