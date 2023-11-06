import 'dart:io';

import 'package:ecommerce_mobile/Screen/Authentication/AuthenticationMain.dart';
import 'package:ecommerce_mobile/Screen/Authentication/Widgets/SignUp.dart';
import 'package:ecommerce_mobile/Screen/Authentication/Widgets/Signin.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/HomeScreenMain.dart';
import 'package:ecommerce_mobile/temp/Orderpage.dart';

import 'package:ecommerce_mobile/temp/Verification.dart';
import 'package:ecommerce_mobile/temp/cart.dart';
import 'package:ecommerce_mobile/temp/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

String token = "";
String login = "";
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  HttpOverrides.global = MyHttpOverrides();
  token = pref.getString("TOKEN").toString();
  login = pref.getString("LOGIN").toString();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          home: (login == "IN") ? HomeScreenMain() : AuthenticationScreen(),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
