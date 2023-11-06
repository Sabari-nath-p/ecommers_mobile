import 'package:ecommerce_mobile/Constants/Colors.dart';
import 'package:ecommerce_mobile/Screen/Profile/Views/profileView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import 'Service/controller.dart';

class ProfileScreenMain extends StatelessWidget {
  ProfileScreenMain({super.key});
  ProfileController proctrl = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 20,
            ),
          ),
        ),
        leadingWidth: 20,
        title: Text(
          "My Profile",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: GetBuilder<ProfileController>(builder: (context) {
        return ProfileView();
      }),
    ));
  }
}
