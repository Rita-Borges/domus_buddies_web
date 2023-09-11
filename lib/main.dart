
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home_PageWetherTest.dart';
import 'User/get_keycloack_token.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    ChangeNotifierProvider(
      create: (context) => FetchUserData(),
      child: DomusBuddiesApp(),
    ),
  );
}


class DomusBuddiesApp extends StatelessWidget {
  const DomusBuddiesApp({super.key});
  static FetchUserData userInfo = FetchUserData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(),
      home: HomePageWeatherTest(),
    );
  }
}
