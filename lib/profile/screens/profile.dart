import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../wrap_auth/providers/google-sign-in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      final signInGoogleProvider = Provider.of<GoogleSignInProvider>(context, listen: false);
                      signInGoogleProvider.logout();
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.black.withOpacity(0.03), borderRadius: BorderRadius.circular(12)),
                      child: Center(child: Icon(LineIcons.powerOff)),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Name: ' + user.displayName!,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Email: ' + user.email!,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
