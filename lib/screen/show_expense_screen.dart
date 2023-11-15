import 'package:expense_tracker/model/color.dart';
import 'package:expense_tracker/model/expense_info_model.dart';
import 'package:expense_tracker/model/string.dart';
import 'package:expense_tracker/screen/add_expense_screen.dart';
import 'package:expense_tracker/shared_preference_service/shared_preference_service.dart';
import 'package:flutter/material.dart';

class ShowExpenseScreen extends StatefulWidget {
  const ShowExpenseScreen({super.key});

  @override
  State<ShowExpenseScreen> createState() => _ShowExpenseScreenState();
}

class _ShowExpenseScreenState extends State<ShowExpenseScreen> {
  List<ExpenseInfo> expList = [];
  bool isListView = true;

  Future<void> showExpense() async {
    List<ExpenseInfo> expense = await SharedPerfService.getExpenses();
    setState(() {
      expList = expense;
    });
  }

  @override
  void initState() {
    showExpense();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Center(
          child: Text(
            AppStrings.showExpenseTitle,
            style: TextStyle(color: iconColor),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              isListView = !isListView;
              setState(() {});
            },
            icon: Icon(
              isListView ? Icons.list : Icons.grid_view_outlined,
              color: iconColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isListView ? buildListView() : buildGridView(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundColor,
        child: const Icon(
          Icons.add,
          color: iconColor,
        ),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddExpenseScreen();
              },
            ),
          );
          showExpense();
        },
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: expList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: Checkbox.width * 14,
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8),
      itemBuilder: (context, index) {
        ExpenseInfo expenseInfo = expList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: backgroundColor,
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    AppStrings.category,
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    expenseInfo.category,
                    style: const TextStyle(
                      color: iconColor,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    AppStrings.name,
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    expenseInfo.name,
                    style: const TextStyle(
                      color: iconColor,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    AppStrings.price,
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    expenseInfo.price.toString(),
                    style: const TextStyle(
                      color: iconColor,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    AppStrings.description,
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    expenseInfo.description,
                    style: const TextStyle(
                      color: iconColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: expList.length,
      itemBuilder: (context, index) {
        ExpenseInfo expenseInfo = expList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: backgroundColor,
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    AppStrings.category,
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Text(
                    expenseInfo.category,
                    style: const TextStyle(
                      color: iconColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    AppStrings.name,
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Text(
                    expenseInfo.name,
                    style: const TextStyle(
                      color: iconColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    AppStrings.price,
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Text(
                    expenseInfo.price.toString(),
                    style: const TextStyle(
                      color: iconColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    AppStrings.description,
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Text(
                    expenseInfo.description,
                    style: const TextStyle(
                      color: iconColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
