import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/profile/providers/profile_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../wrap_auth/providers/google-sign-in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var value = true;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: Scaffold(
        body: Consumer<ProfileProvider>(
          builder: (context, provider, child) {
            return Column(
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
                          decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(12)),
                          child: Center(child: Icon(LineIcons.powerOff)),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(user.photoURL!),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Text(
                              "Setting",
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 35, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Icon(
                              LineIcons.bell,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Notifications",
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sales",
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            CupertinoSwitch(
                              trackColor: Theme.of(context).toggleButtonsTheme.disabledColor,
                              activeColor: Theme.of(context).toggleButtonsTheme.selectedColor,
                              value: value,
                              onChanged: (value) => setState(() {
                                this.value = value;
                              }),
                            )
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dark Mode",
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            CupertinoSwitch(
                              trackColor: Theme.of(context).toggleButtonsTheme.disabledColor,
                              activeColor: Theme.of(context).toggleButtonsTheme.selectedColor,
                              value: provider.isDarkMode,
                              onChanged: (value) => provider.switchTheme(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
