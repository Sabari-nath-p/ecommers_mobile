import 'package:ecommerce_mobile/Screen/Authentication/Service/controller.dart';
import 'package:ecommerce_mobile/Screen/Authentication/Widgets/SignUp.dart';
import 'package:ecommerce_mobile/Screen/Authentication/Widgets/Signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});
  AuthenticationController authCtrl = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: GetBuilder<AuthenticationController>(builder: (context) {
        return (authCtrl.currentSession == 1)
            ? SignUpScreen()
            : Signin_Screen();
      }),
    ));
  }
}
