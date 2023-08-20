import 'package:flutter/material.dart';
import 'AppBarGeneric.dart';
import 'BackgroundGeneric.dart';

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

              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/images/logo2.png', // Replace with your own image path
                  width: 130.0,
                ),
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
              TextField(
                controller: _especieController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Espécie',
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
                controller: _breedController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Raça',
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
                  String especie = _especieController.text;
                  String breed = _breedController.text;
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
