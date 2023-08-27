import 'package:flutter/material.dart';
import 'AppBarGeneric.dart';
import 'BackgroundGeneric.dart';

class VetRegisterPage extends StatelessWidget {
  VetRegisterPage({Key? key});

  final ButtonStyle pinkTitleButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.pink,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide.none,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20),  // Padding to push text to the left
    alignment: Alignment.centerLeft,  // Align text to the left
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        body: GradientBackground(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Registo veterinário',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink, // <- Change to white here
                    fontFamily: 'Handwritten',
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      ElevatedButton(
                        style: pinkTitleButton,
                        onPressed: null,
                        child: const Text('ship nº: ABC ', style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        style: pinkTitleButton,
                        onPressed: null,
                        child: const Text('Nome: X', style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        style: pinkTitleButton,
                        onPressed: null,
                        child: const Text('Idade: 14 meses',style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        style: pinkTitleButton,
                        onPressed: null,
                        child: const Text('Especie: cão',style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        style: pinkTitleButton,
                        onPressed: null,
                        child: const Text('Raça: Dalmation',style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: pinkTitleButton,
                        onPressed: () {
                          print('Vacinas button clicked!');
                        },
                        child: const Text('Vacinas'),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'NULL',
                          labelStyle: TextStyle(color: Colors.white), // <- Change to white here
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: pinkTitleButton,
                        onPressed: () {
                          print('Cirurgias ou Doenças button clicked!');
                        },
                        child: const Text('Cirurgias ou Doenças'),
                      ),
                      const SizedBox(height: 8),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'NULL',
                          labelStyle: TextStyle(color: Colors.white), // <- Change to white here
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: pinkTitleButton,
                        onPressed: () {
                          print('Proximo Agendamento button clicked!');
                        },
                        child: const Text('Proximo Agendamento'),
                      ),
                      const SizedBox(height: 8),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'NULL',
                          labelStyle: TextStyle(color: Colors.white), // <- Change to white here
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
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
