import 'package:domus_buddies/FeedPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'background/BackgroundGeneric.dart';
import 'RecoveryPage.dart';
import 'services/login_keycloack.dart';


class LoginPagev0 extends StatefulWidget {
  const LoginPagev0({Key? key}) : super(key: key);

  @override
  _LoginPagev0State createState() => _LoginPagev0State();
}

class _LoginPagev0State extends State<LoginPagev0> {
  bool _isHovering = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final token = await KeycloakService().authenticate(context, username, password);
    bool isAuthenticated = true; // Replace this with the actual authentication result.
    if (isAuthenticated) {
      // Navigate to the next page (e.g., DashboardPage).
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NovidadesPage(), // Replace DashboardPage with your desired page.
        ),
      );
    } else {
      // Show an error message or handle the failed login attempt.
      // You can use a Snackbar or a Dialog to display the error message.
    }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade200, // Set the background color to lightBlue.shade200
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.pink),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 80.0), // Add extra space above the title
              const Text(
                'Efetue Login ',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Handwritten',
                ),
              ),
              const SizedBox(height: 24.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/images/logo1.png', // Replace with your own image path
                  // height: 200.0,
                  width: 150.0,
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: _usernameController, // Bind the controller to the field
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  // Set the label color to white
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Colors.white), // Set the underline color to white
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .pink), // Set the focused underline color to white
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController, // Bind the controller to the field
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  // Set the label color to white
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Colors.white), // Set the underline color to white
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .pink), // Set the focused underline color to white
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 32.0),
              SizedBox(
                width: double.infinity,  // Set width to full screen
                height: 50.0,  // Set a fixed height for the button
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,  // Set the color of the button to pink
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),  // Square shape
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center align the Row's children
                    children: [
                      Icon(Icons.account_circle, color: Colors.white),  // Search Icon
                      SizedBox(width: 10),  // Spacing between the icon and text
                      Text(
                        'login',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),  // White text color
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16.0),
              Expanded( // Wrap the Text.rich with Expanded to take full width
                child: GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      _isHovering = true;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      _isHovering = false;
                    });
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordRecoveryPage2(),
                      ),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Para recuperar a sua password, ',
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'clique Aqui',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _isHovering ? Colors.pink : Colors.lightBlueAccent,
                            decoration: TextDecoration.underline,
                        ),
                      ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class PositiveLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Move to feedPage',
      theme: ThemeData(),
      home: NovidadesPage(),
    );
  }
}

class PasswordRecoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Recovery Page',
      theme: ThemeData(),
      home: PasswordRecoveryPage2(),
    );
  }
}
