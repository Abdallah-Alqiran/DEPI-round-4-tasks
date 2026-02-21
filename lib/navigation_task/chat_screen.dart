import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation_task/about_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      'Abdallah Alqiran',
      "Mahmoud Ramadan",
      "Abdallah Mahmoud",
    ];
    final List<String> message = ['How are you?', 'I solved the questions yesterday', 'When you will come?'];
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
          },
          title: Text(names[index]),
          leading: Icon(Icons.person),
          subtitle: Text(message[index]),
        );
      },
    );
  }
}
