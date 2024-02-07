import 'package:add_expense/models/expense_datastr.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenselistelement, {super.key});

  final Expensestruct expenselistelement;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children: [
            Text(expenselistelement.title),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Rs ${expenselistelement.amount.toString()}',
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[expenselistelement.category]),
                    Text(
                      ' ${expenselistelement.formatteddate.toString()}',
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
