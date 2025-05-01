import 'package:project/features/cart/domain/entity/product_count.dart';
import 'package:project/features/catalog/domain/entity/product.dart';

abstract class BlocEvent {}

class AddProduct extends BlocEvent {
  final Product product;

  AddProduct(this.product);
}

class DeleteProduct extends BlocEvent {
  final String name;

  DeleteProduct(this.name);
}

class CalculatePriceProduct extends BlocEvent {
  final List<ProductCount> products;

  CalculatePriceProduct(this.products);
}

class IncrementCountProduct extends BlocEvent {
  final String name;

  IncrementCountProduct(this.name);
}

class DecreaseCountProduct extends BlocEvent {
  final String name;

  DecreaseCountProduct(this.name);
}

class DeleteAll extends BlocEvent {}
