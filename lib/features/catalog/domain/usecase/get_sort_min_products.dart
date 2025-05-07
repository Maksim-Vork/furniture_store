import 'package:project/features/catalog/domain/entity/product.dart';
import 'package:project/features/catalog/domain/repository/product_repository.dart';

class GetSortMinProducts {
  final ProductRepository repository;

  GetSortMinProducts({required this.repository});

  Future<List<Product>> call() async {
    return await repository.getSortMinProducts();
  }
}
