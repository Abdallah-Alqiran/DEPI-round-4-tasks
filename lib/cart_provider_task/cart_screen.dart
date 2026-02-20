import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_provider_task/cart_cubit.dart';
import 'package:flutter_application_1/cart_provider_task/cart_favorite_screen.dart';
import 'package:flutter_application_1/cart_provider_task/cart_model.dart';
import 'package:flutter_application_1/cart_provider_task/cart_provider.dart';
import 'package:flutter_application_1/cart_provider_task/cart_shop_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartModel> items = [
      CartModel("Item 1", "200"),
      CartModel("Item 2", "300"),
      CartModel("Item 3", "152"),
      CartModel("Item 4", "140"),
      CartModel("Item 5", "210"),
      CartModel("item 6", "520"),
      CartModel("item 7", "750"),
      CartModel("item 8", "5"),
      CartModel("name", "salary"),
      CartModel("name", "salary"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("cart screen ", style: TextStyle(fontSize: 16)),
        actions: [
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartFavoriteScreen(),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<CartFavoriteCubit, List<CartModel>>(
                    builder: (context, state) {
                      return Container(
                        color: Colors.red.withValues(alpha: 0.6),
                        width: 20,
                        height: 20,
                        child: Center(
                          child: Text(
                            state.length.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_bag),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartShopScreen(),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<CartShopCubit, List<CartModel>>(
                    builder: (context, state) {
                      return Container(
                        color: Colors.red.withValues(alpha: 0.6),
                        width: 20,
                        height: 20,
                        child: Center(
                          child: Text(
                            state.length.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Text(items[index].salary),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<CartFavoriteCubit, List<CartModel>>(
                  builder: (context, state) {
                    return SizedBox(
                      width: 40,
                      height: 40,
                      child: IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                          BlocProvider.of<CartFavoriteCubit>(
                            context,
                          ).addFavoriteToCart(
                            CartModel(items[index].name, items[index].salary),
                          );
                        },
                      ),
                    );
                  },
                ),
                BlocBuilder<CartShopCubit, List<CartModel>>(
                  builder: (context, state) {
                    return SizedBox(
                      width: 40,
                      height: 40,
                      child: IconButton(
                        icon: Icon(Icons.shopping_bag),
                        onPressed: () {
                          BlocProvider.of<CartShopCubit>(context)
                              .addItemToCart(
                            CartModel(items[index].name, items[index].salary),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
