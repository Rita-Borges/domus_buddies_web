import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 80.0), // Add extra space above the title
              const Text(
                'Login ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(
                  'assets/images/logo1.png', // Replace with your own image path
                 // height: 200.0,
                  width: 150.0 ,
                ),
            ),
             const SizedBox(height: 24.0),
              TextFormField(
                style: const TextStyle(color: Colors.white), // Set the text color to white
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white), // Set the label color to white
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Set the underline color to white
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent), // Set the focused underline color to white
                  ),

                ),
              ),
             const SizedBox(height: 16.0),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white), // Set the label color to white
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Set the underline color to white
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent), // Set the focused underline color to white
                  ),
                ),
                obscureText: true,
              ),
           const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // Handle login button press
                },
                child:const Text('Login'),
              ),
           const SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                text: 'Nao tem conta? Efetue o seu registo, ',
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
                // Handle register link tap
                },
                ),
                ],
                ),
              ),
              const SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  text: 'Para recuperar a password, ',
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
                          // Handle register link tap
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
