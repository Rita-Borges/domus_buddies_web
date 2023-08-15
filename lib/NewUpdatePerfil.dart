import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UppdatePage extends StatefulWidget {
  @override
  _UppdatePageState createState() => _UppdatePageState();
}

class _UppdatePageState extends State<UppdatePage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _moradaRuaController = TextEditingController();
  TextEditingController _moradaCodigoPostalController = TextEditingController();
  TextEditingController _moradaCidadeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade200, // Set the AppBar color
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.pink),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
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
    child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //const SizedBox(height: 40.0), // Add extra space above the title
              const Text(
                'Atualizar perfil ',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Handwritten',
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/images/logo2.png', // Replace with your own image path
                  // height: 200.0,
                  width: 130.0,
                ),
              ),
              const SizedBox(height: 16.0), // Add extra space above the title
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
              SizedBox(height: 16.0),
              TextField(
                controller: _moradaRuaController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Morada - Rua',
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
                controller: _moradaCodigoPostalController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Morada - codigo postal ',
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
                controller: _moradaCidadeController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Morada - cidade ',
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
          ElevatedButton(
            onPressed: () {
              String firstName = _firstNameController.text;
              String lastName = _lastNameController.text;
              String username = _usernameController.text;
              String email = _emailController.text;
              String password = _passwordController.text;
              String confirmPassword = _confirmPasswordController.text;
              String MoradaRua = _moradaRuaController.text;
              String MoradaCodigoPostal = _moradaCodigoPostalController.text;
              String MoradaCidade = _moradaCidadeController.text;

              // Perform registration logic here
              // Example: print the user's information
              print('First Name: $firstName');
              print('Last Name: $lastName');
              print('Username: $username');
              print('Email: $email');
              print('Password: $password');
              print('Confirm Password: $confirmPassword');
              print('Confirm Street name: $MoradaRua');
              print('Confirm codigo postal: $MoradaCodigoPostal');
              print('Confirm city: $MoradaCidade');

              // Show the Cupertino-style dialog
              _showLocationPermissionDialog(context);
            },
            child: Text(
              'Atualizar',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              primary: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
            ],
                ),
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