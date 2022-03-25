import 'package:flutter/material.dart';
import 'package:flutter_provider/config/routes/routes.dart';
import 'package:flutter_provider/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../wrap_auth/providers/google-sign-in.dart';

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
                  Text(
                    "Hey there",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Styles.colors.bgTextField, borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(LineIcons.lock, color: Colors.black.withOpacity(0.5)),
                          const SizedBox(
                            width: 15,
                          ),
                          Flexible(
                              child: TextField(
                            cursorColor: Colors.black.withOpacity(0.5),
                            decoration: InputDecoration(hintText: "Password", border: InputBorder.none),
                          )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                LineIcons.eyeAlt,
                                color: Colors.black.withOpacity(0.5),
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Forgot your password?",
                    style: TextStyle(fontSize: 13, decoration: TextDecoration.underline),
                  )
                ]),
              ),

              //Login button and social login
              Container(
                height: (size.height - 60) * 0.5,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.root);
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Styles.colors.secondary, Styles.colors.primary]),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Login",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Flexible(
                          child: Divider(
                            thickness: 0.8,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Or"),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Divider(
                            thickness: 0.8,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            final signInGoogleProvider = Provider.of<GoogleSignInProvider>(context, listen: false);
                            signInGoogleProvider.googleLoginIn();
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black.withOpacity(0.1))),
                            child: Center(
                                child: SvgPicture.asset(
                              "assets/images/svgs/icons8-logo-google.svg",
                              width: 60,
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black.withOpacity(0.1))),
                          child: Center(
                              child: SvgPicture.asset(
                            "assets/images/svgs/icons8-facebook.svg",
                            width: 60,
                          )),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
