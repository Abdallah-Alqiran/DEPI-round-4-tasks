import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/cart_provider_task/cart_model.dart';

class CartProvider extends ChangeNotifier {

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

  List<CartModel> inCartItems = [];
  List<CartModel> inFavoriteItems = [];

  void addItemToCart(String name, String salary) {
    inCartItems.add(CartModel(name, salary));
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    inCartItems.removeAt(index);
    notifyListeners();
  }

  void addItemToFavorite(String name, String salary) {
    inFavoriteItems.add(CartModel(name, salary));
    notifyListeners();
  }

  void removeItemFromFavorite(int index) {
    inFavoriteItems.removeAt(index);
    notifyListeners();
  }
}