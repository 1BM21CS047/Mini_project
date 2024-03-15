import 'package:add_expense/page-1/homepage-1.dart';
import 'package:add_expense/widgets/my_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'Profile.dart';

class Expense {
  final String category;
  final double amount;

  Expense(this.category, this.amount);
}

class ExpenseCategoryPage extends StatefulWidget {
  @override
  State<ExpenseCategoryPage> createState() => _ExpenseCategoryPageState();
}

class _ExpenseCategoryPageState extends State<ExpenseCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Categories',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            CategoryList(),
            SizedBox(height: 20),
            TotalAmountList(),
            Expanded(
              child: CategoryTotalList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
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
  }
}

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Expenses').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        var categoryData = _processData(snapshot.data);

        return ExpensePieChart(expenses: categoryData);
      },
    );
  }

  List<Expense> _processData(QuerySnapshot? snapshot) {
    List<Expense> expenses = [];

    if (snapshot == null || snapshot.docs.isEmpty) {
      return expenses;
    }

    snapshot.docs.forEach((doc) {
      var category = doc['category'];
      var amount = (doc['amount'] ?? 0).toDouble();
      expenses.add(Expense(category, amount));
    });

    return expenses;
  }
}

class ExpensePieChart extends StatelessWidget {
  const ExpensePieChart({required this.expenses, Key? key}) : super(key: key);

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    Map<String, double> categoryAmountMap = {};

    expenses.forEach((expense) {
      if (categoryAmountMap.containsKey(expense.category)) {
        categoryAmountMap[expense.category] =
            categoryAmountMap[expense.category]! + expense.amount;
      } else {
        categoryAmountMap[expense.category] = expense.amount;
      }
    });

    return Container(
      decoration:
          BoxDecoration(color: const Color.fromARGB(255, 240, 166, 253)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Container(
            height: 300,
            width: 300,
            child: PieChart(
              PieChartData(
                sections: categoryAmountMap.entries
                    .map(
                      (entry) => PieChartSectionData(
                        color: getColor(entry.key),
                        value: entry.value,
                        title: '${entry.key}\nRs${entry.value.toString()}',
                        radius: 50,
                        titleStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 8, 8, 8),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
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

class TotalAmountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Expenses').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        var categoryData = _processData(snapshot.data);

        return Column(
          children: categoryData.entries
              .map(
                (entry) => ListTile(
                  title: Text(
                    '${entry.key}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Rs${entry.value.toString()}',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  tileColor: Colors.white,
                ),
              )
              .toList(),
        );
      },
    );
  }

  Map<String, double> _processData(QuerySnapshot? snapshot) {
    Map<String, double> categoryAmountMap = {};

    if (snapshot == null || snapshot.docs.isEmpty) {
      return categoryAmountMap;
    }

    snapshot.docs.forEach((doc) {
      var category = doc['category'];
      var amount = (doc['amount'] ?? 0).toDouble();

      if (categoryAmountMap.containsKey(category)) {
        categoryAmountMap[category] = categoryAmountMap[category]! + amount;
      } else {
        categoryAmountMap[category] = amount;
      }
    });

    return categoryAmountMap;
  }
}

class CategoryTotalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Expenses').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        var categoryData = _processData(snapshot.data);

        return ListView.builder(
          itemCount: categoryData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 18.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 121, 240),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${categoryData[index].key}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rs${categoryData[index].value.toString()}',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 20, 20, 20),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  List<MapEntry<String, double>> _processData(QuerySnapshot? snapshot) {
    Map<String, double> categoryAmountMap = {};

    if (snapshot == null || snapshot.docs.isEmpty) {
      return [];
    }

    snapshot.docs.forEach((doc) {
      var category = doc['category'];
      var amount = (doc['amount'] ?? 0).toDouble();

      if (categoryAmountMap.containsKey(category)) {
        categoryAmountMap[category] = categoryAmountMap[category]! + amount;
      } else {
        categoryAmountMap[category] = amount;
      }
    });

    return categoryAmountMap.entries.toList();
  }
}
