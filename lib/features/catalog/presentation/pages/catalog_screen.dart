import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:project/features/catalog/presentation/bloc/catalog_state.dart';
import 'package:project/features/catalog/presentation/pages/widgets/product_card.dart';
import 'package:project/features/catalog/presentation/pages/widgets/search_and_sort_bar.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: const Text(""),
        actions: const [
          Icon(Icons.grid_view, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.shopping_cart, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: Container(
        color: const Color(0xFFFFF1C1),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 12),
            const SearchAndSortBar(),
            const SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 200),
                child: BlocBuilder<CatalogBloc, CatalogState>(
                  builder: (context, state) {
                    if (state is CatalogLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CatalogLoaded) {
                      final products = state.products;

                      return GridView.builder(
                        itemCount: products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 1,
                            ),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductCard(
                            name: product.name,
                            price: '${product.price} BYN',
                          );
                        },
                      );
                    } else if (state is CatalogError) {
                      return Center(child: Text('Ошибка: ${state.message}'));
                    } else {
                      return const Center(child: Text('Нет данных'));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
