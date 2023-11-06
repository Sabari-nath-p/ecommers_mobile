import 'package:ecommerce_mobile/Screen/Authentication/Widgets/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/Colors.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 9.h,
          ),
          SizedBox(
              height: 150,
              width: 150,
              child: Image.asset(("assets/images/logo.png"))),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 8.h,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Sign In",
                    style: GoogleFonts.lato(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1f2029)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hi welcome back you have been missed",
                    style: GoogleFonts.lato(
                      fontSize: 13,
                      color: Color(0xff797979),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.5.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 0.5.w),
                  height: 5.5.h,
                  width: 88.w,
                  child: TextFormField(
                    controller: authCtrl.emailText,
                    keyboardType: TextInputType.emailAddress,
                    style: GoogleFonts.lato(
                        fontSize: 15, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      labelText: ("Email Id"),
                      labelStyle: GoogleFonts.lato(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      prefixIcon: Icon(Icons.email),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xff797979)),
                      ),
                      focusColor: PrimaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xff797979)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 0.5.w),
                  height: 5.5.h,
                  width: 88.w,
                  child: TextFormField(
                    controller: authCtrl.passowrdText,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: !authCtrl.passVisible,
                    style: GoogleFonts.lato(
                        fontSize: 15, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      labelText: ("Password"),
                      labelStyle: GoogleFonts.lato(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: authCtrl.passVisible
                          ? InkWell(
                              onTap: () {
                                authCtrl.passVisible = !authCtrl.passVisible;
                                authCtrl.update();
                              },
                              child: Icon(Icons.visibility))
                          : InkWell(
                              onTap: () {
                                authCtrl.passVisible = !authCtrl.passVisible;
                                authCtrl.update();
                              },
                              child: Icon(Icons.visibility_off)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xff797979)),
                      ),
                      focusColor: PrimaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xff797979)),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Checkbox(
                          value: authCtrl.acceptPrivacy,
                          onChanged: (value) {
                            authCtrl.acceptPrivacy = value!;

                            authCtrl.update();
                          }),
                      Text(
                        " Agree with Terms and Conditions",
                        style: GoogleFonts.lato(
                            fontSize: 13, color: Color(0xff1f2029)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () {
                    authCtrl.Login();
                  },
                  child: Container(
                    width: 88.w,
                    height: 5.h,
                    margin: EdgeInsets.only(left: 0.5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PrimaryColor),
                    alignment: Alignment.center,
                    child: (authCtrl.isLoading)
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.white, size: 23)
                        : Text(
                            "Sign In",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600,
                                color: Color(0xffEDEDED)),
                          ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "don't have an account? ",
                style: GoogleFonts.lato(fontSize: 15, color: Color(0xff1f2029)),
              ),
              InkWell(
                  onTap: () {
                    authCtrl.currentSession = 1;
                    authCtrl.update();
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.lato(
                        fontSize: 15,
                        color: PrimaryColor,
                        fontWeight: FontWeight.bold),
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
