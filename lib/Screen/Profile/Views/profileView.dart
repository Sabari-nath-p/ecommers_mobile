import 'dart:convert';

import 'package:ecommerce_mobile/Constants/Colors.dart';
import 'package:ecommerce_mobile/Screen/Authentication/AuthenticationMain.dart';
import 'package:ecommerce_mobile/Screen/Profile/Views/AddressListView.dart';
import 'package:ecommerce_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/Headers.dart';
import '../../../Constants/Strings.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100.w,
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundColor: PrimaryColor,
            radius: 15.w,
            child: Text(
              "S",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 40.sp,
                  color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Sabarinath P",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 13.sp, color: AppBlack),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.black12),
          )),
          child: Row(
            children: [
              Icon(
                Iconsax.receipt_item,
                color: PrimaryColor,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "My Order",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppBlack),
                ),
              ),
              RotatedBox(
                  quarterTurns: 2, child: Icon(Icons.arrow_back_ios_outlined)),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            bool isVCurrentPass = false;
            bool isVNewPass = false;
            bool isLoading = false;
            TextEditingController CurrentPassword = TextEditingController();
            TextEditingController NewPassword = TextEditingController();
            showBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => StatefulBuilder(
                    builder: (ctx, state) => Container(
                          height: 30.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(-1, -1),
                                    color: Colors.black45.withOpacity(.2),
                                    blurRadius: 9,
                                    spreadRadius: .2)
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Change Password",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: AppBlack),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 0.5.w),
                                height: 5.5.h,
                                width: 88.w,
                                child: TextFormField(
                                  controller: CurrentPassword,
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: isVCurrentPass,
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    labelText: ("Current Password"),
                                    labelStyle: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    prefixIcon: Icon(Icons.password),
                                    suffixIcon: isVCurrentPass
                                        ? InkWell(
                                            onTap: () {
                                              state(() {
                                                isVCurrentPass =
                                                    !isVCurrentPass;
                                              });
                                            },
                                            child: Icon(Icons.visibility))
                                        : InkWell(
                                            onTap: () {
                                              state(() {
                                                isVCurrentPass =
                                                    !isVCurrentPass;
                                              });
                                            },
                                            child: Icon(Icons.visibility_off)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: Color(0xff797979)),
                                    ),
                                    focusColor: PrimaryColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: Color(0xff797979)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 0.5.w),
                                height: 5.5.h,
                                width: 88.w,
                                child: TextFormField(
                                  controller: NewPassword,
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: isVNewPass,
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    labelText: ("New Password"),
                                    labelStyle: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    prefixIcon: Icon(Icons.password),
                                    suffixIcon: isVNewPass
                                        ? InkWell(
                                            onTap: () {
                                              state(() {
                                                isVNewPass = !isVNewPass;
                                              });
                                            },
                                            child: Icon(Icons.visibility))
                                        : InkWell(
                                            onTap: () {
                                              state(() {
                                                isVNewPass = !isVNewPass;
                                              });
                                            },
                                            child: Icon(Icons.visibility_off)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: Color(0xff797979)),
                                    ),
                                    focusColor: PrimaryColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: Color(0xff797979)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  if (CurrentPassword.text.isEmpty ||
                                      CurrentPassword.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please enter fill passwords");
                                    return;
                                  }
                                  state(() {
                                    isLoading = true;
                                  });
                                  print("new");

                                  final Response = await post(
                                      Uri.parse(baseurl + "change_password"),
                                      body: json.encode({
                                        "old_password":
                                            CurrentPassword.text.trim(),
                                        "new_password": NewPassword.text.trim(),
                                        "confirm_password":
                                            NewPassword.text.trim()
                                      }),
                                      headers: AuthHeader);
                                  print(Response.statusCode);
                                  if (Response.statusCode == 200 ||
                                      Response.statusCode == 201) {
                                    Navigator.of(context).pop();
                                  } else {
                                    print(token);

                                    Fluttertoast.showToast(
                                        msg: 'Something went to wrong');
                                    state(() {
                                      isLoading = false;
                                    });
                                  }
                                },
                                child: Container(
                                  width: 88.w,
                                  height: 5.h,
                                  margin: EdgeInsets.only(left: 0.5.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: PrimaryColor),
                                  alignment: Alignment.center,
                                  child: (isLoading)
                                      ? LoadingAnimationWidget
                                          .staggeredDotsWave(
                                              color: Colors.white, size: 23)
                                      : Text(
                                          "Submit",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffEDEDED)),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        )));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.black12),
            )),
            child: Row(
              children: [
                Icon(
                  Iconsax.password_check,
                  color: PrimaryColor,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "Change Password",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppBlack),
                  ),
                ),
                RotatedBox(
                    quarterTurns: 2,
                    child: Icon(Icons.arrow_back_ios_outlined)),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => AddressListView(),
                transition: Transition.rightToLeft,
                duration: Duration(milliseconds: 400));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.black12),
            )),
            child: Row(
              children: [
                Icon(
                  Iconsax.location,
                  color: PrimaryColor,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "My Address",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppBlack),
                  ),
                ),
                RotatedBox(
                    quarterTurns: 2,
                    child: Icon(Icons.arrow_back_ios_outlined)),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.black12),
          )),
          child: Row(
            children: [
              Icon(
                Icons.policy,
                color: PrimaryColor,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Privacy Policy",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppBlack),
                ),
              ),
              RotatedBox(
                  quarterTurns: 2, child: Icon(Icons.arrow_back_ios_outlined)),
            ],
          ),
        ),
        Expanded(child: Container()),
        InkWell(
          onTap: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString("LOGIN", "OUT");
            preferences.setString("TOKEN", "");
            Get.to(() => AuthenticationScreen());
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), border: Border.all()),
            child: Text(
              'Logout',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
