part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoaded extends CartState {
  final List<CartItem> cart;

  CartLoaded({required this.cart});
}

final class CartError extends CartState {
  final String error;

  CartError({required this.error});
}

final class CartLoading extends CartState {}
