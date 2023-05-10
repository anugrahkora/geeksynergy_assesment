import 'package:flutter/material.dart';
import 'package:geeksynergy_assesment/main.dart';
import 'package:get/get.dart';

import '../utils/shared_prefs.dart';

class LoginViewController extends GetxController {



  
  final RxBool _isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool get loading => _isLoading.value;
  bool get loggedIn => isLoggedIn.value;
  Future userLogin() async {
   
    _isLoading.value = true;

    final users = userBox.getAllUser();

    if (users != null) {
      if (users.firstWhereOrNull((user) =>
              user.email == emailController.text &&
              user.password == passwordController.text) !=
          null) {
        await SharedPrefs.setIsLoggedIn(true);
        await checkLoginStatus();
        Get.back();
      } else {
        Get.snackbar(
            'Invalid Credentials', 'Entered Credentials Does\'nt Match');
      }
    }
    _isLoading.value = false;
  }

  Future<bool> checkLoginStatus() async {
    isLoggedIn.value = await SharedPrefs.isUserLoggedIn();

    return isLoggedIn.value;
  }

  Future<void> signOut() async {
    await SharedPrefs.clearPreferences();
    await checkLoginStatus();
    // Get.back(closeOverlays: true);
  }
}
