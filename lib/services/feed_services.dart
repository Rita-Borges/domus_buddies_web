import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:domus_buddies/services/post_info.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';

import 'image_services.dart';

class FeedServices extends ChangeNotifier {
  List<PostInfo> feeds = List.empty();

  Future<void> fetchFeed(String authToken, int quantity, int skip) async {
    final Uri uri = Uri.parse('http://domusbuddies.eu:8083/api/v1/feed/list?quantity=$quantity&skip=$skip');
    final Map<String, String> headers = {
      'Authorization': 'Bearer $authToken',
    };
    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        feeds = parseFeed(response.body);
        for(PostInfo postInfo in feeds){
          postInfo.fileInBytes =  await ImageServices().fetchImage(authToken, postInfo.filename) ?? List.empty();
          print(postInfo.fileInBytes);
        }
        notifyListeners();
      } else {
        print('Error fetching feed: ${response.statusCode}');
        print('Error fetching feed: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error fetching feed: $error');
    }
  }

  List<PostInfo> parseFeed(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<PostInfo>((json) => PostInfo.fromJson(json)).toList();
  }



  Future<void> publishPost(String authToken, PostInfo postInfo, PlatformFile file) async {
    final Uri uri = Uri.parse('http://domusbuddies.eu:8083/api/v1/feed/publish');
    final Map<String, String> headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'multipart/form-data',
    };

    final formattedDate = DateFormat("yyyy-MM-ddTHH:mm:ss").format(postInfo.publishDate);
    print("Request URL: $uri");
    print("Request Headers: $headers");
    print("Request Message: ${postInfo.message}");
    print("Request Publish Date: ${postInfo.publishDate}");
    print("Request Username: ${postInfo.username}");

    final List<int>? bytesFile = file.bytes?.toList();

    try {
      final request = http.MultipartRequest('POST', uri);
      request.headers['Authorization'] = 'Bearer $authToken';
      request.files.add(await http.MultipartFile.fromBytes(
        'file',
        bytesFile!,
        contentType: MediaType('application', 'octet-stream'),
      ));
      request.fields['message'] = postInfo.message;
      request.fields['publishDate'] = formattedDate;
      request.fields['username'] = postInfo.username;

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        print('Success fetching feed: ${response.statusCode}');
      } else {
        print('Error fetching feed: ${response.statusCode}');
        print('Error fetching feed: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error fetching feed: $error');
    }
  }

}