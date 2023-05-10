import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geeksynergy_assesment/controllers/signup_view_controller.dart';
import 'package:geeksynergy_assesment/utils/constants.dart';
import 'package:geeksynergy_assesment/views/login_view_screen.dart';
import 'package:get/get.dart';

class SignupViewScreen extends StatelessWidget {
  const SignupViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpViewController>();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter Your Credentials to Sign In',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(
                      labelText: "Name", hintText: "Enter Name"),
                ),
                TextFormField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                      labelText: "Email", hintText: "Enter Email"),
                ),
                TextFormField(
                  controller: controller.phoneNumberController,
                  decoration: const InputDecoration(
                      labelText: "Phone Number",
                      hintText: "Enter Phone Number"),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: Obx(
                          () => DropdownButton<String>(
                            focusColor: Colors.white,
                            value: controller.proffession.isNotEmpty
                                ? controller.proffession
                                : null,
                            //elevation: 5,
                            hint: const Text("Please choose a Proffession"),

                            //   clearIconProperty: IconProperty(color: Colors.orange),
                            iconEnabledColor: Colors.black,
                            items: professions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                ),
                              );
                            }).toList(),
                            // hint: Text(
                            //   controller.proffession,
                            //   style: const TextStyle(
                            //       color: Colors.black,
                            //       fontSize: 14,
                            //       fontWeight: FontWeight.w500),
                            // ),
                            onChanged: (String? value) {
                              controller.updateProffession(value!);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  obscureText: true,
                  controller: controller.passwordController,
                  decoration: const InputDecoration(
                      labelText: "Password", hintText: "Enter Password"),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () async {
                            await controller.userSignUp();
                          },
                          child: controller.loading
                              ? const CircularProgressIndicator()
                              : const Text('Sign up')),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => const LoginViewScreen());
                    },
                    child: const Text('Or Login'))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
