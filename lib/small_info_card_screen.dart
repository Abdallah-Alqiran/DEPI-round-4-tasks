import 'package:flutter/material.dart';

class SmallInfoCardScreen extends StatelessWidget{
  const SmallInfoCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Info Card"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/profile.jpg"),
          ),
          Text("Abdallah Alqiran", style: TextStyle(fontSize: 20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Software Engineer"),
              Text("@Alqiran", style: TextStyle(color: Colors.blue),),
            ],
          ),
          Text("abdallahalqiran@gmail.com"),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.blue,),
              Text("01016611062"),
            ],
          ),
        ],
      ),
    );
  }
}