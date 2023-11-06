import 'package:ecommerce_mobile/Screen/HomeScreen/Services/Controller.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Widgets/Home.dart';
import 'package:ecommerce_mobile/Screen/Profile/ProfileScreenMain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class HomeScreenMain extends StatelessWidget {
  HomeScreenMain({super.key});

  HomeController hCtrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          leadingWidth: 20,
          title: Text(
            "Zeagion",
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          actions: [
            Icon(
              FontAwesome.cart_shopping,
              size: 21,
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => ProfileScreenMain(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 500));
              },
              child: Icon(
                HeroIcons.user,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: GetBuilder<HomeController>(builder: (_) {
          return HomeScreenVIew();
        }));
  }
}
