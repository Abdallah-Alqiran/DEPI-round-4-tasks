import 'package:flutter/material.dart';

class AppleTaskScreen extends StatefulWidget {
  const AppleTaskScreen({super.key});

  @override
  State<AppleTaskScreen> createState() => _AppleTaskScreenState();
}

class _AppleTaskScreenState extends State<AppleTaskScreen> {
  Color color = Colors.green;
  Widget? newWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Apple Game")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Drag the Apple to the box below",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 80),
            Draggable(
              data: const Text("🍎", style: TextStyle(fontSize: 40)),
              feedback: Material(
                color: Colors.transparent,
                child: const Text("🍎", style: TextStyle(fontSize: 40)),
              ),
              child: const Text("🍎", style: TextStyle(fontSize: 40)),
            ),
            SizedBox(height: 80),
            DragTarget<Widget>(
              builder: (context, widgetData, rejectedData) {
                if (widgetData.isNotEmpty && widgetData.first != null) {
                  newWidget = widgetData.first;
                  color = Colors.grey;
                }
                return GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      newWidget = null;
                      color = Colors.green;
                    });
                  },
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: color,
                    ),
                    child: Center(
                      child:
                          newWidget ??
                          Text("Drop Here!!", style: TextStyle(fontSize: 40)),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
