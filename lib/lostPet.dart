import 'package:domus_buddies/uploadPage.dart';
import 'package:flutter/material.dart';
import 'AppBarGeneric.dart';
import 'BackgroundGeneric.dart';

class LostPetPage extends StatelessWidget {
  LostPetPage({Key? key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Stack(
          children: [
            GradientBackground(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ' Lost Pet',
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
                          SizedBox(height: 16),
                          buildImageSection(
                              context, 'assets/images/luna1.jpg', 95, 30),
                          SizedBox(height: 16),
                          buildImageSection(
                              context, 'assets/images/luna1.jpg', 110, 25),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16, // adjust as needed
              left: 0,
              right: 0,
              child: Center(
                child: FloatingActionButton(
                  child: Icon(Icons.add_a_photo_outlined, color: Colors.white),
                  backgroundColor: Colors.pink,

                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),  // Assuming default size of FloatingActionButton, you can adjust as needed
                      side: BorderSide(color: Colors.white, width: 2.0)
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UploadPage()),
                    );
                  },
                ),
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
          color: Colors.white.withOpacity(0.5),  // change this color to whatever you like
          width: 1.5,
        ),
      ),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),

          ],
        ),
      ),
    );
  }
}