import 'package:e_waste_catalog/pages/home_page.dart';
import 'package:e_waste_catalog/pages/login_or_signup.dart';
import 'package:e_waste_catalog/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.hasData) {
// User is logged in navigate to the home page
                return HomePage();
              } else {
                return LoginAndSignUp();
              }
            }
          }),
    );
  }
}
