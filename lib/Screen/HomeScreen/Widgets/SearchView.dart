import 'dart:convert';

import 'package:ecommerce_mobile/Screen/ProductDetails/ProductScreenMain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

import '../Services/Controller.dart';

class SearchViewScreen extends StatelessWidget {
  SearchViewScreen({super.key});
  HomeController hCtrl = Get.put(HomeController());
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Zeagion",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          Icon(
            FontAwesome.cart_shopping,
            size: 21,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: GetBuilder<HomeController>(builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 90.w,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.emailAddress,
                  textAlignVertical: TextAlignVertical.center,
                  onSubmitted: (Value) {
                    if (hCtrl.searchMethod == 0) hCtrl.SearchText(Value);
                    if (hCtrl.searchMethod == 1)
                      hCtrl.searchCategory(hCtrl.selectedCategory, text: Value);
                  },
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Result for ${hCtrl.SearchString}",
                  style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1f2029)),
                ),
                Expanded(child: Container()),
                Text(
                  hCtrl.ProductList.length.toString() + " founds",
                  style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1f2029)),
                ),
                SizedBox(
                  width: 3.w,
                )
              ],
            ),
            if (hCtrl.searchMethod == 1)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var data in hCtrl.CategoryModelList)
                        InkWell(
                          onTap: () {
                            hCtrl.searchCategory(data.categoryName!,
                                text: controller.text);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black12),
                                color: (data.categoryName ==
                                        hCtrl.selectedCategory)
                                    ? Colors.blue
                                    : Colors.white),
                            child: Text(data.categoryName!,
                                style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: (data.categoryName ==
                                            hCtrl.selectedCategory)
                                        ? Colors.white
                                        : Colors.black)),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            if (hCtrl.searchMethod == 2)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var data in hCtrl.ShopList)
                        InkWell(
                          onTap: () {
                            hCtrl.searchShop(data.shopName!,
                                text: controller.text);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black12),
                                color: (data.shopName == hCtrl.selectedShop)
                                    ? Colors.blue
                                    : Colors.white),
                            child: Text(
                              data.shopName!,
                              style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: (data.shopName == hCtrl.selectedShop)
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    for (var data in hCtrl.ProductList)
                      InkWell(
                        onTap: () {
                          Get.to(
                              () => ProductScreenMain(
                                    ProductID: data.productId!,
                                  ),
                              transition: Transition.rightToLeft,
                              duration: Duration(milliseconds: 400));
                        },
                        child: Container(
                          width: 45.w,
                          //    height: 26.h,
                          constraints:
                              BoxConstraints(maxHeight: 26.h, minHeight: 23.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            color: Color(0xFFFFFFFF),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 15.h,
                                width: 45.w,
                                // margin: EdgeInsets.only(top: 5.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.w),
                                    color: Color(0xffEDEDED)),
                                child: (data.productImages!.isNotEmpty)
                                    ? Image.network(
                                        data.productImages!.first.image!,
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(
                                        Icons.image_not_supported_outlined,
                                        color: Colors.grey.withOpacity(.3),
                                        size: 17.w,
                                      ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(data.productName!,
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff1f2029)),
                                    textAlign: TextAlign.start),
                              ),
                              // SizedBox(
                              //   width: 6.w,
                              // ),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Text(
                                    "₹ " + data.salesPrice! + " ",
                                    style: GoogleFonts.poppins(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff1f2029)),
                                    textAlign: TextAlign.start,
                                  ),
                                  if (data.salesPrice != data.actualPrice)
                                    Text(
                                      data.actualPrice!,
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                          fontSize: 9,
                                          color: Colors.black,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 4.w,
                                    color: Color(0xff797979),
                                  ),
                                  Text(data.rating.toString(),
                                      style: GoogleFonts.poppins(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff1f2029)),
                                      textAlign: TextAlign.start),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
