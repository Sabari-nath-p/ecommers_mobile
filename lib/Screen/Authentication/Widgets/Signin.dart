import 'package:ecommerce_mobile/Screen/Authentication/Widgets/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../Service/controller.dart';

class Signin_Screen extends StatefulWidget {
  const Signin_Screen({super.key});

  @override
  State<Signin_Screen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<Signin_Screen> {
  AuthenticationController authCtrl = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 10.h,
              width: 50.h,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1f2029)),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Hi! Welcome back,you've been missed",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff797979),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 3.h),
          Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1f2029)),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 0.5.w),
                  height: 5.h,
                  width: 88.w,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: ("example@gmail.com"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xff797979)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1f2029)),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 0.5.w),
                  height: 5.h,
                  width: 88.w,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: ("*********"),
                      suffixIcon: Icon(Icons.remove_red_eye_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff797979))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 3.7.w),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1f2029)),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            width: 88.w,
            height: 5.8.h,
            margin: EdgeInsets.only(left: 0.5.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                color: Color(0xff704f38)),
            alignment: Alignment.center,
            child: Text(
              "Sign In",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffEDEDED)),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 15, color: Color(0xff1f2029)),
              ),
              InkWell(
                  onTap: () {
                    authCtrl.currentSession = 1;
                    authCtrl.update();
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 15, color: Color(0xff704f38)),
                  ))
            ],
          ),
          SizedBox(
            height: 12.h,
          )
        ],
      ),
    );
  }
}
