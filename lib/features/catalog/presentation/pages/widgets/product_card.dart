import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:project/features/cart/presentation/bloc/cart_event.dart';
import 'package:project/features/catalog/domain/entity/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: Placeholder(),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '${product.price} BYN',
            style: const TextStyle(color: Colors.green),
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {
              BlocProvider.of<CartBloc>(context).add(AddProduct(product));
            },
            icon: const Icon(Icons.shopping_cart),
            label: const Text("Заказать"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[800],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
