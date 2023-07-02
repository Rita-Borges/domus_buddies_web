//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0, // Remove app bar shadow
          leading: IconButton(
            icon: Icon(Icons.home),
            //icon: Icon(Icons.login),
            onPressed: () {
              // Handle login button press
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              //icon: Icon(Icons.search),
              onPressed: () {
                // Handle search button press
              },
            ),
            IconButton(
              icon: Icon(Icons.pin_drop),
              onPressed: () {
                // Handle notifications button press
              },
            ),

            IconButton(
              icon: Icon(Icons.account_circle),
              //icon: Icon(Icons.search),
              onPressed: () {
                // Handle search button press
              },
            ),
          ],
          //title: Text('Top App Bar'),

        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                ' Mobile App ',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
              Text(
                '     Dommus Buddies',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 24),
              Image.asset(
                'assets/images/ImageHome.jpeg', // Replace with your image path
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle login button press
                  },
                  icon: Icon(
                    Icons.login,
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
                    primary: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




