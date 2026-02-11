import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Column(
          children: [
            Text("Counter Value"),
            Consumer<CounterProvider>(
              builder: (context, provide, child) {
                return Text("${provide.counter}", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold));
              }
            ),
            ElevatedButton(onPressed: () {
              context.read<CounterProvider>().increment();
            }, child: Text("Increment")),
            ElevatedButton(onPressed: () {
              context.read<CounterProvider>().decrement();
            }, child: Text("Decrement")),
              ElevatedButton(onPressed: () {
                context.read<CounterProvider>().reset();
              }, child: Text("Reset")),
            ],
        ),
      ),
    );
  }

}