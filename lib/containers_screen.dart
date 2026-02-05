import 'package:flutter/material.dart';

class ContainersScreen extends StatelessWidget {
  const ContainersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Container app")), backgroundColor: Colors.green,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Keep Coding 🔥🔥"),
          Stack(
            alignment: AlignmentGeometry.topCenter,
            children: [
              Container(color: Colors.green, width: 120, height: 120),
              Container(color: Colors.red, width: 100, height: 100),
              Container(color: Colors.yellow, width: 80, height: 80, child: Center(child: Text("H")),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
                child: Center(child: Text("E")),
              ),
              Container(
                color: Colors.green,
                width: 120,
                height: 120,
                child: Center(child: Text("L")),
              ),
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
                child: Center(child: Text("L")),
              ),
            ],
          ),
          Stack(
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              Container(color: Colors.green, width: 120, height: 120),
              Container(color: Colors.red, width: 100, height: 100),
              Container(color: Colors.yellow, width: 80, height: 80, child: Center(child: Text("O")),),
            ],
          ),
        ],
      ),
    );
  }
}
