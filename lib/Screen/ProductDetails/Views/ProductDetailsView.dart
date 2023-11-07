import 'package:ecommerce_mobile/Constants/Colors.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Services/Controller.dart';
import 'package:ecommerce_mobile/Screen/ProductDetails/Service/Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

import '../ProductScreenMain.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailView({super.key});
  ProductController prdCtrl = Get.put(ProductController());
  HomeController hctrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
                  height: 30.h,
                  decoration: BoxDecoration(color: Color(0xffEDEDED)),
                  child: FlutterCarousel(
                      items: [
                        for (var data in prdCtrl.product.last.productImages!)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              data.image!,
                              fit: BoxFit.fill,
                            ),
                          ),
                      ],
                      options: CarouselOptions(
                        height: 20.h,
                        disableCenter: true,
                        aspectRatio: 9 / 16,
                        enableInfiniteScroll: true,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        showIndicator: false,
                        autoPlay: true,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        prdCtrl.product.last.shop!.split("--")[1],
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Icon(
                      Icons.star,
                      size: 5.w,
                      color: Colors.amber.shade600,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(prdCtrl.product.last.rating.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1f2029)),
                        textAlign: TextAlign.start),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(prdCtrl.product.last.productName!,
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1f2029)),
                      textAlign: TextAlign.start),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10, top: 5, bottom: 10),
                  child: Text("Product Details",
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1f2029)),
                      textAlign: TextAlign.start),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ReadMoreText(
                    prdCtrl.product.last.description!,
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 0),
                  width: 100.w,
                  height: .8.h,
                  color: PrimaryColor.withOpacity(.05),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10, top: 10, bottom: 10),
                  child: Text(
                      prdCtrl.product.last.shop!.split("--")[1] + " Products",
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1f2029)),
                      textAlign: TextAlign.start),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var data in prdCtrl.productsList)
                        InkWell(
                          onTap: () {
                            prdCtrl.addProduct(data.productId!);
                            // Get.to(
                            //     () => ProductScreenMain(
                            //           ProductID: data.productId!,
                            //         ),
                            //     preventDuplicates: false,
                            //     transition: Transition.rightToLeft,
                            //     duration: Duration(milliseconds: 400));
                          },
                          child: Container(
                            width: 45.w,
                            //    height: 26.h,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            constraints: BoxConstraints(
                                maxHeight: 26.h, minHeight: 23.h),
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
                SizedBox(
                  height: 13.h,
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 9.h,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Total Price",
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1f2029)),
                          textAlign: TextAlign.start),
                      Row(
                        children: [
                          Text(
                              "₹ " + prdCtrl.product.last.salesPrice.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff1f2029)),
                              textAlign: TextAlign.start),
                          SizedBox(
                            width: 10,
                          ),
                          Text(prdCtrl.product.last.actualPrice.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                  color: Color(0xff1f2029)),
                              textAlign: TextAlign.start),
                        ],
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  if (prdCtrl.getProductQuantity(
                          prdCtrl.product!.last.productId!) <
                      1)
                    InkWell(
                      onTap: () {
                        prdCtrl.addToCart(prdCtrl.product.last.productId!);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 7.w, right: 7.w),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 6.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: PrimaryColor),
                        child: (!prdCtrl.CartLoading)
                            ? Text(
                                "Add to Cart",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 14.sp),
                              )
                            : LoadingAnimationWidget.prograssiveDots(
                                color: Colors.white, size: 24),
                      ),
                    ),
                  if (prdCtrl.getProductQuantity(
                          prdCtrl.product!.last.productId!) >
                      0)
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            prdCtrl.removefromCart(
                                prdCtrl.product.last.productId!);
                          },
                          child: Container(
                            width: 10.w,
                            height: 10.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: PrimaryColor),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 14.w,
                          height: 10.w,
                          child: (!prdCtrl.CartLoading)
                              ? Text(
                                  ((prdCtrl.getProductQuantity(prdCtrl
                                              .product!.last.productId!) <
                                          9))
                                      ? "0" +
                                          prdCtrl
                                              .getProductQuantity(prdCtrl
                                                  .product!.last.productId!)
                                              .toString()
                                      : prdCtrl
                                          .getProductQuantity(
                                              prdCtrl.product!.last.productId!)
                                          .toString(),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp),
                                )
                              : LoadingAnimationWidget.prograssiveDots(
                                  color: PrimaryColor, size: 24),
                        ),
                        InkWell(
                          onTap: () {
                            prdCtrl.addToCart(prdCtrl.product.last.productId!);
                          },
                          child: Container(
                            width: 10.w,
                            height: 10.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: PrimaryColor),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        )
                      ],
                    ),
                ],
              ),
            ))
      ],
    );
  }
}
