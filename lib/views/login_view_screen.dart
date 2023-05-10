import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geeksynergy_assesment/controllers/login_view_controller.dart';
import 'package:geeksynergy_assesment/views/signup_view_screen.dart';
import 'package:get/get.dart';

class LoginViewScreen extends StatelessWidget {
  const LoginViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginViewController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please Re-enter Your Credentials to Log In',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                        labelText: "Email", hintText: "Enter your email"),
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: const InputDecoration(
                        labelText: "Password", hintText: "Enter your Password"),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller.userLogin();
                            },
                            child: controller.loading
                                ? const CircularProgressIndicator()
                                : const Text('Login')),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Or Signup'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
