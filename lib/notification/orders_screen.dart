import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/notification/order_details_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final List<OrderModel> orders = [
    OrderModel("101", "Pizza", "320 EGP"),
    OrderModel("102", "Burger", "280 EGP"),
    OrderModel("103", "Salad", "20 EGP"),
    OrderModel("104", "Pasta", "40 EGP"),
    OrderModel("105", "Sushi", "50 EGP"),
  ];

  @override
  void initState() {
    super.initState();
    handleForgoundMessage();
    handleBackgoundMessage();
    handleTerminatedMessage();
  }

  void navigateToOrderDetails(String orderId) {
    final OrderModel orderItem = orders.firstWhere(
      (order) => order.id == orderId,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailsScreen(order: orderItem),
      ),
    );
  }

  Future<void> handleForgoundMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("Message Data from forground: ${message.notification}");
      final orderId = message.notification?.title;
      if (orderId == null) return;

      navigateToOrderDetails(orderId);
    });
  }

  Future<void> handleBackgoundMessage() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("Message Data from background: ${message.notification}");
      final orderId = message.notification?.title;
      if (orderId == null) return;

      navigateToOrderDetails(orderId);
    });
  }

  Future<void> handleTerminatedMessage() async {
    FirebaseMessaging.instance.getInitialMessage().then((
      RemoteMessage? message,
    ) {
      log("Message Data from terminated: ${message?.notification}");
      if (message == null) return;
      final orderId = message.notification?.title;
      if (orderId == null) return;
      navigateToOrderDetails(orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Order ${orders[index].id}: ${orders[index].title}"),
            subtitle: Text("Price: ${orders[index].price}"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDetailsScreen(order: orders[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class OrderModel {
  final String id;
  final String title;
  final String price;
  OrderModel(this.id, this.title, this.price);
}
