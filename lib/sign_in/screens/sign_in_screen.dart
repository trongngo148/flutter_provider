import 'package:flutter/material.dart';
import 'package:flutter_provider/config/routes/routes.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Sign In Screen"),
        ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.signUp, arguments: 'Day la toi');
            },
            child: const Text('Go to Sign Up')),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Back'))
      ],
    )));
  }
}
