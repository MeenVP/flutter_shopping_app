part of 'catalog_bloc.dart';

@immutable
sealed class CatalogEvent {
  const CatalogEvent();
}

final class CatalogFetched extends CatalogEvent {}
