import 'package:expense_tracker/model/color.dart';
import 'package:expense_tracker/model/expense_info_model.dart';

import 'package:expense_tracker/provider/add_expense_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // TimeOfDay _time = const TimeOfDay(hour: 0, minute: 0);

  // void selectTime() async {
  //   final TimeOfDay? newTime = await showTimePicker(
  //     context: context,
  //     initialTime: _time,
  //   );
  //   if (newTime != null) {
  //     setState(() {
  //       _time = newTime;
  //     });
  //   }
  // }

  // Future addExpense() async {
  //   ExpenseInfo expenseInfo = ExpenseInfo(
  //     name: nameController.text,
  //     category: currentValue,
  //     price: int.parse(priceController.text),
  //     description: descriptionController.text,
  //   );
  //   await SharedPerfService.addExpense(expenseInfo);
  // }

  @override
  void initState() {
    // addExpenseProvider.nameController = TextEditingController();
    // addExpenseProvider.categoryController = TextEditingController();
    // addExpenseProvider.priceController = TextEditingController();
    // addExpenseProvider.descriptionController = TextEditingController();
    super.initState();
  }

  // String currentValue = 'Veg';
  // List<String> list = [
  //   'Veg',
  //   'Stationary',
  //   'Rent',
  //   'Farm',
  //   'Elect Bill',
  //   'Household',
  //   'Oil',
  //   'Others',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Expense',
          style: TextStyle(color: iconColor),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Consumer<AddExpenseProvider>(
        builder: (BuildContext context, AddExpenseProvider addExpenseProvider,
            Widget? child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Select Category'),
                      Consumer<AddExpenseProvider>(
                        builder: (BuildContext context,
                            AddExpenseProvider value, Widget? child) {
                          return DropdownButton(
                            value: addExpenseProvider.geSelectedExpense(),
                            items: addExpenseProvider.list.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (String? expense) {
                              addExpenseProvider.setSelectedExpense(expense!);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      label: const Text('Name'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Input Name',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                      label: const Text('Price'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Input Price',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      label: const Text('Description'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Input description',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(backgroundColor),
                          minimumSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width * 0.4, 50),
                          ),
                        ),
                        onPressed: () {
                          addExpense(addExpenseProvider, context);
                        },
                        child: const Text(
                          'Add Expense',
                          style: TextStyle(color: iconColor),
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(backgroundColor),
                          minimumSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width * 0.4, 50),
                          ),
                        ),
                        onPressed: () {
                          nameController.clear();
                          priceController.clear();
                          descriptionController.clear();
                        },
                        child: const Text(
                          'Clear',
                          style: TextStyle(color: iconColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void addExpense(
      AddExpenseProvider addExpenseProvider, BuildContext context) async {
    ExpenseInfo expenseInfo = ExpenseInfo(
      name: nameController.text,
      category: addExpenseProvider.geSelectedExpense(),
      price: int.parse(priceController.text),
      description: descriptionController.text,
    );
    await addExpenseProvider.addExpense(expenseInfo);
    if (mounted) {
      Navigator.pop(context);
    }
  }
}
