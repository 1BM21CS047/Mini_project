import 'package:add_expense/page-1/homepage-1.dart';
import 'package:add_expense/widgets/Profile.dart';
import 'package:add_expense/widgets/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:add_expense/models/expense_datastr.dart';
import 'package:add_expense/widgets/expense_list.dart';
import 'package:add_expense/widgets/modalscreen.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  final List<Expensestruct> _registeredExpense = [];

  void appendList(Expensestruct instancevalue) {
    setState(() {
      _registeredExpense.add(instancevalue);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark, // Set background to black
        primarySwatch: Colors.purple, // Set primary color to purple
        //accentColor: Colors.purple, // Set accent color to purple
      ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Track-Ex'),
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext ctx) {
                        return ModalScreenContent(appendList);
                      },
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'EXPENSE CHART',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: ExpenseList(_registeredExpense)),
              ],
            ),
            bottomNavigationBar: Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExpenseCategoryPage(),
                          ));
                    },
                    child: Container(
                      child: Image.asset('images/home_btn.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddExpense(),
                          ));
                    },
                    child: Container(
                      child: Image.asset('images/transfer.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => profilePageScreen(),
                          ));
                    },
                    child: Container(
                      child: Image.asset('images/profile_btn.png'),
                    ),
                  ),
                  GestureDetector(
              onTap: () {
                //logout logic
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const homepage()),
                );
              },
              child: Container(
                child: Image.asset('images/logout_btn.png'),
              ),
            ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
