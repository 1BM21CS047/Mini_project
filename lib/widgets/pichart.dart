import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Expense {
  final String category;
  final double amount;

  Expense(this.category, this.amount);
}

class PieChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpensePieChart(expenses: [
        Expense('Work', 300),
        Expense('Clothes', 150),
        Expense('Food', 450),
        Expense('Bills', 200),
      ]),
    );
  }
}

class ExpensePieChart extends StatefulWidget {
  const ExpensePieChart({required this.expenses, super.key});

  final List<Expense> expenses;

  @override
  State<ExpensePieChart> createState() => _ExpensePieChartState();
}

class _ExpensePieChartState extends State<ExpensePieChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Pie Chart'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.purple),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(34.0),
                child: Container(
                  height: 300,
                  width: 300,
                  child: PieChart(
                    PieChartData(
                      sections: widget.expenses
                          .map((expense) => PieChartSectionData(
                                color: getColor(expense.category),
                                value: expense.amount,
                                title:
                                    '${expense.category}\n\$${expense.amount.toString()}',
                                radius: 50,
                                titleStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(String category) {
    switch (category) {
      case 'Work':
        return Colors.blue;
      case 'Clothes':
        return Colors.green;
      case 'Food':
        return Colors.orange;
      case 'Bills':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
