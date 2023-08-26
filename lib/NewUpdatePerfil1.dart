import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'AppBarGeneric.dart';
import 'BackgroundGeneric.dart';

class UppdatePage1 extends StatefulWidget {
  @override
  _UppdatePage1State createState() => _UppdatePage1State();
}

class _UppdatePage1State extends State<UppdatePage1> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _moradaRuaController = TextEditingController();
  TextEditingController _moradaCodigoPostalController = TextEditingController();
  TextEditingController _moradaCidadeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        body: GradientBackground(
          // child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                      textAlign: TextAlign.center,  // This line centers the text
                    ),

                    ClipOval(
                      child: Image.asset(
                        'assets/images/logo2.png',
                        width: 150.0,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16.0),
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

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          String firstName = _firstNameController.text;
                          String lastName = _lastNameController.text;
                          String email = _emailController.text;
                          String MoradaRua = _moradaRuaController.text;
                          String MoradaCodigoPostal = _moradaCodigoPostalController.text;
                          String MoradaCidade = _moradaCidadeController.text;

                          // Perform registration logic here
                          // Example: print the user's information
                          print('First Name: $firstName');
                          print('Email: $email');
                          //print('Password: $password');
                          //print('Confirm Password: $confirmPassword');
                          print('Confirm Street name: $MoradaRua');
                          print('Confirm codigo postal: $MoradaCodigoPostal');
                          print('Confirm city: $MoradaCidade');

                          // Show the Cupertino-style dialog
                          //_showLocationPermissionDialog(context);
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
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
