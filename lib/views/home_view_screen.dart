import 'package:flutter/material.dart';
import 'package:geeksynergy_assesment/controllers/login_view_controller.dart';
import 'package:geeksynergy_assesment/utils/shared_prefs.dart';
import 'package:get/get.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginViewController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          TextButton(
              onPressed: () {
                showCompanyDialog(context);
              },
              child: const Text(
                'Company Info',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () async {
                          await loginController.signOut();
                        },
                        child: const Text('Logout')),
                  ),
                ],
              )
            ]),
      ),
    );
  }

  showCompanyDialog(BuildContext context) {
    // set up the buttons

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Company : Geeksynergy Technologies Pvt Ltd",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black)),
          Text("Address: Sanjayanagar, Bengaluru-56",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black)),
          Text("Phone: XXXXXXXXX09",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black)),
          Text("Email: XXXXXX@gmail.com",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black)),
        ],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
