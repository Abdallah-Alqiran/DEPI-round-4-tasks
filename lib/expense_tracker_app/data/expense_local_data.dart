import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_1/expense_tracker_app/model/expense_tracker_model.dart';
import 'package:path_provider/path_provider.dart';

class ExpenseLocalData {

  static File? _file;

  static Future<List<ExpenseTrackerModel>> getAllExpensesData() async {

    if (_file == null) {
      await _initializeFile();
    }

    if (_file == null || !_file!.existsSync()) {
      return [];
    }

    final jsonContent = await _file!.readAsString();
    final expensesMap = json.decode(jsonContent) as List;

    return expensesMap.map((e) => ExpenseTrackerModel.fromJson(e)).toList();
  }

  static Future<void> addExpense(ExpenseTrackerModel expense) async {
    final allExpenses = await getAllExpensesData();
    allExpenses.add(expense);

    final expensesMaps = allExpenses.map((e) => e.toJson()).toList();
    final expenseContent = json.encode(expensesMaps);

    await _file?.writeAsString(expenseContent);
  }

  static Future<void> _initializeFile() async {
      final localPath = await getApplicationDocumentsDirectory();
      _file = File("${localPath.path}/expenses.json");
  }
}