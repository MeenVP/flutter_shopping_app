part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartStarted extends CartEvent {}

final class ItemAdded extends CartEvent {
  ItemAdded(this.product);
  final Product product;
}

final class ItemRemoved extends CartEvent {
  ItemRemoved(this.item);

  final CartItem item;
}

class ClearCart extends CartEvent {}
