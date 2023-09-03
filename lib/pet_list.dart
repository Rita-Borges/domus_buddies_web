import 'package:flutter/material.dart';
import 'AddPetToUser.dart';
import 'AppBarGeneric.dart';
import 'BackgroundGeneric.dart';
import 'registo_veterinario.dart';
import 'lostPet.dart';

class MyPetsListPage extends StatelessWidget {
  const MyPetsListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Stack(
          children: [
            GradientBackground(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      ' Os meus Pets ',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontFamily: 'Handwritten',
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          const SizedBox(height: 16),
                          buildImageSection(
                              context, 'assets/images/luna1.jpg', 100, 50),
                          const SizedBox(height: 16),
                          buildImageSection(
                              context, 'assets/images/luna1.jpg', 100, 50),
                          const SizedBox(height: 16),
                          buildImageSection(
                              context, 'assets/images/luna1.jpg', 100, 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 24, // adjust as needed
              right: 24, // added this to position it to the right
              child: FloatingActionButton(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPetToUser()),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageSection(
      BuildContext context, String imagePath, int likes, int commentsCount) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.white.withOpacity(0.5),
          width: 1.5,
        ),
      ),
      elevation: 4,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 10, // positioning Luna text at the top of the image
            left: 10, // left position
            child: Text(
              'Luna',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 10, // Keep the icons at the bottom.
            right: 10, // Move the icons to the right.
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              //builder: (context) => LostPetPage()),
                              builder: (context) => VetRegisterPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      // Adjust padding as needed
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink, width: 2.0),
                        // Pink border
                        shape: BoxShape.circle, // Make it circular
                      ),
                      child: const Icon(
                        Icons.vaccines_outlined,
                        color: Colors.pink,
                      ),
                    )),
                const SizedBox(width: 8),
                const Text(
                  'Registo veterinário',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LostPetPage()),
                      //builder: (context) => VetRegisterPage())
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4.0), // Adjust padding as needed
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink, width: 2.0),
                      // Pink border
                      shape: BoxShape.circle, // Make it circular
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.pink,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Pet Perdido',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
