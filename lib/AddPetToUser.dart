import 'package:flutter/material.dart';
import 'AppBarGeneric.dart';
import 'BackgroundGeneric.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'update_perfil.dart';

class AddPetToUser extends StatefulWidget {
  @override
  _AddPetToUserState createState() => _AddPetToUserState();
}

class _AddPetToUserState extends State<AddPetToUser> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _shipController = TextEditingController();
  TextEditingController _especieController = TextEditingController();
  TextEditingController _breedController = TextEditingController();
  DateTime? _selectedDate;
  File? _selectedImage;
  String? _selectedEspecie;
  String? _selectedRaca;

  final List<String> _especies = ['Dog', 'Cat', 'Bird', 'Fish'];
  final List<String> _racas = ['Bulldog', 'Siamese', 'Parrot', 'Goldfish'];


  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: GradientBackground(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Adicione o seu Pet ',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Handwritten',
                ),
              ),

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
                          icon: Icon(Icons.edit, color: Colors.pink),
                          onPressed: _pickImage,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16.0), // Add extra space above the title
              TextField(
                controller: _nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pink,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.0),
              TextField(
                controller: _shipController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Número do ship',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pink,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.0),
              DropdownButtonFormField(
                value: _selectedEspecie,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Espécie',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                items: _especies.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.pink)), // Added style here
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedEspecie = value as String?;
                  });
                },
              ),


              SizedBox(height: 16.0),
              DropdownButtonFormField(
                value: _selectedRaca,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Raça',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                items: _racas.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.pink)), // Added style here
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRaca = value as String?;
                  });
                },
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: TextEditingController(
                      text: _selectedDate != null
                          ? _selectedDate.toString().split(' ')[0]
                          : '',
                    ),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Data de Nascimento',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pink,
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String name = _nameController.text;
                  String ship = _shipController.text;
                  String especie = _selectedEspecie ?? '';
                  String breed = _selectedRaca ?? '';
                  String birthday = _selectedDate != null
                      ? _selectedDate.toString().split(' ')[0]
                      : '';

                  print('Nome: $name');
                  print('Número do Ship: $ship');
                  print('Espécie: $especie');
                  print('Raça: $breed');
                  print('Data de Nascimento: $birthday');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.pets_rounded),
                    SizedBox(width: 8.0),
                    Text(
                      'Adicionar Pet',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
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
      });
    }
  }
}
