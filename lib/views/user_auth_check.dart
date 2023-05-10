import 'package:flutter/material.dart';
import 'package:geeksynergy_assesment/controllers/login_view_controller.dart';
import 'package:geeksynergy_assesment/views/signup_view_screen.dart';
import 'package:get/get.dart';

import 'home_view_screen.dart';

class UserAuthCheck extends StatelessWidget {
  const UserAuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginViewController>();

    return Obx(() => controller.isLoggedIn.value
        ? const HomeViewScreen()
        : const SignupViewScreen());
  }
}
