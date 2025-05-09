import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project/core/network/dio_service.dart';
import 'package:project/features/cart/presentation/bloc/cart_bloc.dart';

import 'package:project/features/catalog/data/datasources/product_remote_data_source.dart';
import 'package:project/features/catalog/data/repository/product_repository_impl.dart';
import 'package:project/features/catalog/domain/usecase/get_all_products.dart';
import 'package:project/features/catalog/domain/usecase/get_sort_min_products.dart';
import 'package:project/features/catalog/presentation/bloc/catalog_event.dart';
import 'package:project/features/catalog/presentation/pages/catalog_screen.dart';
import 'package:project/features/catalog/presentation/bloc/catalog_bloc.dart';

void main() {
  final DioService dioService = DioService();
  final remoteDataSource = ProductRemoteDataSource(dioService);
  final repository = ProductRepositoryImpl(remoteDataSource);
  final getAllProductsUseCase = GetAllProducts(repository);
  final getSortMinProducts = GetSortMinProducts(repository: repository);

  runApp(
    MyApp(
      catalogUseCase: getAllProductsUseCase,
      getSortMinProducts: getSortMinProducts,
    ),
  );
}

class MyApp extends StatelessWidget {
  final GetAllProducts catalogUseCase;
  final GetSortMinProducts getSortMinProducts;

  const MyApp({
    super.key,
    required this.catalogUseCase,
    required this.getSortMinProducts,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CatalogBloc>(
          create:
              (context) =>
                  CatalogBloc(catalogUseCase, getSortMinProducts)
                    ..add(LoadProducts()),
        ),
        BlocProvider<CartBloc>(create: (context) => CartBloc()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Каталог',
        theme: ThemeData(primarySwatch: Colors.orange),
        home: const CatalogScreen(),
      ),
    );
  }
}
