import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getUserInfo(String username, String token) async {
  final url = 'http://domusbuddies.eu:8080/api/v1/user/info/$username';

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> userData = jsonDecode(response.body);
    return userData;
  } else {
    throw Exception('Failed to fetch user data');
  }
}
