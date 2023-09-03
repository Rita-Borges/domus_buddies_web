import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserSession {
  static String? loggedInUsername;

  static void setLoggedInUsername(String username) {
    loggedInUsername = username;
  }

  static String? getLoggedInUsername() {
    return loggedInUsername;
  }
}

