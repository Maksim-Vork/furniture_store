import 'package:project/features/catalog/domain/entity/product.dart';

class ProductDto {
  final int id;
  final String name;
  final double price;

  const ProductDto({required this.id, required this.name, required this.price});

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'price': price};
  }

  Product toDomain() {
    return Product(id: id, name: name, price: price);
  }

  factory ProductDto.fromDomain(Product product) {
    return ProductDto(id: product.id, name: product.name, price: product.price);
  }
}
