import 'package:flutter/material.dart';
import 'package:flutter_application_1/expense_tracker_app/data/http_handler.dart';
// import 'package:flutter_application_1/expense_tracker_app/data/expense_local_data.dart';
import 'package:flutter_application_1/expense_tracker_app/model/expense_tracker_model.dart';

class AddExpenseScreen extends StatefulWidget {
  final ExpenseTrackerModel? expense;
  final bool isUpdate;
  const AddExpenseScreen({super.key, this.expense, this.isUpdate = false});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Expense Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      label: Text("Enter Expense..."),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter...";
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: amountController,
                    decoration: InputDecoration(label: Text("Enter Amount")),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter...";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(label: Text("Enter Date")),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter...";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (widget.isUpdate) {
                    final expense = ExpenseTrackerModel(
                      name: descriptionController.text,
                      amount: amountController.text,
                      date: dateController.text,
                    );
                    await HttpHandler.updateExpense(expense.id ?? '', expense);
                  } else {
                    final expense = ExpenseTrackerModel(
                      name: descriptionController.text,
                      amount: amountController.text,
                      date: dateController.text,
                    );
                    await HttpHandler.addExpense(expense);
                    // await ExpenseLocalData.addExpense(expense);
                  }
                }
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
