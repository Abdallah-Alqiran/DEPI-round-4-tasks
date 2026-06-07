import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/animation_task/animated_card_extend_screen.dart' show AnimatedCardExtendScreen;
import 'package:flutter_application_1/animation_task/animated_container_screen.dart';
import 'package:flutter_application_1/animation_task/drawing_animation_screen.dart';
import 'package:flutter_application_1/cart_provider_task/cart_cubit.dart';
import 'package:flutter_application_1/cart_provider_task/cart_provider.dart';
import 'package:flutter_application_1/cart_provider_task/cart_screen.dart';
import 'package:flutter_application_1/counter_app_cubit/counter_cubit.dart';
import 'package:flutter_application_1/expense_tracker_app/data/sharedpreference_manager.dart';
import 'package:flutter_application_1/expense_tracker_app/ui/expense_home_screen.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/grid_view_screen.dart';
import 'package:flutter_application_1/navigation_task/navigation_main_screen.dart';
import 'package:flutter_application_1/notification/orders_screen.dart';
import 'package:flutter_application_1/todo_task_cubit/todo_cubit.dart';
import 'package:flutter_application_1/todo_task_cubit/todo_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'apple_task_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SharedpreferenceManager.initSharedPreference();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final String? token = await messaging.getToken();
  log('FCM Token: $token');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit()),
        BlocProvider(create: (context) => CartShopCubit()),
        BlocProvider(create: (context) => CartFavoriteCubit()),
        ChangeNotifierProvider(create: (context) => CartProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const OrdersScreen(),
      ),
    );
  }
}