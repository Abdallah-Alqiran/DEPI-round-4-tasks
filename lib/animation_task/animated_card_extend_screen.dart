import 'package:flutter/material.dart';

class AnimatedCardExtendScreen extends StatefulWidget {
  const AnimatedCardExtendScreen({super.key});

  @override
  State<AnimatedCardExtendScreen> createState() =>
      _AnimatedCardExtendScreenState();
}

class _AnimatedCardExtendScreenState extends State<AnimatedCardExtendScreen> {
  bool isSmallCard = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            AnimatedCrossFade(
              firstChild: Container(
                width: 400,
                height: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    "Abdallah",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
              secondChild: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.lightGreen,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    children: [
                      Text(
                        "Abdallah",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      Text("He is just a student, currently learning flutter", style: TextStyle(fontSize: 30, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              crossFadeState: isSmallCard
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(seconds: 2),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isSmallCard = !isSmallCard;
                });
              },
              child: Text("Show More..."),
            ),
          ],
        ),
      ),
    );
  }
}
