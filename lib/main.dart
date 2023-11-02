import 'package:ecommerce_mobile/Screen/Authentication/Widgets/SignUp.dart';
import 'package:ecommerce_mobile/Screen/Authentication/Widgets/Signin.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/HomeScreenMain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          home: HomeScreenMain(),
        );
      },
    );
  }
}
