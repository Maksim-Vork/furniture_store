import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/cart/domain/entity/product_count.dart';
import 'package:project/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:project/features/cart/presentation/bloc/cart_state.dart';

class BascetPages extends StatelessWidget {
  const BascetPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1C1),
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 730,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Container(
                        width: 400,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(98, 158, 158, 158),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 70,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    minimumSize: Size(double.infinity, 70),
                                  ),
                                  child: Text('Рассчитать стоимость'),
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    'Ваша кoрзина',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Text('Товары'), Text('200')],
                              ),
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: Colors.black,
                              ),
                              SizedBox(height: 30),
                              Text(
                                'Общая стоимость:  200 BYN',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(children: [Text('Корзина')]),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(131, 205, 205, 205),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 25),
                            Text('Удалить все'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true, // Если ListView внутри ScrollView
                        primary: false,
                        itemCount: state.bascet.length,
                        itemBuilder: (context, index) {
                          return CartProduct(productCount: state.bascet[index]);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CartProduct extends StatelessWidget {
  final ProductCount productCount;
  const CartProduct({super.key, required this.productCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(132, 196, 196, 196),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 100, child: Placeholder()),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(children: [Text(productCount.product.name)]),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {},
                            icon: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    Text(productCount.count.toString()),
                    IconButton(onPressed: () {}, icon: Icon(Icons.minimize)),
                  ],
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: double.infinity,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(20),
                      ),
                    ),

                    child: Center(
                      child: Text(productCount.product.price.toString()),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
