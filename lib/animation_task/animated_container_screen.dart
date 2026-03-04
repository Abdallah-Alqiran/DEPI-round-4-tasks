import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double width = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Button")),
      body: Center(
        child: AnimatedContainer(
          color: Colors.amber,
          width: width,
          height: 200,
          duration: Duration(seconds: 2),
          child: Column(
            children: [
              ElevatedButton(onPressed: () {
                width = width + 100;
                if(width >= 800) {
                  width = 100;
                }
                setState(() {});
              }, child: Text("Tap Me")),
              Text("Width $width"),
            ],
          ),
        ),
      ),
    );
  }
}
