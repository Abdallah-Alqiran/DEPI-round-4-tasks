import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final List<String> _names = [];
  final List<String> _phone = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 100; i++) {
      _names.add("Name: $i");
    }
    for (int i = 123456; i < 123556; i++) {
      _phone.add("Phone: 01016611$i");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: ListView.builder(
        itemCount: _names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_names[index]),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward),
            subtitle: Text(_phone[index]),
          );
        },
      ),
    );
  }
}