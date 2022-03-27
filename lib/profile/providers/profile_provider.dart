import 'package:flutter/foundation.dart';

class ProfileProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void switchTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
