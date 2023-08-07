import 'package:domus_buddies/login.dart';
import 'package:domus_buddies/uploadPage.dart';
import 'package:flutter/material.dart';

import 'FeedPage.dart';
import 'Home_PageWetherTest.dart';
import 'RecoveryPage.dart';
import 'RecoveryPage2.dart';
import 'login.dart';
import 'uploadPage.dart';

void main() {
  // Set this to true to enable web-only functionality.
  //setWebEnabledForTesting(true);
  runApp(const DomusBuddiesApp());
}

class DomusBuddiesApp extends StatelessWidget {
  const DomusBuddiesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(),
      home: LoginPagev0(),
      //home: HomePageWeatherTest(),
      //home: NovidadesPage(),
      //home: UploadPage(),
    );
  }
}
