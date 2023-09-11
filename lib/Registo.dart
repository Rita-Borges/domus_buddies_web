import 'package:domus_buddies/register_keycloack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'background/BackgroundGeneric.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RegisterPage1 extends StatefulWidget {
  @override
  _RegisterPage1State createState() => _RegisterPage1State();
}

class ImageFromFile extends StatefulWidget {
  final File imageFile;

  ImageFromFile({required this.imageFile, Key? key}) : super(key: key);

  @override
  _ImageFromFileState createState() => _ImageFromFileState();
}

class _ImageFromFileState extends State<ImageFromFile> {
  UniqueKey key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Image.file(
      widget.imageFile,
      key: key,
      width: 150.0,
      height: 150.0,
      fit: BoxFit.cover,
    );
  }
}

class _RegisterPage1State extends State<RegisterPage1> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

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

  void _showSuccessSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.pink,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showErrorSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.pink, // Change color to pink
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade200,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.pink),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: _pickImage,
                            child: ClipOval(
                              child: Opacity(
                                opacity: 1.0,
                                child: _selectedImage != null
                                    ? ImageFromFile(imageFile: _selectedImage!)
                                    : Image.asset(
                                  'assets/images/logo2.png',
                                  width: 150.0,
                                  height: 150.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 8,
                            bottom: 8,
                            child: Tooltip(
                              message: "Change Picture",
                              child: CircleAvatar(
                                backgroundColor: Colors.white54,
                                child: IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.pink),
                                  onPressed: _pickImage,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _firstNameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Primeiro Nome',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .pink),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _lastNameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Último Nome',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .pink),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _usernameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .pink),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .pink),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _passwordController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .pink),
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _confirmPasswordController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Confirma a tua Password',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .pink),
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 24.0),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            String firstName = _firstNameController.text;
                            String lastName = _lastNameController.text;
                            String username = _usernameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confirmPassword = _confirmPasswordController.text;

                            if (_isAnyFieldEmpty()) {
                              _showErrorSnackBar('Por favor, preencha todos os campos.');
                              return;
                            }

                            final success = await keycloak.registerUser(
                              username: username,
                              email: email,
                              firstName: firstName,
                              lastName: lastName,
                              password: password,
                            );

                            if (success) {
                              print('User registered successfully!');
                              _showSuccessSnackBar('Registration successful!');
                              // Optionally: navigate to another page or show a success dialog
                            } else {
                              _showErrorDialog(context, 'Falha ao registrar usuário.');
                            }
                          },
                          icon: const Icon(Icons.person_add, color: Colors.white),
                          label: const Text(
                            'Registar',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
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
