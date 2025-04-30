import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/catalog/domain/usecase/get_all_products.dart';
import 'package:project/features/catalog/presentation/bloc/catalog_event.dart';
import 'package:project/features/catalog/presentation/bloc/catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final GetAllProducts getAllProducts;

  CatalogBloc(this.getAllProducts) : super(CatalogInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<CatalogState> emit,
  ) async {
    emit(CatalogLoading());
    try {
      final products = await getAllProducts();
      emit(CatalogLoaded(products));
    } catch (e) {
      emit(CatalogError(e.toString()));
    }
  }
}
