import 'dart:convert';
import 'dart:math';

import 'package:ecommerce_mobile/Constants/Headers.dart';
import 'package:ecommerce_mobile/Constants/Strings.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/HomeScreenMain.dart';
import 'package:ecommerce_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  TextEditingController emailText = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController passowrdText = TextEditingController();
  bool acceptPrivacy = false;
  bool passVisible = false;
  int currentSession = 1;
  bool isLoading = false;

  Register() async {
    if (nameText.text.isEmpty ||
        passowrdText.text.isEmpty ||
        emailText.text.isEmpty ||
        phoneText.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill and submit");
      return;
    }
    if (!acceptPrivacy) {
      Fluttertoast.showToast(msg: "Accept our privacy polices ");
      return;
    }
    isLoading = true;
    update();
    final request = await post(Uri.parse(baseurl + "user-reg/"),
        headers: UnAuthHeader,
        body: {
          "user_type": "1",
          "name": nameText.text,
          "username": emailText.text,
          "phone_number": phoneText.text,
          "password": passowrdText.text,
          "confirm_password": passowrdText.text,
          'device_id': Random().toString()
        });
    if (request.statusCode == 200 && request.statusCode == 201) {
      var js = json.decode(request.body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("LOGIN", "IN");
      pref.setString("TOKEN", js["token"]);
      token = js["token"];

      Get.to(HomeScreenMain());
    } else {
      var js = json.decode(request.body);
      if (js["password"] != null)
        Fluttertoast.showToast(msg: js["password"][0]);
      if (js["username"] != null)
        Fluttertoast.showToast(msg: js["username"][0]);
      isLoading = false;
      update();
    }
    print(request.body);
    print(request.statusCode);
  }

  Login() async {
    if (passowrdText.text.isEmpty || emailText.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill and submit");
      return;
    }
    if (!acceptPrivacy) {
      Fluttertoast.showToast(msg: "Accept our privacy polices ");
      return;
    }
    isLoading = true;
    update();
    final request = await post(Uri.parse(baseurl + "user-login/"),
        headers: UnAuthHeader,
        body: {
          "email": emailText.text,
          "password": passowrdText.text,
          "confirm_password": passowrdText.text,
          'device_id': "124"
        });
    print(request.body);
    print(request.statusCode);
    if (request.statusCode == 200 || request.statusCode == 201) {
      var js = json.decode(request.body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("LOGIN", "IN");
      pref.setString("TOKEN", js["token"]);
      token = js["token"];
      isLoading = false;
      update();
      Get.to(HomeScreenMain());
    } else {
      var js = json.decode(request.body);
      if (js["error"] != null) Fluttertoast.showToast(msg: js["error"]);

      isLoading = false;
      update();
    }
  }
}
