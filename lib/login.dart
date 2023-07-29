import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Registo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 80.0), // Add extra space above the title
              const Text(
                'Efetue Login ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Handwritten',
                ),
              ),
              const SizedBox(height: 24.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/images/logo1.png', // Replace with your own image path
                  // height: 200.0,
                  width: 150.0,
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                // Set the text color to white
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  // Set the label color to white
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Colors.white), // Set the underline color to white
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .pink), // Set the focused underline color to white
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  // Set the label color to white
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Colors.white), // Set the underline color to white
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .pink), // Set the focused underline color to white
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 32.0),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle login button press
                },
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                label: Text(
                  'login',
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

              const SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  text: 'Para recuperar a sua password, ',
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: 'clique Aqui',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PositiveLogin(),
                            ),
                          );
                        },
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

class PositiveLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Move to feedPage',
      theme: ThemeData(),
      //home: PositiveLogin(),
    );
  }
}

class PasswordRecoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Recovery Page',
      theme: ThemeData(),
      home: PositiveLogin(),
    );
  }
}
