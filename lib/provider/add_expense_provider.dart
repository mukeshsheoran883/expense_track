import 'package:expense_tracker/model/expense_Info.dart';
import 'package:expense_tracker/shared_preference_service/shared_preference_service.dart';
import 'package:flutter/cupertino.dart';

class AddExpenseProvider extends ChangeNotifier{
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future addExpense() async {
    ExpenseInfo expenseInfo = ExpenseInfo(
      name: nameController.text,
      category: currentValue,
      price: int.parse(priceController.text),
      description: descriptionController.text,
    );
    await SharedPerfService.addExpense(expenseInfo);
  }

  String currentValue = 'Veg';
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
}