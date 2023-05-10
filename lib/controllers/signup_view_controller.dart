import 'package:flutter/material.dart';
import 'package:geeksynergy_assesment/main.dart';
import 'package:geeksynergy_assesment/models/user_model.dart';
import 'package:geeksynergy_assesment/utils/shared_prefs.dart';
import 'package:geeksynergy_assesment/views/login_view_screen.dart';
import 'package:get/get.dart';

class SignUpViewController extends GetxController {


  
  final RxBool _isLoading = false.obs;
 
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final RxString _selectedProffession = ''.obs;

  String get proffession => _selectedProffession.value;
  bool get loading => _isLoading.value;
 

  void updateProffession(String val) {
    _selectedProffession.value = val;
  }

  Future userSignUp() async {
    _isLoading.value = true;
    final newUser = UserModel(
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        proffession: proffession,
        password: passwordController.text,
        name: nameController.text);

   final success= await userBox.addUser(newUser);
    _isLoading.value = false;
    if(success){
      Get.to(()=>const LoginViewScreen());
    }
  }
}
