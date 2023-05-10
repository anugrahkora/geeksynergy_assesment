import 'package:geeksynergy_assesment/controllers/signup_view_controller.dart';
import 'package:geeksynergy_assesment/views/signup_view_screen.dart';
import 'package:get/get.dart';

import '../controllers/login_view_controller.dart';

class ControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpViewController(), fenix: true);
    Get.lazyPut(() => LoginViewController(), fenix: true);

  }}