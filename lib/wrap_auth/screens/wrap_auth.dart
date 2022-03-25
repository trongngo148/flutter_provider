import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/root_app/screens/root_app.dart';
import 'package:flutter_provider/sign_in/screens/sign_in_screen.dart';

class WrapAuthScreen extends StatefulWidget {
  WrapAuthScreen({Key? key}) : super(key: key);

  @override
  State<WrapAuthScreen> createState() => _WrapAuthScreenState();
}

class _WrapAuthScreenState extends State<WrapAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return RootApp();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Something went wrong!"),
                );
              } else {
                return SignInScreen();
              }
            }));
  }
}
