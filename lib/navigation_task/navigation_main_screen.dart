import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation_task/calls_screen.dart';
import 'package:flutter_application_1/navigation_task/camera_screen.dart';
import 'package:flutter_application_1/navigation_task/chat_screen.dart';

class NavigationMainScreen extends StatefulWidget {
  const NavigationMainScreen({super.key});

  @override
  State<NavigationMainScreen> createState() => _NavigationMainScreenState();
}

class _NavigationMainScreenState extends State<NavigationMainScreen> {
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      CallsScreen(),
      CameraScreen(),
      ChatScreen(),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Navigation Task")),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Calls',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
