import 'package:add_expense/models/expense_datastr.dart';
import 'package:add_expense/widgets/expenselistitems.dart';

import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.expenselistcopy, {super.key});

  final List<Expensestruct> expenselistcopy;

  @override
  Widget build(context) {
    return ListView.builder(
      //remove
      itemCount: expenselistcopy.length,
      itemBuilder: (cntx, index) => ExpenseItem(
        expenselistcopy[index],
      ),
    );
  }
}
