import 'package:flutter/material.dart';

//import "package:domus_buddies/login.dart";
//import 'Home_Page.dart';
import 'Registo.dart';

void main() {
  runApp(const DomusBuddiesApp());
}

class DomusBuddiesApp extends StatelessWidget {
  const DomusBuddiesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(),
      //home: const LoginPage(),
      //home: const HomePage(),
      home: RegisterPage(),
    );
  }
}
