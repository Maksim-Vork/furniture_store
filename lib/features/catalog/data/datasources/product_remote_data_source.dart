import 'package:project/core/network/dio_service.dart';
import 'package:project/features/catalog/data/models/product_dto.dart';

class ProductRemoteDataSource {
  final DioService dioService;

  ProductRemoteDataSource(this.dioService);

  Future<List<ProductDto>> getAllProducts() async {
    try {
      final response = await dioService.get('/api/v1/furniture');
      final List<dynamic> listJson = response.data as List;
      final List<ProductDto> listProduct =
          listJson
              .map((jsonProduct) => ProductDto.fromJson(jsonProduct))
              .toList();
      return listProduct;
    } catch (e) {
      print('Ошибка типа: $e');
      return [];
    }
  }
}
