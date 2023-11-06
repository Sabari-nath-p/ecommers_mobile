import 'package:ecommerce_mobile/Constants/Colors.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Services/Controller.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Widgets/HMpopularProductView.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Widgets/HmCategoryview.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Widgets/HmPopularShop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class HomeScreenVIew extends StatelessWidget {
  HomeScreenVIew({super.key});

  HomeController hCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.only(left: 3.5.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 90.w,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: ("Search your product"),
                        isCollapsed: true,
                        hintStyle: GoogleFonts.poppins(fontSize: 14),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(color: Color(0xff797979)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      FlutterCarousel(
                          items: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "https://img.freepik.com/free-vector/online-grocery-store-horizontal-banner_23-2150208500.jpg?w=2000&t=st=1699238640~exp=1699239240~hmac=a5c23038fe6ca2588379428c4c0fae9794e0f49e42e40fc333fffa91fd1071a8",
                                fit: BoxFit.fill,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "https://img.freepik.com/premium-vector/online-food-order-service-banner-concept-with-waiter-carry-food-cloche-screen-display_131114-26.jpg?w=2000",
                                fit: BoxFit.fill,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "https://img.freepik.com/premium-vector/interface-online-shopping-mobile-applications-websites-concepts_131114-29.jpg?w=2000",
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                          options: CarouselOptions(
                            height: 20.h,
                            disableCenter: true,
                            aspectRatio: 9 / 16,
                            enableInfiniteScroll: true,
                            viewportFraction: .75,
                            enlargeCenterPage: true,
                            showIndicator: false,
                            autoPlay: true,
                          )),
                      SizedBox(
                        height: 2.h,
                      ),
                      HMCategoryView(),
                      SizedBox(
                        height: 2.h,
                      ),
                      HmPopularShop(),
                      SizedBox(
                        height: 1.h,
                      ),
                      HMpopularproduct()
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
