import 'package:expense_tracker/model/expense_Info.dart';
import 'package:expense_tracker/shared_preference_service/shared_preference_service.dart';
import 'package:flutter/material.dart';

class AddExpenseProvider extends ChangeNotifier {
  Future addExpense(ExpenseInfo expenseInfo) async {
    notifyListeners();
    await SharedPerfService.addExpense(expenseInfo);
  }

  String _currentExpense = 'Veg';

  String geSelectedExpense() {
    return _currentExpense;
  }

  List<String> list = [
    'Veg',
    'Stationary',
    'Rent',
    'Farm',
    'Elect Bill',
    'Household',
    'Oil',
    'Others',
  ];

  void setSelectedExpense(String expense) {
    _currentExpense = expense;
    notifyListeners();
  }
}
