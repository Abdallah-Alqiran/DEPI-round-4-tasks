import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_provider_task/cart_favorite_screen.dart';
import 'package:flutter_application_1/cart_provider_task/cart_provider.dart';
import 'package:flutter_application_1/cart_provider_task/cart_shop_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart screen ", style: TextStyle(fontSize: 16)),
        actions: [
          Consumer<CartProvider>(
            builder: (context, provider, child) {
              return Row(
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
                      Container(
                        color: Colors.red.withValues(alpha: 0.6),
                        width: 20,
                        height: 20,
                        child: Text(provider.inFavoriteItems.length.toString()),
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
                      Container(
                        color: Colors.red.withValues(alpha: 0.6),
                        width: 20,
                        height: 20,
                        child: Text(provider.inCartItems.length.toString()),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (contextProvider, provider, child) {
          return ListView.builder(
            itemCount: provider.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(provider.items[index].name),
                subtitle: Text(provider.items[index].salary),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        provider.addItemToFavorite(
                          provider.items[index].name,
                          provider.items[index].salary,
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_bag),
                      onPressed: () {
                        provider.addItemToCart(
                          provider.items[index].name,
                          provider.items[index].salary,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
