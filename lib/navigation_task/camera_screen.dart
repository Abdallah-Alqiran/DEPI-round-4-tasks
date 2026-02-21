import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int photos = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Icon(Icons.camera, size: 100, color: Colors.blue,),
          SizedBox(height: 10,),
          Text("Photos Taken: $photos", style: TextStyle(fontSize: 25),),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            setState(() {
              photos++;
            });
          }, child: Text("Take Photo", style: TextStyle(fontSize: 25),)),
        ],
      ),
    );
  }
}