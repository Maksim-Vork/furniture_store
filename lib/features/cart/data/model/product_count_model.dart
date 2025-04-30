import 'package:project/features/catalog/domain/entity/product.dart';

class ProductCountModel {
  final Product product;
  final double count;

  ProductCountModel(this.product, this.count);

  Map<String, dynamic> toJson() {
    return {"product": product, "count": count};
  }
}
