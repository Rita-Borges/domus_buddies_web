import 'package:flutter/material.dart';

class NovidadesPage extends StatelessWidget {
  const NovidadesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade200,
          elevation: 0, // Remove app bar shadow
          centerTitle: true, // Center the title (Novidades) in the app bar
          actions: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.pink),
              onPressed: () {
                // Handle search button press
              },
            ),
            IconButton(
              icon: Icon(Icons.pin_drop, color: Colors.pink),
              onPressed: () {
                // Handle notifications button press
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.pink),
              onPressed: () {
                // Handle search button press
              },
            ),
          ],
          title: Text(
            'Novidades',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
              fontFamily: 'Handwritten',
            ),
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
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              // Center(
              //   child: Text(
              //     'Novidades',
              //     style: TextStyle(
              //       fontSize: 34,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.pink,
              //       fontFamily: 'Handwritten',
              //     ),
              //   ),
              // ),
              SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/ImageHome.jpeg', // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 4),
                          Text(
                            '120',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 12),
                          Icon(Icons.comment, color: Colors.white),
                          SizedBox(width: 4),
                          Text(
                            '45',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
