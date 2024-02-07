
import 'package:add_expense/main.dart';
import 'package:add_expense/page-1/homepage-1.dart';
import 'package:add_expense/widgets/Profile.dart';
import 'package:add_expense/widgets/dashboard.dart';
import 'package:add_expense/widgets/my_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:myapp/page-1/add-expense.dart';
//import 'package:myapp/page-1/add-income.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap Scaffold with SingleChildScrollView
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //if user is logged in
            if (snapshot.hasData) {
              return ExpenseCategoryPage();
            } else {
              return  const homepage();
            }
          },
        ),
      ),
    );
  }
}
