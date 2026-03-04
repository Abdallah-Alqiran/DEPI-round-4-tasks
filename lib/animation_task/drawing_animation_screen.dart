import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DrawingAnimationScreen extends StatelessWidget {
  const DrawingAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/animation/annimation.json")
      )
    );
  }
}