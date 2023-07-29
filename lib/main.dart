import 'package:flutter/material.dart';

import 'FeedPage.dart';
import 'Home_PageWetherTest.dart';
import 'RecoveryPage.dart';
import 'RecoveryPage2.dart';

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
      //home: HomePageWeatherTest(),
      home: NovidadesPage(),
    );
  }
}
