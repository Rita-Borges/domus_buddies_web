import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'registo.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentWeather = '';
  String _weatherIconPath = 'assets/Gif/connection-error.gif';

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    try {
      const apiKey = 'bd5e378503939ddaee76f12ad7a97608';
      const city = 'Lisbon';
      final url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final temp = jsonData['main']['temp'];
        final weatherIconPath = getWeatherIconPath(temp);

        setState(() {
          _currentWeather = 'Temperatura: $temp°C';
          _weatherIconPath = weatherIconPath;
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

  String getWeatherIconPath(double temperature) {
    if (temperature >= 30) {
      return 'assets/images/sun_1.png';
    } else if (temperature >= 20 && temperature <= 30) {
      return 'assets/images/sun.png';
    } else if (temperature >= 10 && temperature <= 20) {
      return 'assets/images/sun-behind-cloud.png';
    } else if (temperature >= 5 && temperature <= 10) {
      return 'assets/images/rain.png';
    } else {
      return 'assets/images/snowflake.png';
    }
  }

  void navigateToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPagev0()),
    );
  }

  void navigateToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage1()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: buildContent(),
      ),
    );
  }

  Widget buildContent() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;
        final isSmallScreen = screenWidth < 600;

        return Container(
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
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Domus Buddies',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontFamily: 'Handwritten',
                        fontSize: isSmallScreen ? 40.0 : 80.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset(
                      _weatherIconPath,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Text(
                    _currentWeather,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: isSmallScreen ? 16.0 : 20.0,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 400, // Set the maximum width
                      maxHeight: 400, // Set the maximum height
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 2.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'assets/Gif/MV5L.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildElevatedButton(
                        onPressed: navigateToLoginPage,
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: isSmallScreen ? 13.0 : 20.0,
                        ),
                        label: 'Login',
                        isSmallScreen: isSmallScreen,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      buildElevatedButton(
                        onPressed: navigateToRegisterPage,
                        icon: Icon(
                          Icons.person_add,
                          color: Colors.white,
                          size: isSmallScreen ? 13.0 : 20.0,
                        ),
                        label: 'Registar',
                        isSmallScreen: isSmallScreen,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildElevatedButton({
    required VoidCallback onPressed,
    required Icon icon,
    required String label,
    required bool isSmallScreen,
  }) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 400,
        maxHeight: 80,
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          label,
          style: TextStyle(
            fontSize: isSmallScreen ? 13.0 : 20.0,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 13.0 : 20.0,
            vertical: 16.0, // Use a fixed value for vertical padding
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
