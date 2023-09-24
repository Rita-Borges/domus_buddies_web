import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:provider/provider.dart';
import 'package:domus_buddies/pages/as_minhas_publicacoes.dart';
import 'package:domus_buddies/services/post_info.dart';
import 'package:domus_buddies/services/feed_services.dart';
import 'package:domus_buddies/User/user_info.dart';
import 'package:domus_buddies/background/appbar_generic.dart';
import 'package:domus_buddies/background/background_generic.dart';
import '../User/get_keycloack_token.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  file_picker.PlatformFile? _selectedFile; // Store the uploaded file
  TextEditingController _textController = TextEditingController(); // Controller for text input

  Future<void> _pickFile() async {
    final result = await file_picker.FilePicker.platform.pickFiles(
      type: file_picker.FileType.image, // Use 'file_picker.FileType' to avoid conflicts
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFile = result.files.first;
      });
    }
  }

  Future<List<int>> getListBytesOfFile() async {
    if (_selectedFile == null || _selectedFile!.bytes == null) {
      return []; // Return an empty list or handle the case differently.
    }

    Uint8List? uint8list = _selectedFile!.bytes;

    if (uint8list != null) {
      return uint8list.toList();
    } else {
      return [];
    }
  }

  Future<void> _publish(String username, String token) async {
    var message = _textController.text;

    PostInfo postInfo = PostInfo(
      message: message,
      publishDate: DateTime.now(),
      username: username,
      userLiked: [],
      fileInBytes: await getListBytesOfFile(),
      comments: [],
    );

    // Assuming FeedServices has a method 'publishPost' that accepts a PlatformFile parameter.
    FeedServices().publishPost(token, postInfo, _selectedFile!);
  }

  @override
  Widget build(BuildContext context) {
    final accessTokenProvider = Provider.of<FetchUserData>(context, listen: false);
    final authToken = accessTokenProvider.accessToken;
    String? loggedInUsername = UserSession.getLoggedInUsername();
    double screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize = screenWidth < 600 ? 30.0 : 60.0; // Adjust the values as needed
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: GradientBackground(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400), // Set your maximum width here
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                 Text(
                  'Publicar',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                    fontFamily: 'Handwritten',
                  ),
                ),

                // File Picker and Description
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: _pickFile,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: _selectedFile != null
                              ? Image.memory(
                            Uint8List.fromList(_selectedFile!.bytes!),
                            fit: BoxFit.cover,
                          )
                              : DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(12.0),
                            padding: const EdgeInsets.all(16.0),
                            strokeWidth: 2.5,
                            dashPattern: const [6, 6],
                            color: Colors.white60,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 110.0),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.add_a_photo,
                                size: 50.0,
                                color: Colors.white60,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _textController,
                        style: const TextStyle(color: Colors.white),
                        maxLines: 4,
                        decoration: const InputDecoration(
                          labelText: "Escreve a tua descrição aqui...",
                          labelStyle: TextStyle(color: Colors.pink),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.pink, width: 2.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 2.0),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          _publish(loggedInUsername!, authToken!);

                          // Navigate to the HomePage after publishing
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AsMinhasPublicacoes(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink, // Background color
                          foregroundColor: Colors.white, // Foreground (text/icon) color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30), // Rounded corners
                          ),
                        ),
                        child: const Text("Publicar"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
