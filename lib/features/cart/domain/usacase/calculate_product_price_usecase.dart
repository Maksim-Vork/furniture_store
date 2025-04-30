import 'package:project/features/cart/domain/entity/product_count.dart';
import 'package:project/features/cart/domain/repository/repository_cart.dart';

class CalculateProductPriceUsecase {
  final RepositoryCart repositoryCart;

  CalculateProductPriceUsecase(this.repositoryCart);

  Future<int> call(List<ProductCount> productList) async {
    return repositoryCart.calculateProductPrice(productList);
  }
}
