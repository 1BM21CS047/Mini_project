// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { Work, Clothes, Food, Bills }

const categoryIcon = {
  Category.Food: Icons.lunch_dining,
  Category.Clothes: Icons.shopping_cart_rounded,
  Category.Work: Icons.work,
  Category.Bills: Icons.money,
};

class Expensestruct {
  Expensestruct(
      {required this.title,
      required this.amount,
      required this.category,
      required this.date})
      : id = uuid.v4();
  final String title;
  final double amount;
  final Category category;
  final DateTime date;
  final String id;

  String get formatteddate {
    return formatter.format(date);
  }
}
