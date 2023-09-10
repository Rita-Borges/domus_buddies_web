import 'package:domus_buddies/fetch_user_info.dart';
import 'package:domus_buddies/global_pet_data.dart';
import 'package:domus_buddies/post_registo_clinico.dart';
import 'package:domus_buddies/update_get_user_info_request.dart';
import 'package:domus_buddies/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/animal_Info.dart';

import 'get_pet_list_request.dart';
import 'AddPetToUser.dart';
import 'background/AppBarGeneric.dart';
import 'background/BackgroundGeneric.dart';
import 'registo_veterinario.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RegistoVacinas1 extends StatefulWidget {
  const RegistoVacinas1(AnimalInfo animalInfo, {Key? key}) : super(key: key);

  @override
  _RegistoVacinas1State createState() => _RegistoVacinas1State();
}

class _RegistoVacinas1State extends State<RegistoVacinas1> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _doctorNameController = TextEditingController();
  late final AnimalInfo _animalInfo;

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  bool _isAnyFieldEmpty() {
    return [
      _nameController,
      _descricaoController,
      _dataController,
      _doctorNameController,
    ].any((controller) => controller.text.isEmpty);
  }
  Future<void> fetchUserData(BuildContext context) async {
    final accessTokenProvider = Provider.of<AccessTokenProvider>(context, listen: false);
    String? accessToken = accessTokenProvider.accessToken;
    String? loggedInUsername = UserSession.getLoggedInUsername();

    if (accessToken != null && loggedInUsername != null) {
      try {
        Map<String, dynamic> userData = await getUserInfo(loggedInUsername, accessToken);

        final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
        userDataProvider.updateUserData(userData);

      } catch (error) {
        print('Error fetching user data: $error');
      }
    } else {
      print('Failed to get access token or logged-in username.');
    }
  }
  Future<void> requestPostClinico(AnimalInfo animal, String token) async {
    const url = 'http://domusbuddies.eu:8082/api/v1/clinicalInfo/create';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'animalAppId': animal.uniqueId,
        'type': '',
        'name': _nameController.value.text,
        'description': _descricaoController.value.text,
        'date': _dataController.value.text,
        'doctorName': _doctorNameController.value.text,
      }),
    );

    if (response.statusCode == 200) {
      print('User updated successfully.');
    } else {
      print('Error updating user: ${response.statusCode} ${response.reasonPhrase}');
      //print('Error updating user: ${response.reasonPhrase} ${response.contentLength}');
      print('Error updating user: ${String.fromCharCodes(response.bodyBytes)} ${response.reasonPhrase}');
      //print('Error updating user: ${response.statusCode} ${response.reasonPhrase}');

    }
  }
  @override
  void initState() {
    var nome = this._nameController.value.text;
    var descricao = this._descricaoController.value.text;
    var data = this._dataController.value.text;
    var veterinario = this._doctorNameController.value.text;
//requestPostClinico(globalAnimalInfo?.uniqueId as AnimalInfo, token)

    PostRegistoClinico(nome: nome, descricao: descricao, data: data, veterinario: veterinario );
  }
  Widget build(BuildContext context) {
      // Retrieve the logged-in username and access token
    final accessTokenProvider = Provider.of<AccessTokenProvider>(context, listen: false);
    String? accessToken = accessTokenProvider.accessToken;
    String? loggedInUsername = UserSession.getLoggedInUsername();

    return Scaffold(
      appBar: CustomAppBar(), // Replace with your custom app bar widget
      body: GradientBackground( // Replace with your custom background widget
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Registo Clinico',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Handwritten',
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey, // Assign the GlobalKey<FormState>
                    child: Column(
                      children: [
                        _buildTextField(
                            _nameController, 'Nome', _validateField),
                        _buildTextField(
                            _descricaoController, 'Descrição', _validateField),
                        _buildDateField(),
                        const SizedBox(height: 16.0),// Add the date picker field
                        _buildTextField(
                            _doctorNameController, 'Veterinário', _validateField),
                        const SizedBox(height: 16.0),
                        _buildRegisterButton(accessToken?? ""),
                      ],
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add a GlobalKey<FormState>
  DateTime? _selectedDate; // Added to store the selected date

  Widget _buildTextField(
      TextEditingController controller, String labelText, String? Function(String?)? validator) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildRegisterButton(String authToken) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () async {
          if (_formKey.currentState!.validate()) { // Use _formKey.currentState to validate the form
            // Your form validation logic her

            String nome = _nameController.text;
            String descricao = _descricaoController.text;
            String data = _dataController.text; // Get the selected date
            String veterinario = _doctorNameController.text;

            if (_isAnyFieldEmpty()) {
              _showErrorDialog(context, 'Por favor, preencha todos os campos.');
              return;
            }
            print("T:" + _animalInfo.uniqueId);
            requestPostClinico(_animalInfo, authToken);
            // Perform registration logic here
            // Example: print the user's information
            print('Nome: $nome');
            print('Descrição: $descricao');
            print('Data: $data'); // Print the selected date
            print('Veterinário: $veterinario');
          }
        },
        icon: const Icon(Icons.vaccines_outlined, color: Colors.white),
        label: const Text(
          'Adicionar ',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
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

  // Date picker dialog function
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.pink,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dataController.text = picked.toString().split(' ')[0]; // Update the text field with the selected date
      });
    }
  }

  // Function to build the date picker input field
  Widget _buildDateField() {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: IgnorePointer(
        child: TextFormField(
          controller: _dataController, // Use the _dataController to display the selected date
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Data',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink),
            ),
            suffixIcon: Icon(
              Icons.calendar_today,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
