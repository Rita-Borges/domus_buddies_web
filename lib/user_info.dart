
class UserSession {
  static String? loggedInUsername;

  static void setLoggedInUsername(String username) {
    loggedInUsername = username;
  }

  static String? getLoggedInUsername() {
    return loggedInUsername;
  }
}

