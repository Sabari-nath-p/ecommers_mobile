import 'package:ecommerce_mobile/Screen/HomeScreen/Widgets/SearchView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/Colors.dart';
import '../Services/Controller.dart';

class HMCategoryView extends StatelessWidget {
  HMCategoryView({super.key});
  HomeController hCtrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  "Category",
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1f2029)),
                  textAlign: TextAlign.left,
                ),
                Expanded(child: Container()),
                Text(
                  "See All",
                  style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1f2029)),
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  width: 5.w,
                )
              ],
            )),
        SizedBox(
          height: 1.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var data in hCtrl.CategoryModelList)
                if (data.isActive!)
                  InkWell(
                    onTap: () {
                      hCtrl.searchCategory(data.categoryName!);
                      Get.to(
                        () => SearchViewScreen(),
                        transition: Transition.downToUp,
                      );
                    },
                    child: Container(
                      width: 25.w,
                      height: 12.h,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: PrimaryColor.withOpacity(.2)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 7.h,
                            width: 7.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: (data.categoryImages!.isNotEmpty)
                                  ? Image.network(
                                      data.categoryImages!.first.images!,
                                    )
                                  : Image.network(
                                      "https://e7.pngegg.com/pngimages/780/540/png-clipart-organic-food-meat-slicer-mandoline-peeler-fresh-fruits-and-vegetables-natural-foods-leaf-vegetable.png",
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          Text(
                            data.categoryName!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1f2029)),
                          )
                        ],
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
