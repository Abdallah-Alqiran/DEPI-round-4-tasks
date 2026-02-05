import 'package:flutter/material.dart';

class InteractivityScreen extends StatefulWidget {
  const InteractivityScreen({super.key});

  @override
  State<InteractivityScreen> createState() => _InteractivityScreenState();
}

class _InteractivityScreenState extends State<InteractivityScreen> {
  Color color = Colors.green;
  double size = 200;
  Offset offset = Offset(0, 0);
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Interactivity")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              color == Colors.green ? color = Colors.red : color = Colors.green;
            });
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("On Tap Pressed")));
          },
          onDoubleTap: () {
            setState(() {
              size = 150;
            });
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("On Double Tap Pressed")));
          },
          onLongPress: () {
            setState(() {
              size = 200;
            });
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("On Long Pressed")));
          },
          onScaleUpdate: (newScale) {
            setState(() {
              if (newScale.scale != 1) {
                scale = newScale.scale;
              }
              offset += newScale.focalPointDelta;
            });
          },
          child: Transform.translate(
            offset: offset,
            child: Transform.scale(
              scale: scale,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: color,
                ),
                child: Center(child: Text("Click Me!!")),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
