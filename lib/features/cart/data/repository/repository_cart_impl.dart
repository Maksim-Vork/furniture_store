import 'package:project/features/cart/data/datasource/dio_cart_datasource.dart';
import 'package:project/features/cart/data/model/product_count_model.dart';
import 'package:project/features/cart/domain/entity/product_count.dart';
import 'package:project/features/cart/domain/repository/repository_cart.dart';

class RepositoryCartImpl extends RepositoryCart {
  final DioCartDatasource dataSourceCart;

  RepositoryCartImpl(this.dataSourceCart);

  @override
  Future<int> calculateProductPrice(List<ProductCount> productList) async {
    final List<ProductCountModel> product =
        productList.map((e) => ProductCountModel(e.product, e.count)).toList();
    return dataSourceCart.calculateProductPrice(product);
  }
}
