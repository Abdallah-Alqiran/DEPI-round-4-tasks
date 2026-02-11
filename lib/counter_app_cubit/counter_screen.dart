import 'package:flutter/material.dart';
import 'package:flutter_application_1/counter_app_cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Counter is:"),
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text(state.toString(), style: TextStyle(fontSize: 20),);
            },
          ),
          ElevatedButton(child: Text("Increment"), onPressed: (){
            BlocProvider.of<CounterCubit>(context).increment();
          },),
          ElevatedButton(child: Text("Decrement"), onPressed: (){
            BlocProvider.of<CounterCubit>(context).decrement();
          },),
          ElevatedButton(child: Text("Reset"), onPressed: (){
            BlocProvider.of<CounterCubit>(context).reset();
          },),

        ],
      ),
    );
  }
}
