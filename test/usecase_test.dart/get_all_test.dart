import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/features/catalog/domain/entity/product.dart';
import 'package:project/features/catalog/domain/usecase/get_all_products.dart';

import '../mocks.mocks.dart';

void main() {
  late GetAllProducts getAllProducts;
  late MockProductRepository mockProductRepository;
  setUp(() {
    mockProductRepository = MockProductRepository();
    getAllProducts = GetAllProducts(mockProductRepository);
  });

  test('Тест для проверки получения всех товаров', () async {
    final List<Product> productList = [
      Product(id: 1, name: 'Стул', price: 100),
      Product(id: 2, name: 'Стол', price: 120),
    ];

    when(
      mockProductRepository.getAllProducts(),
    ).thenAnswer((_) async => productList);

    final loadedList = await getAllProducts();

    expect(productList, loadedList);
  });
}
