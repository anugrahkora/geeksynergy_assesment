import 'package:flutter/material.dart';
import 'package:geeksynergy_assesment/controllers/login_view_controller.dart';

import 'package:geeksynergy_assesment/controllers/signup_view_controller.dart';
import 'package:geeksynergy_assesment/views/home_view_screen.dart';
import 'package:geeksynergy_assesment/views/signup_view_screen.dart';
import 'package:geeksynergy_assesment/views/user_auth_check.dart';
import 'package:get/get.dart';

class SplashViewScreen extends StatelessWidget {
  const SplashViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginViewController>();
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: controller.checkLoginStatus(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return const UserAuthCheck();
            } 
              return const Center(
                child: CircularProgressIndicator(),
              );
            
          },
        ),
      ),
    );
  }
}
