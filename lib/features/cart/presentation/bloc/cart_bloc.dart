import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/cart/domain/entity/product_count.dart';
import 'package:project/features/cart/presentation/bloc/cart_event.dart';
import 'package:project/features/cart/presentation/bloc/cart_state.dart';

class CartBloc extends Bloc<BlocEvent, CartState> {
  CartBloc() : super(CartState([], 0)) {
    on<AddProduct>(_onAdd);
    on<DeleteProduct>(_onDelete);
    on<CalculatePriceProduct>(_onCalculate);
    on<IncrementCountProduct>(_onIncrement);
    on<DecreaseCountProduct>(_onDecrease);
    on<DeleteAll>(_onDeleteAll);
  }

  void _onAdd(AddProduct event, Emitter<CartState> emit) {
    final updateList = List<ProductCount>.from(state.bascet)
      ..add(ProductCount(event.product, 1));
    emit(state.copyWith(bascet: updateList));
  }

  void _onDelete(DeleteProduct event, Emitter<CartState> emit) {
    final updateList = List<ProductCount>.from(state.bascet)
      ..removeWhere((e) => e.product.name == event.name);
    emit(state.copyWith(bascet: updateList));
  }

  void _onCalculate(CalculatePriceProduct event, Emitter<CartState> emit) {
    final result = event.products.fold<double>(
      0,
      (sum, item) => sum + item.count * item.product.price,
    );
    emit(state.copyWith(price: result));
  }

  void _onIncrement(IncrementCountProduct event, Emitter<CartState> emit) {
    final current = state.bascet.firstWhere(
      (product) => product.product.name == event.name,
    );

    final double countUpdate = current.count + 1;

    final updatedProduct = current.copyWith(count: countUpdate);

    final updatedBascet =
        state.bascet.map((product) {
          return product.product.name == event.name ? updatedProduct : product;
        }).toList();

    emit(state.copyWith(bascet: updatedBascet));
  }

  void _onDecrease(DecreaseCountProduct event, Emitter<CartState> emit) {
    final current = state.bascet.firstWhere(
      (product) => product.product.name == event.name,
    );
    final double countUpdate = current.count - 1;

    final updatedProduct = current.copyWith(count: countUpdate);

    final updatedBascet =
        state.bascet.map((product) {
          return product.product.name == event.name ? updatedProduct : product;
        }).toList();

    emit(state.copyWith(bascet: updatedBascet));
  }

  void _onDeleteAll(DeleteAll event, Emitter<CartState> emit) {
    emit(state.copyWith(bascet: []));
  }
}
