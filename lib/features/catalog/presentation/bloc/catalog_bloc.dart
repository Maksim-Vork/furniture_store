import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/catalog/domain/usecase/get_all_products.dart';
import 'package:project/features/catalog/domain/usecase/get_sort_min_products.dart';
import 'package:project/features/catalog/presentation/bloc/catalog_event.dart';
import 'package:project/features/catalog/presentation/bloc/catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final GetAllProducts getAllProducts;
  final GetSortMinProducts getSortMinProducts;

  CatalogBloc(this.getAllProducts, this.getSortMinProducts)
    : super(CatalogInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<LoadSortMinProducts>(_onLoadSortMin);
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

  void _onLoadSortMin(
    LoadSortMinProducts event,
    Emitter<CatalogState> emit,
  ) async {
    emit(CatalogLoading());
    try {
      final products = await getSortMinProducts();
      emit(CatalogLoaded(products));
    } catch (e) {
      emit(CatalogError(e.toString()));
    }
  }
}
