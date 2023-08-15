import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'REGISTERKeycloack.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  final KeycloakServiceRegister keycloak = KeycloakServiceRegister(
    baseUrl: 'https://lemur-6.cloud-iam.com',
    realm: 'domusbuddies',
    clientId: 'domusbuddies-app',
    clientSecret: 'a8XIyFyT9EpUBqegN2EncuZkgJXTEJfP',
  );


  bool _isAnyFieldEmpty() {
    return [
      _firstNameController,
      _lastNameController,
      _usernameController,
      _emailController,
      _passwordController,
      _confirmPasswordController
    ].any((controller) => controller.text.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade200,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.pink),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Efetuar Registo ',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Handwritten',
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          'assets/images/logo2.png',
                          width: 150.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _firstNameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Primeiro Nome',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
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
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _lastNameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Último Nome',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
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
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _usernameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
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
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
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
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
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
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _confirmPasswordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Confirma a tua Password',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
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
                      SizedBox(height: 24.0),
                      ElevatedButton.icon(
                        onPressed: () async {
                          String firstName = _firstNameController.text;
                          String lastName = _lastNameController.text;
                          String username = _usernameController.text;
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          String confirmPassword = _confirmPasswordController.text;
                          // Perform registration logic here
                          // Example: print the user's information
                          print('First Name: $firstName');
                          print('Last Name: $lastName');
                          print('Username: $username');
                          print('Email: $email');
                          print('Password: $password');
                          print('Confirm Password: $confirmPassword');

                          if (_isAnyFieldEmpty()) {
                            _showErrorDialog(context, 'Por favor, preencha todos os campos.');
                            return;
                          }
                          // Show the Cupertino-style dialog
                          _showLocationPermissionDialog(context);

                          final success = await keycloak.registerUser(
                            username: _usernameController.text,
                            email: _emailController.text,
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            password: _passwordController.text,
                          );

                          if (success) {
                            print('User registered successfully!');
                            // Optionally: navigate to another page or show a success dialog
                          } else {
                            _showErrorDialog(context, 'Falha ao registrar usuário.');
                          }

                        },
                        icon: Icon(Icons.person_add, color: Colors.white), // This is the icon for registering.
                        label: Text(
                          'Registar',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ],
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
// Function to show Cupertino-style dialog
void _showLocationPermissionDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('Location Permission'),
        content: Text('Do you allow the application to use your location via GPS?'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('Yes'),
            onPressed: () {
              // Handle location permission logic here
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Erro'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
