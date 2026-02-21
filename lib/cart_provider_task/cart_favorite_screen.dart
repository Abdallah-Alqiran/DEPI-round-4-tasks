import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_provider_task/cart_cubit.dart';
import 'package:flutter_application_1/cart_provider_task/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartFavoriteScreen extends StatelessWidget {
  const CartFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Screen ", style: TextStyle(fontSize: 16)),
      ),
      body: BlocBuilder<CartFavoriteCubit, List<CartModel>>(
        builder: (contextProvider, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state[index].name),
                subtitle: Text(state[index].salary),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
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
