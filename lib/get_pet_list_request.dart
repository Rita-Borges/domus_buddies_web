import 'package:domus_buddies/domain/AnimalInfo.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PetDataProvider extends ChangeNotifier {
  List<String> petNames = [];

  Future<void> fetchPetNames(String authToken, String username) async {
    final Uri uri = Uri.parse('http://domusbuddies.eu:8082/api/v1/animals/listByUser/$username');
    final Map<String, String> headers = {
      'Authorization': 'Bearer $authToken',
    };

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        print(response.body);
        final List<AnimalInfo> petNamesData = parsePets(response.body);
        for(var i = 0; i< petNamesData.length; i++) {
          petNames.add(petNamesData[i].name );
        }

        notifyListeners();
      } else {
        print('Error fetching pet names: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching pet names: $error');
    }
  }

  List<AnimalInfo> parsePets(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<AnimalInfo>((json) => AnimalInfo.fromJson(json)).toList();
  }
}
