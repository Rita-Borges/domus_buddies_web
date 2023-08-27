import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Registo.dart';
import 'login.dart';


class HomePageWeatherTest extends StatefulWidget {
  const HomePageWeatherTest({Key? key}) : super(key: key);

  @override
  _HomePageWeatherTestState createState() => _HomePageWeatherTestState();
}

class _HomePageWeatherTestState extends State<HomePageWeatherTest> {
  String _currentWeather = '';
  IconData _weatherIcon = Icons.help_outline;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  void fetchWeather() async {
    final apiKey =
        'bd5e378503939ddaee76f12ad7a97608'; // Replace with your OpenWeatherMap API key
    final city = 'Lisbon'; // Replace with the desired city name

    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final temp = jsonData['main']['temp'];

        setState(() {
          _currentWeather = 'Temperature: $temp°C';
          _weatherIcon = getWeatherIcon(temp);
        });
      } else {
        setState(() {
          _currentWeather = 'Failed to fetch weather';
        });
      }
    } catch (e) {
      setState(() {
        _currentWeather = 'Failed to fetch weather';
      });
    }
  }

  IconData getWeatherIcon(double temperature) {
    if (temperature >= 30) {
      return Icons.wb_sunny;
    } else if (temperature >= 20 && temperature <= 30) {
      return Icons.wb_sunny_outlined;
    } else if (temperature >= 10 && temperature <= 20) {
      return Icons.wb_cloudy_sharp;
    } else if (temperature >= 5 && temperature <= 10) {
      return Icons.snowing;
    } else {
      return Icons.severe_cold;
    }
  }

  void navigateToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPagev0()),
    );
  }

  void navigateToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlue.shade200,
                Colors.blue.shade600,
                Colors.indigo.shade900
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              Text(
                'Domus Buddies',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontFamily: 'Handwritten',
                  fontSize: 50,
                ),
              ),
              SizedBox(height: 24),
              Icon(
                _weatherIcon,
                size: 48,
                color: Colors.white,
              ),
              SizedBox(height: 8),
              Text(
                _currentWeather,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 50),
              Image.asset(
                'assets/images/img.jpg',
              ),
              SizedBox(height: 50),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: navigateToLoginPage, // Navigate to login page
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: navigateToRegisterPage,
                      icon: Icon(
                        Icons.person_add,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(),
      home: LoginPagev0(),
    );
  }
}

class RegisterPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Page',
      theme: ThemeData(),
      //home: PositiveLogin(),
    );
  }
}
