import 'package:project/features/cart/domain/entity/product_count.dart';

abstract class RepositoryCart {
  Future<int> calculateProductPrice(List<ProductCount> productList);
}
