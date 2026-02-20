import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_provider_task/cart_provider.dart';
import 'package:provider/provider.dart';

class CartFavoriteScreen extends StatelessWidget {
  const CartFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Screen ", style: TextStyle(fontSize: 16)),
      ),
      body: Consumer<CartProvider>(
        builder: (contextProvider, provider, child) {
          return ListView.builder(
            itemCount: provider.inFavoriteItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(provider.inFavoriteItems[index].name),
                subtitle: Text(provider.inFavoriteItems[index].salary),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        provider.removeItemFromFavorite(index);
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
