import 'package:flutter/material.dart';
import 'package:flutter_provider/config/routes/routes.dart';
import 'package:flutter_provider/constants/styles.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

// class _SignInScreenState extends State<SignInScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text("Sign In Screen"),
//         ElevatedButton(
//             onPressed: () {
//               Get.toNamed(Routes.signUp, arguments: 'Day la toi');
//             },
//             child: const Text('Go to Sign Up')),
//         ElevatedButton(
//             onPressed: () {
//               Get.back();
//             },
//             child: const Text('Back'))
//       ],
//     )));
//   }
// }

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: getBody());
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                height: (size.height - 60) * 0.5,
                child: Column(children: [
                  const Text(
                    "Hey there",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Styles.colors.bgTextField, borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Icon(LineIcons.envelope, color: Colors.black.withOpacity(0.5)),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                              child: TextField(
                            cursorColor: Colors.black.withOpacity(0.5),
                            decoration: InputDecoration(hintText: "Email", border: InputBorder.none),
                          ))
                        ],
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
