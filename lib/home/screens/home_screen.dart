import 'package:flutter/material.dart';
import 'package:flutter_provider/config/routes/routes.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Home Screen'),
        ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.signIn);
            },
            child: const Text("click"))
      ],
    )));
  }
}
