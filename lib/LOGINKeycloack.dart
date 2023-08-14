import 'package:http/http.dart' as http;
import 'dart:convert'; // Add this import

class KeycloakService {
  final String baseUrl = 'https://lemur-6.cloud-iam.com';
  final String realm = 'domusbuddies';
  final String clientId = 'domusbuddies-app';
  final String clientSecret = 'a8XIyFyT9EpUBqegN2EncuZkgJXTEJfP';

  Future<String> authenticate(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/realms/$realm/protocol/openid-connect/token'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'password',
        'client_id': clientId,
        'client_secret': clientSecret,
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body); // Corrected line
      return responseBody['access_token'];
    } else {
      throw Exception('Authentication failed');
    }
  }
}
