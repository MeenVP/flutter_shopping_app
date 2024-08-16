import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_shopping_app/catalog/catalog.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final ProductRepository productRepository;

  CatalogBloc({required this.productRepository}) : super(CatalogInitial()) {
    on<CatalogFetched>(_getCatalog);
  }

  void _getCatalog(CatalogFetched event, Emitter<CatalogState> emit) async {
    emit(CatalogLoading());
    try {
      final List<Product> products = await productRepository.getAllProducts();
      final Catalog catalog = Catalog(products: products);
      emit(CatalogLoaded(catalog: catalog));
      return;
    } catch (e) {
      emit(CatalogError(error: e.toString()));
      return;
    }
  }
}
