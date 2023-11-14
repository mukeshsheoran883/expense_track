import 'package:expense_tracker/provider/add_expense_provider.dart';
import 'package:expense_tracker/screen/AddExpenseScreen.dart';
import 'package:expense_tracker/screen/show_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              return AddExpenseProvider();
            },
          ),
        ],
        child: const ShowExpenseScreen(),
      ),
    );
  }
}
