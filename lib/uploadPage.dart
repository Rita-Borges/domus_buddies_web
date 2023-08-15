import 'package:flutter/material.dart';

import 'AppBarGeneric.dart';
import 'BackgroundGeneric.dart';

class UploadPage extends StatelessWidget {
  UploadPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        body: GradientBackground(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ' Publicar',
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
                          context, 'assets/images/ImageHome.jpeg', 120, 45),
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


