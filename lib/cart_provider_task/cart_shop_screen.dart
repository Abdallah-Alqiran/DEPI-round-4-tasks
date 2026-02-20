import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_provider_task/cart_provider.dart';
import 'package:provider/provider.dart';

class CartShopScreen extends StatelessWidget {
  const CartShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen ", style: TextStyle(fontSize: 16)),
      ),
      body: Consumer<CartProvider>(
        builder: (contextProvider, provider, child) {
          return ListView.builder(
            itemCount: provider.inCartItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(provider.inCartItems[index].name),
                subtitle: Text(provider.inCartItems[index].salary),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.shopping_bag),
                      onPressed: () {
                        provider.removeItemFromCart(index);
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