import 'package:flutter/material.dart';
import 'package:flutter_application_1/counter_app_cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Counter is:"),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(state.toString(), style: TextStyle(fontSize: 20),);
              },
            ),
            SizedBox(height: 8,),
            ElevatedButton(child: Text("Increment"), onPressed: (){
              BlocProvider.of<CounterCubit>(context).increment();
            },),
            SizedBox(height: 8,),
            ElevatedButton(child: Text("Decrement"), onPressed: (){
              BlocProvider.of<CounterCubit>(context).decrement();
            },),
            SizedBox(height: 8,),
            ElevatedButton(child: Text("Reset"), onPressed: (){
              BlocProvider.of<CounterCubit>(context).reset();
            },),
        
          ],
        ),
      ),
    );
  }
}
