import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/cart/domain/entity/product_count.dart';
import 'package:project/features/cart/presentation/bloc/cart_event.dart';
import 'package:project/features/cart/presentation/bloc/cart_state.dart';

class CartBloc extends Bloc<BlocEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<AddProduct>(_onAdd);
    on<DeleteProduct>(_onDelete);
    on<CalculatePriceProduct>(_onCalculate);
    on<IncrementCountProduct>(_onIncrement);
    on<DecreaseCountProduct>(_onDecrease);
  }

  void _onAdd(AddProduct event, Emitter<CartState> emit) {
    final updateList = List<ProductCount>.from(state.bascet)
      ..add(ProductCount(event.product, 1));
    emit(CartState(updateList));
  }

  void _onDelete(DeleteProduct event, Emitter<CartState> emit) {
    final updateList = List<ProductCount>.from(state.bascet)
      ..removeAt(event.index);
    emit(CartState(updateList));
  }

  void _onCalculate(CalculatePriceProduct event, Emitter<CartState> emit) {}

  void _onIncrement(IncrementCountProduct event, Emitter<CartState> emit) {
    final current = state.bascet[event.index];
    final double countUpdate = current.count + 1;

    final updatedProduct = current.copyWith(count: countUpdate);

    final updatedBascet = List<ProductCount>.from(state.bascet)
      ..[event.index] = updatedProduct;

    emit(CartState(updatedBascet));
  }

  void _onDecrease(DecreaseCountProduct event, Emitter<CartState> emit) {
    final current = state.bascet[event.index];
    final double countUpdate = current.count - 1;

    final updatedProduct = current.copyWith(count: countUpdate);

    final updatedBascet = List<ProductCount>.from(state.bascet)
      ..[event.index] = updatedProduct;

    emit(CartState(updatedBascet));
  }
}
