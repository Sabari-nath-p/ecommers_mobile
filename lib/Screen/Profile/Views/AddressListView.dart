import 'package:ecommerce_mobile/Constants/Colors.dart';
import 'package:ecommerce_mobile/Screen/Profile/Service/controller.dart';
import 'package:ecommerce_mobile/temp/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/Headers.dart';
import '../../../Constants/Strings.dart';

class AddressListView extends StatelessWidget {
  AddressListView({super.key});
  ProfileController proctrl = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    //proctrl.changePassword("NewPassword", "CurrentPassword");
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
          "My Address",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: GetBuilder<ProfileController>(builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 3.w,
                    ),
                    for (var data in proctrl.AddressList)
                      Container(
                        height: 10.h,
                        width: 100.w,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.w, vertical: 10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                spreadRadius: .2,
                                offset: Offset(1, 1),
                                color: const Color.fromRGBO(0, 0, 0, 1)
                                    .withOpacity(.2))
                          ],
                          borderRadius: BorderRadius.circular(12),
                          //  border: Border.all()
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data.houseName}",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${data.area}",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              data.city! +
                                  " - " +
                                  data.district! +
                                  ", " +
                                  data.state! +
                                  " " +
                                  data.pincode!,
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  addAddresss(context, proctrl);
                },
                child: Container(
                  width: 88.w,
                  height: 6.h,
                  margin: EdgeInsets.only(left: 0.5.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: PrimaryColor),
                  alignment: Alignment.center,
                  child: (!true)
                      ? LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.white, size: 23)
                      : Text(
                          "Add Address",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              color: Color(0xffEDEDED)),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 4.w,
            )
          ],
        );
      }),
    );
  }
}

addAddresss(BuildContext context, ProfileController pctrl) {
  TextEditingController homeName = TextEditingController();
  TextEditingController Landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController state = TextEditingController();
  state.text = "kerala";
  district.text = "Eranakulam";
  TextEditingController pincode = TextEditingController();
  TextEditingController postoffice = TextEditingController();
  bool loading = false;
  showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (context) => StatefulBuilder(
          builder: (context, st) => Container(
                alignment: Alignment.center,
                height: 80.h,
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
                child: Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Add Address ",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: AppBlack),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        customTextField(
                            homeName, "House Name", Icon(Icons.home)),
                        SizedBox(
                          height: 1.h,
                        ),
                        customTextField(
                          Landmark,
                          "Landmark",
                          Icon(HeroIcons.arrows_pointing_in),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        customTextField(
                            city, "City", Icon(Icons.location_city)),
                        SizedBox(
                          height: 1.h,
                        ),
                        customTextField(district, "District", Icon(Icons.home)),
                        SizedBox(
                          height: 1.h,
                        ),
                        customTextField(state, "State", Icon(Icons.place)),
                        SizedBox(
                          height: 1.h,
                        ),
                        customTextField(postoffice, "Post Office",
                            Icon(Icons.local_post_office_outlined)),
                        SizedBox(
                          height: 1.h,
                        ),
                        customTextField(pincode, "Pincode", Icon(Icons.pin)),
                        SizedBox(
                          height: 1.h,
                        ),
                        InkWell(
                          onTap: () async {
                            if (homeName.text.isEmpty ||
                                Landmark.text.isEmpty ||
                                city.text.isEmpty ||
                                district.text.isEmpty ||
                                state.text.isEmpty ||
                                postoffice.text.isEmpty ||
                                pincode.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please fill details to continue");
                              return;
                            }

                            st(() {
                              loading = true;
                            });
                            final Response = await post(
                                Uri.parse(baseurl + "user-address-add-list/"),
                                headers: AuthHeader,
                                body: {
                                  "house_name": homeName.text,
                                  "area": Landmark.text,
                                  "city": city.text,
                                  "district": district.text,
                                  "state": state.text,
                                  "postoffice": postoffice.text,
                                  "pincode": pincode.text
                                });
                            print(Response.body);
                            print(Response.statusCode);
                            if (Response.statusCode == 200 ||
                                Response.statusCode == 201) {
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: "Address added successfully");
                              pctrl.GetAddressList();
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Something went wrong");
                              st(() {
                                loading = false;
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
                            child: (loading)
                                ? LoadingAnimationWidget.staggeredDotsWave(
                                    color: Colors.white, size: 23)
                                : Text(
                                    "Add Address",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffEDEDED)),
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                ),
              )));
}
