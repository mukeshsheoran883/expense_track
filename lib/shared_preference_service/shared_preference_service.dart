// import 'package:flutter/material.dart';
//
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   TimeOfDay _time = TimeOfDay(hour: 0, minute: 0);
//
//   void _selectTime() async {
//     final TimeOfDay? newTime = await showTimePicker(
//       context: context,
//       initialTime: _time,
//     );
//     if (newTime != null) {
//       setState(() {
//         _time = newTime;
//       });
//     }
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _selectTime,
//               child: Text('SELECT TIME'),
//             ),
//             SizedBox(height: 8),
//             Text(
//                'Selected time: ${_time.format(context)}',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // ThemeData _buildShrineTheme() {
// //   final ThemeData base = ThemeData.light();
// //   return base.copyWith(
// //     hintColor: shrineBrown900,
// //     primaryColor: shrinePink100,
// //     scaffoldBackgroundColor: shrineBackgroundWhite,
// //     cardColor: shrineBackgroundWhite,
// //     textSelectionTheme: TextSelectionThemeData(selectionColor: shrinePink100),
// //     buttonTheme: const ButtonThemeData(
// //       colorScheme: _shrineColorScheme,
// //       textTheme: ButtonTextTheme.normal,
// //     ),
// //     primaryIconTheme: _customIconTheme(base.iconTheme),
// //     textTheme: _buildShrineTextTheme(base.textTheme),
// //     primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
// //     iconTheme: _customIconTheme(base.iconTheme), checkboxTheme: CheckboxThemeData(
// //  fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
// //  if (states.contains(MaterialState.disabled)) { return null; }
// //  if (states.contains(MaterialState.selected)) { return shrinePink400; }
// //  return null;
// //  }),
// //  ), radioTheme: RadioThemeData(
// //  fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
// //  if (states.contains(MaterialState.disabled)) { return null; }
// //  if (states.contains(MaterialState.selected)) { return shrinePink400; }
// //  return null;
// //  }),
// //  ), switchTheme: SwitchThemeData(
// //  thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
// //  if (states.contains(MaterialState.disabled)) { return null; }
// //  if (states.contains(MaterialState.selected)) { return shrinePink400; }
// //  return null;
// //  }),
// //  trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
// //  if (states.contains(MaterialState.disabled)) { return null; }
// //  if (states.contains(MaterialState.selected)) { return shrinePink400; }
// //  return null;
// //  }),
// //  ), colorScheme: _shrineColorScheme.copyWith(error: shrineErrorRed),
// //   );
// // }
// //
// // IconThemeData _customIconTheme(IconThemeData original) {
// //   return original.copyWith(color: shrineBrown900);
// // }
// //
// // TextTheme _buildShrineTextTheme(TextTheme base) {
// //   return base
// //       .copyWith(
// //     caption: base.caption?.copyWith(
// //       fontWeight: FontWeight.w400,
// //       fontSize: 14,
// //       letterSpacing: defaultLetterSpacing,
// //     ),
// //     button: base.button?.copyWith(
// //       fontWeight: FontWeight.w500,
// //       fontSize: 14,
// //       letterSpacing: defaultLetterSpacing,
// //     ),
// //   )
// //       .apply(
// //     fontFamily: 'Rubik',
// //     displayColor: shrineBrown900,
// //     bodyColor: shrineBrown900,
// //   );
// // }
// //
// // const ColorScheme _shrineColorScheme = ColorScheme(
// //   primary: shrinePink400,
// //   secondary: shrinePink50,
// //   surface: shrineSurfaceWhite,
// //   background: shrineBackgroundWhite,
// //   error: shrineErrorRed,
// //   onPrimary: shrineBrown900,
// //   onSecondary: shrineBrown900,
// //   onSurface: shrineBrown900,
// //   onBackground: shrineBrown900,
// //   onError: shrineSurfaceWhite,
// //   brightness: Brightness.light,
// // );
// //
// // const Color shrinePink50 = Color(0xFFFEEAE6);
// // const Color shrinePink100 = Color(0xFFFEDBD0);
// // const Color shrinePink300 = Color(0xFFFBB8AC);
// // const Color shrinePink400 = Color(0xFFEAA4A4);
//
// const Color shrineBrown900 = Color(0xFF442B2D);
// const Color shrineBrown600 = Color(0xFF7D4F52);
//
// const Color shrineErrorRed = Color(0xFFC5032B);
//
// const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
// const Color shrineBackgroundWhite = Colors.white;
//
// const defaultLetterSpacing = 0.03;
import 'dart:convert';

import 'package:expense_tracker/model/expense_Info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPerfService {
  static const String expenseKey = '';

  static Future<void> addExpense(ExpenseInfo expenseInfo) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String addExp = jsonEncode(expenseInfo.toMap());
    List<String> expenseList =
        sharedPreferences.getStringList('ExpenseData') ?? [];
    expenseList.add(addExp);
    sharedPreferences.setStringList('ExpenseData', expenseList);
  }

  static Future<List<ExpenseInfo>> getExpenses() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> list = sharedPreferences.getStringList('ExpenseData') ?? [];
    List<ExpenseInfo> expList = [];
    for (int i = 0; i < list.length; i++) {
      String showExp = list[i];
      Map<String, dynamic> map = jsonDecode(showExp);
      ExpenseInfo expenseInfo = ExpenseInfo.fromMap(map);
      expList.add(expenseInfo);
    }
    return expList;
  }
}
