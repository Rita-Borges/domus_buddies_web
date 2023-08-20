import 'package:domus_buddies/login.dart';
import 'package:domus_buddies/uploadPage.dart';
import 'package:flutter/material.dart';

import 'AddPetToUser.dart';
import 'FeedPage.dart';
import 'Home_PageWetherTest.dart';
import 'NewAdoption.dart';
import 'NewUpdatePerfil.dart';
import 'REGISTERKeycloack.dart';
import 'Registo.dart';
import 'login.dart';
import 'uploadPage.dart';

void main() async{
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
      home: NovidadesPage(),
      //home: HomePageWeatherTest(),
      //home: AdotePage(),
      //home: RegisterPage(),
    );
  }
}
