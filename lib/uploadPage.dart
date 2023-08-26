// Flutter imports
import 'package:flutter/material.dart';
import 'dart:io';

// Package imports
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

// Local imports
import 'package:domus_buddies/AppBarGeneric.dart';
import 'BackgroundGeneric.dart';
class UploadPage extends StatefulWidget {
  UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  XFile? _selectedFile;  // Store the uploaded file
  TextEditingController _textController = TextEditingController();  // Controller for text input

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedFile = pickedFile;
      });
    }
  }

  void _publish() {
    // TODO: Implement the logic to publish the image and text
    print("Publishing: ${_textController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        body: GradientBackground(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  'Publicar',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                    fontFamily: 'Handwritten',
                  ),
                ),

                // Image Picker and Description
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: 16),
                      InkWell(
                        onTap: _pickImage,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: _selectedFile != null
                              ? Image.file(
                            File(_selectedFile!.path),
                            fit: BoxFit.cover,
                          )
                              : DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12.0),
                            padding: EdgeInsets.all(16.0),
                            strokeWidth: 2.5,
                            dashPattern: [6, 6],
                            color: Colors.white60,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 110.0),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add_a_photo,
                                size: 50.0,
                                color: Colors.white60,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),

                      // Text input for description with white border and text
                      // Text input for description with white underline
                      TextField(
                        controller: _textController,
                        style: TextStyle(color: Colors.white),
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: "Escreve a tua descrição aqui...",
                          labelStyle: TextStyle(color: Colors.pink),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink, width: 2.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2.0),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Publicar button with pink color and rounded corners
                      ElevatedButton(
                        onPressed: _publish,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink, // Background color
                          foregroundColor: Colors.white, // Foreground (text/icon) color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),  // Rounded corners
                          ),
                        ),
                        child: Text("Publicar"),
                      ),
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
