import 'package:flutter/material.dart';

import 'Home_PageWetherTest.dart';

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
      //home: LoginPage(),
      home: HomePageWeatherTest(),
      //home: PasswordRecoveryPage(),
    );
  }
}
