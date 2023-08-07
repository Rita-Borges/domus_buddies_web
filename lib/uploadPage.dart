import 'package:domus_buddies/FeedPage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:universal_html/html.dart' as html;
import 'package:video_player/video_player.dart'; // Import the video_player package


class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  bool _isHovering = false;
  File? _imageFile; // File to store the selected image or video
  // Add this variable to control video playback
  VideoPlayerController? _videoController;

  TextEditingController _textEditingController = TextEditingController();

  Future<void> _pickImage() async {
    try {
      if (kIsWeb) {
        final html.InputElement input = html.InputElement()
          ..type = 'file'
          ..accept = 'image/*,video/*';
        input.click();

        input.onChange.listen((event) async {
          final file = input.files!.first;
          final reader = html.FileReader();
          reader.readAsArrayBuffer(file);

          await reader.onLoad.first;

          final dynamic result = reader.result;
          if (result != null) {
            if (file.type.startsWith('image/')) {
              setState(() {
                _imageFile = File.fromRawPath(Uint8List.fromList((result as List<int>)));
                _videoController?.dispose();
                _videoController = null;
              });
            } else if (file.type.startsWith('video/')) {
              setState(() {
                _imageFile = null;
                _videoController?.dispose();
                _videoController = VideoPlayerController.file(
                  File.fromRawPath(Uint8List.fromList((result as List<int>))),
                );
                _videoController!.initialize().then((_) {
                  setState(() {});
                  _videoController!.play();
                });
              });
            }
          }
        });
      }
    } catch (e) {
      print('Error picking image/video: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Post ',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Handwritten',
                  ),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: Icon(
                    Icons.photo,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Pick Image/Video',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                if (_imageFile != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.file(_imageFile!),
                        width: 300,
                        height: 300,
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Enter your text here...',
                          ),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to another page and pass the selected image, video, and entered text
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NovidadesPage(
                                // Pass the selected image and entered text to the next page
                                // imageFile: _imageFile!,
                                // enteredText: _textEditingController.text,
                              ),
                            ),
                          );
                        },
                        child: Text('Upload'),
                      ),
                    ],
                  ),
                if (_videoController != null && _videoController!.value.isInitialized)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: _videoController!.value.aspectRatio,
                        child: VideoPlayer(_videoController!),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Enter your text here...',
                          ),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to another page and pass the selected video and entered text
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NovidadesPage(
                                // Pass the selected video and entered text to the next page
                                // videoController: _videoController,
                                // enteredText: _textEditingController.text,
                              ),
                            ),
                          );
                        },
                        child: Text('Upload'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
