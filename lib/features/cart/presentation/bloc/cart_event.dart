import 'package:project/features/catalog/domain/entity/product.dart';

abstract class BlocEvent {}

class AddProduct extends BlocEvent {
  final Product product;

  AddProduct(this.product);
}

class DeleteProduct extends BlocEvent {
  final int index;

  DeleteProduct(this.index);
}

class CalculatePriceProduct extends BlocEvent {}

class IncrementCountProduct extends BlocEvent {
  final int index;

  IncrementCountProduct(this.index);
}

class DecreaseCountProduct extends BlocEvent {
  final int index;

  DecreaseCountProduct(this.index);
}
