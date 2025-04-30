import 'package:project/features/catalog/data/datasources/product_remote_data_source.dart';
import 'package:project/features/catalog/domain/entity/product.dart';
import 'package:project/features/catalog/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getAllProducts() async {
    final dtoList = await remoteDataSource.getAllProducts();
    return dtoList.map((dto) => dto.toDomain()).toList();
  }
}
