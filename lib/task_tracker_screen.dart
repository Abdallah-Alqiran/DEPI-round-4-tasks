import 'package:flutter/material.dart';

class TaskTrackerScreen extends StatefulWidget {
  const TaskTrackerScreen({super.key});

  @override
  State<TaskTrackerScreen> createState() => _TaskTrackerScreenState();
}

class _TaskTrackerScreenState extends State<TaskTrackerScreen> {
  List<ListItem> items = [];
  final TextEditingController taskTitleController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidget = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Tracker App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Form(
                  key: formKey,
                  child: SizedBox(
                    width: screenWidget * 0.8,
                    child: TextFormField(
                      controller: taskTitleController,
                      decoration: InputDecoration(label: Text("Enter a task")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a task";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Task Successfully added")),
                      );
                      items.add(
                        ListItem(
                          title: taskTitleController.text,
                          isDone: false,
                        ),
                      );
                      taskTitleController.text = "";
                      setState(() {});
                    }
                  },
                  child: Text("Add"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Dismissible(
                      key: Key(items[index].title),
                      onDismissed: (dismiss) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Task removed Successfully")),
                        );
                        setState(() {
                          items.removeAt(index);
                        });
                      },
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withValues(alpha: 0.2),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: items[index].isDone,
                              onChanged: (value) {
                                setState(() {
                                  items[index].isDone = value!;
                                });
                              },
                            ),
                            SizedBox(width: 4),
                            Text(
                              items[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: items[index].isDone == true
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem {
  String title;
  bool isDone;

  ListItem({required this.title, required this.isDone});
}
