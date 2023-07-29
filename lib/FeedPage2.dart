import 'package:flutter/material.dart';

import 'FeedPage2.dart';

class NovidadesPage extends StatelessWidget {
  NovidadesPage({Key? key});

  // List of comments to display
  List<String> comments = [
    'Great post!',
    'Amazing work!',
    'Keep it up!',
    'Beautiful picture!',
  ];

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
                // Handle user profile button press
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
                          Icon(Icons.favorite, color: Colors.pink),
                          SizedBox(width: 4),
                          Text(
                            '120',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 12),
                          IconButton(
                            icon: Icon(Icons.comment, color: Colors.pink),
                            onPressed: () {
                              _showListBottomSheet(context); // Show the list of comments when the comment icon is pressed
                            },
                          ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showListBottomSheet(context); // Show the list when plus button is pressed
          },
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }


  void _showListBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.pink, // Pink background for the bottom sheet
          child: ListView.builder(
            itemCount: comments.length, // Use the comments list length
            itemBuilder: (BuildContext context, int index) {
              String comment = comments[index];
              return ListTile(
                tileColor: Colors.white, // White background for each list item
                title: Text(
                  comment,
                  style: TextStyle(color: Colors.black), // Black text color for each comment
                ),
                onTap: () {
                  // Handle comment tap if needed
                },
              );
            },
          ),
        );
      },
    );
  }
}

