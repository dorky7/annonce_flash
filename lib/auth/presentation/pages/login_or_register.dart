import 'package:annonceflash_project/auth/presentation/pages/login_screen.dart';
import 'package:annonceflash_project/auth/presentation/pages/register/register_screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  @override
  _LoginOrRegisterScreenState createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  bool showLogin = true;

  void toggleView() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginScreen(onTap: toggleView);
    } else {
      return RegisterScreen(onTap: toggleView);
    }
  }
}
