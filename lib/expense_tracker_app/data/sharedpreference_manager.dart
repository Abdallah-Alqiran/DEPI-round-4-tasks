import 'dart:convert';

import 'package:flutter_application_1/expense_tracker_app/model/expense_tracker_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceManager {
  static late SharedPreferences _sharedPreference;

  static Future<void> initSharedPreference() async {
    _sharedPreference = await SharedPreferences.getInstance();
  }

  static Future<void> addExpense(ExpenseTrackerModel expense) async {
    final expenseJson = expense.toJson();
    final expenseJsonMap = json.encode(expenseJson);

    await _sharedPreference.setString(expense.id ?? '', expenseJsonMap);
  }

  

}