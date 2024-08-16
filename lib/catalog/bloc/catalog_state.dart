part of 'catalog_bloc.dart';

@immutable
sealed class CatalogState {}

final class CatalogInitial extends CatalogState {}

final class CatalogLoaded extends CatalogState {
  final Catalog catalog;

  CatalogLoaded({required this.catalog});
}

final class CatalogError extends CatalogState {
  final String error;

  CatalogError({required this.error});
}

final class CatalogLoading extends CatalogState {}
