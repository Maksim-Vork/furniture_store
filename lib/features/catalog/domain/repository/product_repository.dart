import 'package:project/features/catalog/domain/entity/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
}
