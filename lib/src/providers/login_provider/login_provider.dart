import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPassWordVisible = true;

  passwordVisibilityChange() {
    isPassWordVisible = !isPassWordVisible;
    notifyListeners();
  }
}
