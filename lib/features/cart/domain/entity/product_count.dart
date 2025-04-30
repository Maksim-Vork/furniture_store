import 'package:project/features/catalog/domain/entity/product.dart';

class ProductCount {
  final Product product;
  final double count;

  ProductCount(this.product, this.count);

  ProductCount copyWith({Product? product, double? count}) {
    return ProductCount(product ?? this.product, count ?? this.count);
  }
}
