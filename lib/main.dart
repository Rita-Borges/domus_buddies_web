
import 'package:flutter/material.dart';
import "package:domus_buddies/login.dart";


void main() {
  runApp(DomusBuddiesApp());
}

class DomusBuddiesApp extends StatelessWidget {
  const DomusBuddiesApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
      ),
      home: const LoginPage(),
    );
  }
}

