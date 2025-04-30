import 'package:project/core/network/dio_service.dart';
import 'package:project/features/cart/data/model/product_count_model.dart';

class DioCartDatasource {
  final DioService dioService;

  DioCartDatasource(this.dioService);

  Future<int> calculateProductPrice(List<ProductCountModel> productList) async {
    try {
      final List<dynamic> listJson =
          productList.map((product) => product.toJson()).toList();
      final response = await dioService.post('/api/v1/calculate', listJson);

      return response.data as int;
    } catch (e) {
      // ignore: avoid_print
      print('Ошибка типа: $e');
      return 0;
    }
  }
}
