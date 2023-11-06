import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Services/Controller.dart';

class HmPopularShop extends StatelessWidget {
  HmPopularShop({super.key});
  HomeController hCtrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Nearby Shopes",
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff1f2029)),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var data in hCtrl.ShopList)
                Container(
                  width: 60.w,
                  height: 20.h,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/c/ce/Tuck_Shop_in_Oxford.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          width: 60.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black87,
                                  Colors.black54,
                                  Colors.black12,
                                  Colors.transparent
                                ]),
                            // image: DecorationImage(
                            //     image: NetworkImage(
                            //         "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/127d6d2a1a4f3e995fba2c5dd93b574f",)),
                            // backgroundBlendMode: BlendMode.darken
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          left: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.shopName!,
                                maxLines: 1,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                data.locality! + "-" + data.city!,
                                maxLines: 1,
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              if (false)
                                Text(
                                  data.phoneNumber!,
                                  maxLines: 1,
                                  style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ))
                    ],
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
