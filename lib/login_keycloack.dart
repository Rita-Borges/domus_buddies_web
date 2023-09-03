import 'package:domus_buddies/user_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'get_keycloack_token.dart'; // Add this import

class KeycloakService {
  final String baseUrl = 'https://lemur-6.cloud-iam.com';
  final String realm = 'domusbuddies';
  final String clientId = 'domusbuddies-app';
  final String clientSecret = 'a8XIyFyT9EpUBqegN2EncuZkgJXTEJfP';

  Future<void> authenticate(BuildContext context, String username, String password) async {
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
      final responseBody = json.decode(response.body);
      final accessToken = responseBody['access_token'];

      // Update the access token using the provider
      Provider.of<FetchUserData>(context, listen: false).setAccessToken(accessToken);

      // Save the logged-in username to UserSession
      UserSession.setLoggedInUsername(username);
    } else {
      throw Exception('Authentication failed');
    }
  }

  Future<void> updateKeycloakToken(BuildContext context, String refreshToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/realms/$realm/protocol/openid-connect/token'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'refresh_token',
        'client_id': clientId,
        'client_secret': clientSecret,
        'refresh_token': refreshToken,
      },
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final newAccessToken = responseBody['access_token'];

      // Update the access token using the provider
      Provider.of<FetchUserData>(context, listen: false).setAccessToken(newAccessToken);
    } else {
      throw Exception('Token refresh failed');
    }
  }
}