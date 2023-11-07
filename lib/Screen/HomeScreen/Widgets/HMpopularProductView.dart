import 'package:ecommerce_mobile/Screen/ProductDetails/ProductScreenMain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Services/Controller.dart';

class HMpopularproduct extends StatelessWidget {
  HMpopularproduct({super.key});
  HomeController hCtrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Popular Products",
              style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1f2029)),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Wrap(
              spacing: 5,
              runSpacing: 10,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              children: [
                for (var data in hCtrl.popularProductList)
                  InkWell(
                    onTap: () {
                      Get.to(
                          () => ProductScreenMain(
                                ProductID: data.id!,
                              ),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 400));
                    },
                    child: Container(
                      width: 45.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(.4, .4),
                                spreadRadius: .1,
                                blurRadius: 8,
                                color: Colors.black26.withOpacity(.1))
                          ],
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 45.w,
                            height: 25.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                color: Color(0xffEDEDED)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                              child: (data.product!.productImages!.isNotEmpty)
                                  ? Image.network(
                                      data.product!.productImages!.first.image!,
                                      fit: BoxFit.contain,
                                    )
                                  : Icon(
                                      Icons.image_not_supported_outlined,
                                      color: Colors.grey.withOpacity(.3),
                                      size: 17.w,
                                    ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              data.product!.productName!,
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "₹ " + data.product!.salesPrice! + " ",
                                  maxLines: 1,
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                if (data.product!.salesPrice !=
                                    data.product!.actualPrice)
                                  Text(
                                    data.product!.actualPrice!,
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: Colors.black,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w500),
                                  ),
                                Expanded(child: Container()),
                                Text(
                                  data.product!.unitName!,
                                  maxLines: 1,
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
