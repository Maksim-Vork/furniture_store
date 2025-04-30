import 'package:project/features/catalog/domain/entity/product.dart';
import 'package:project/features/catalog/domain/repository/product_repository.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getAllProducts();
  }
}
