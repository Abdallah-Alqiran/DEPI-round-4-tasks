import 'package:flutter/material.dart';
import 'package:flutter_application_1/expense_tracker_app/data/expense_local_data.dart';
import 'package:flutter_application_1/expense_tracker_app/model/expense_tracker_model.dart';
import 'package:flutter_application_1/expense_tracker_app/ui/add_expense_screen.dart';

class ExpenseHomeScreen extends StatefulWidget {
  const ExpenseHomeScreen({super.key});

  @override
  State<ExpenseHomeScreen> createState() => _ExpenseHomeScreenState();
}

class _ExpenseHomeScreenState extends State<ExpenseHomeScreen> {
  List<ExpenseTrackerModel> allExpenses = [];

  @override
  void initState() {
    super.initState();
    loadExpenses();
  }

  void loadExpenses() async {
    allExpenses = await ExpenseLocalData.getAllExpensesData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanses")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: allExpenses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(allExpenses[index].name),
                  subtitle: Text(
                    "Amount: ${allExpenses[index].amount} - date: ${allExpenses[index].date}",
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddExpenseScreen()),
                );

                loadExpenses();
              },
              child: Text("Add Expense"),
            ),
          ),
          SizedBox(height: 32,)
        ],
      ),
    );
  }
}
