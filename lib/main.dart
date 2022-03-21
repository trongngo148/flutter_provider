import 'package:flutter/material.dart';
import 'package:flutter_provider/config/routes/routes.dart';
import 'package:get/get.dart';

import 'home/screens/home_screen.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: Routes.home,
    getPages: Routes.getPages,
  ));
}
