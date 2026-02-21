import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = ['Abdallah Alqiran', "Mahmoud Ramadan", "Abdallah Mahmoud"];
    final List<String> phone = ['01016611062', '01515017687', '01016611062'];

    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(names[index]),
          leading: Icon(Icons.person),
          trailing: Icon(Icons.phone),
          subtitle: Text(phone[index]),
        );
      },
    );
  }
}
