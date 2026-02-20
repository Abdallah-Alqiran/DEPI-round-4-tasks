import 'package:flutter_application_1/cart_provider_task/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartFavoriteCubit extends Cubit<List<CartModel>> {
  CartFavoriteCubit() : super([]);

  void addFavoriteToCart(CartModel cart) {
    emit([...state, cart]);
  }
}

class CartShopCubit extends Cubit<List<CartModel>> {
  CartShopCubit() : super([]);

  void addItemToCart(CartModel cart) {
    emit([...state, cart]);
  }
}
