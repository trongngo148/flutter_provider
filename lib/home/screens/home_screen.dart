import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/config/routes/routes.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../constants/styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser!;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        user.displayName!,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.03), borderRadius: BorderRadius.circular(12)),
                    child: Center(child: Icon(LineIcons.bell)),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 145,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [Styles.colors.secondaryLight, Styles.colors.primaryLight])),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          width: (size.width),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "BMI (Body Mass Index)",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Text(
                                "You have a normal weight",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Styles.colors.fourthColor, Styles.colors.thirdColor]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "View More",
                                    style: TextStyle(fontSize: 13, color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
