import 'package:domus_buddies/services/login_keycloack.dart';
import 'package:flutter/material.dart';
import '../background/background_generic.dart';
import 'progresso/recovery_page.dart';
import 'package:domus_buddies/pages/feed_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHovering = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _loginFailed = false; // Track login failure

  double _calculateFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.03; // Adjust this multiplier as needed
    return fontSize;
  }

  void _handleLogin() async {
    final String username = _usernameController.text.toLowerCase();
    final String password = _passwordController.text;
    final token = await KeycloakService().authenticate(context, username, password);
    bool isAuthenticated = true;
    if (isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PositiveLogin(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = _calculateFontSize(context);

    return Scaffold(
      appBar: CustomAppBar(loginFailed: _loginFailed),
      body: CustomBody(
        isHovering: _isHovering,
        usernameController: _usernameController,
        passwordController: _passwordController,
        handleLogin: _handleLogin,
        setHovering: (bool value) {
          setState(() {
            _isHovering = value;
          });
        },
        fontSize: fontSize,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool loginFailed;

  const CustomAppBar({Key? key, required this.loginFailed}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: loginFailed ? Colors.pink : Colors.lightBlue.shade200,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.pink),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: loginFailed
          ? const Text(
        'Login Failed',
        style: TextStyle(color: Colors.white),
      )
          : null,
    );
  }
}

class CustomBody extends StatefulWidget {
  final bool isHovering;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback handleLogin;
  final Function(bool) setHovering;
  final double fontSize;

  const CustomBody({
    Key? key,
    required this.isHovering,
    required this.usernameController,
    required this.passwordController,
    required this.handleLogin,
    required this.setHovering,
    required this.fontSize,
  }) : super(key: key);

  @override
  _CustomBodyState createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                double availableWidth = constraints.maxWidth;
                double fontSize = availableWidth * 0.05; // Adjust this multiplier as needed
                fontSize = fontSize.clamp(30.0, 80.0); // Limit the font size range

                return const FittedBox(
                  fit: BoxFit.scaleDown, // You can choose a different BoxFit option if needed
                  child: Text(
                    'Efetue Login',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Handwritten',
                    ),
                  ),
                );
              },
            ),

            SizedBox(
              width: 250,
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/images/cryptocurrency-art.png',
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 350,
                child: TextFormField(
                  controller: widget.usernameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Center(
              child: SizedBox(
                width: 350,
                child: TextFormField(
                  controller: widget.passwordController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedLoginButton(
              handleLogin: widget.handleLogin,
            ),
            const SizedBox(height: 12.0),
            Center( // Center the recovery message
              child: GestureDetector(
                onTapDown: (_) {
                  widget.setHovering(true);
                },
                onTapCancel: () {
                  widget.setHovering(false);
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PasswordRecoveryPage(),
                    ),
                  );
                },
                child: RecoveryText(
                  isHovering: widget.isHovering,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class ElevatedLoginButton extends StatelessWidget {
  final VoidCallback handleLogin;

  const ElevatedLoginButton({Key? key, required this.handleLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center( // Center the button
      child: SizedBox(
        width: 350, // Set the desired width
        height: 40.0,
        child: ElevatedButton(
          onPressed: handleLogin,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecoveryText extends StatelessWidget {
  final bool isHovering;

  const RecoveryText({Key? key, required this.isHovering}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Para recuperar a sua password, ',
        style: const TextStyle(color: Colors.white),
        children: [
          TextSpan(
            text: 'clique Aqui',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isHovering ? Colors.pink : Colors.lightBlueAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class PositiveLogin extends StatelessWidget {
  const PositiveLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NovidadesPage();
  }
}

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PasswordRecoveryPage2();
  }
}
