import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/cart/domain/entity/product_count.dart';
import 'package:project/features/cart/presentation/bloc/cart_event.dart';
import 'package:project/features/cart/presentation/bloc/cart_state.dart';

class CartBloc extends Bloc<BlocEvent, BlocState> {
  CartBloc() : super(BlocState([])) {
    on<AddProduct>(_onAdd);
    on<DeleteProduct>(_onDelete);
    on<CalculatePriceProduct>(_onCalculate);
    on<IncrementCountProduct>(_onIncrement);
    on<DecreaseCountProduct>(_onDecrease);
  }

  void _onAdd(AddProduct event, Emitter<BlocState> emit) {
    final updateList = List<ProductCount>.from(state.bascet)
      ..add(ProductCount(event.product, 1));
    emit(BlocState(updateList));
  }

  void _onDelete(DeleteProduct event, Emitter<BlocState> emit) {
    final updateList = List<ProductCount>.from(state.bascet)
      ..removeAt(event.index);
    emit(BlocState(updateList));
  }

  void _onCalculate(CalculatePriceProduct event, Emitter<BlocState> emit) {}

  void _onIncrement(IncrementCountProduct event, Emitter<BlocState> emit) {
    final current = state.bascet[event.index];
    final double countUpdate = current.count + 1;

    final updatedProduct = current.copyWith(count: countUpdate);

    final updatedBascet = List<ProductCount>.from(state.bascet)
      ..[event.index] = updatedProduct;

    emit(BlocState(updatedBascet));
  }

  void _onDecrease(DecreaseCountProduct event, Emitter<BlocState> emit) {
    final current = state.bascet[event.index];
    final double countUpdate = current.count - 1;

    final updatedProduct = current.copyWith(count: countUpdate);

    final updatedBascet = List<ProductCount>.from(state.bascet)
      ..[event.index] = updatedProduct;

    emit(BlocState(updatedBascet));
  }
}
