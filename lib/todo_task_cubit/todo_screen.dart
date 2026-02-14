import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_task_cubit/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Todo Task")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextField(controller: controller)),
              SizedBox(width: 4),
              ElevatedButton(onPressed: () {}, child: Text("Add Task")),
            ],
          ),
          Expanded(
            child: BlocBuilder<TodoCubit, List<Item>>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state[index].itemName),

                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
