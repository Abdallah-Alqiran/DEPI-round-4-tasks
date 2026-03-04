import 'dart:convert';

import 'package:flutter_application_1/expense_tracker_app/model/expense_tracker_model.dart';
import 'package:http/http.dart';

class HttpHandler {
  static const String _baseUrl =
      'https://699a0c93377ac05ce28d20fa.mockapi.io/alqiran/expanses';

  static Future<List<ExpenseTrackerModel>> getAllExpenses() async {
    final response = await get(Uri.parse(_baseUrl));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final expensesJson = response.body;
      final expenseMapList = json.decode(expensesJson) as List;
      return expenseMapList
          .map((e) => ExpenseTrackerModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load Expenses");
    }
  }

  static Future<bool> addExpense(ExpenseTrackerModel expense) async {
    final expensesJsonEncode = json.encode(expense.toJson());

    final response = await post(
      Uri.parse(_baseUrl),
      body: expensesJsonEncode,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    return false;
  }

  static Future<bool> updateExpense(String id, ExpenseTrackerModel expense) async {
    final expenseJsonEncode = json.encode(expense.toJson());
    final response = await put(
      Uri.parse("$_baseUrl/$id"),
      body: expenseJsonEncode,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    return false;
  }

  static Future<bool> deleteExpense(String id) async {
    final response = await delete(
      Uri.parse("$_baseUrl/$id")
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    return false;
  }
}
