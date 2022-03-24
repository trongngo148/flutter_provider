import 'package:flutter_provider/home/screens/home_screen.dart';
import 'package:flutter_provider/root_app/screens/root_app.dart';
import 'package:flutter_provider/sign_in/screens/sign_in_screen.dart';
import 'package:flutter_provider/sign_up/screens/sign_up_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String root = '/root';

  static final List<GetPage> getPages = [
    GetPage(name: home, page: () => Home()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: root, page: () => RootApp()),
  ];
}
