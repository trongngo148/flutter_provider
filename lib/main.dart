import 'package:flutter/material.dart';
import 'package:flutter_provider/config/routes/routes.dart';
import 'package:flutter_provider/profile/providers/profile_provider.dart';
import 'package:flutter_provider/wrap_auth/providers/google-sign-in.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'home/screens/home_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProfileProvider(),
      )
    ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.auth,
      getPages: Routes.getPages,
    ),
  ));
}
