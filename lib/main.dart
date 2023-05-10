import 'package:flutter/material.dart';
import 'package:geeksynergy_assesment/bindings/controller_bindings.dart';
import 'package:geeksynergy_assesment/repository/user_box.dart';
import 'package:geeksynergy_assesment/views/signup_view_screen.dart';
import 'package:geeksynergy_assesment/views/splash_view_screen.dart';
import 'package:get/get.dart';



late UserBox userBox;
Future<void> main()async {
   WidgetsFlutterBinding.ensureInitialized();
  userBox = await UserBox.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: ControllerBindings(),
          home: const SplashViewScreen()),
    );
  }
}
