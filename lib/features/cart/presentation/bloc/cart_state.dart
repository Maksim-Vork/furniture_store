import 'package:project/features/cart/domain/entity/product_count.dart';

class CartState {
  final double price;
  final List<ProductCount> bascet;

  CartState(this.bascet, this.price);

  CartState copyWith({List<ProductCount>? bascet, double? price}) {
    return CartState(bascet ?? this.bascet, price ?? this.price);
  }
}
