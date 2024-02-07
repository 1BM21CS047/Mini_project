import 'package:add_expense/page-1/homepage-1.dart';
import 'package:add_expense/services/auth/auth_gate.dart';
import 'package:add_expense/widgets/Profile.dart';
import 'package:add_expense/widgets/dashboard.dart';
import 'package:add_expense/widgets/my_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:add_expense/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profilePageScreen(),
    );
  }
}
