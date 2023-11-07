import 'package:ecommerce_mobile/Screen/Order/View/Orderview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderMainScreen extends StatelessWidget {
  const OrderMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              "My Orders",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          body: OrderView()),
    );
  }
}
