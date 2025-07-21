import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              //logo
              // SizedBox(height: 96, width: 96,child: ,),
            ],
          ),
        );
      },
    );
  }
}
