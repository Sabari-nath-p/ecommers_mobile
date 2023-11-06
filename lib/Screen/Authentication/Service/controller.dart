import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  TextEditingController emailText = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController passowrdText = TextEditingController();
  bool acceptPrivacy = false;
  bool passVisible = false;
  int currentSession = 1;
}
