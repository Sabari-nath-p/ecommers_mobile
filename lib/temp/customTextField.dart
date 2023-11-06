import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Constants/Colors.dart';

customTextField(
  TextEditingController controller,
  String text,
  Icon CIcon,
) =>
    Container(
      margin: EdgeInsets.only(left: 0.2.w),
      height: 6.5.h,
      width: 88.w,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          labelText: text,
          labelStyle:
              GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w500),
          prefixIcon: CIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xff797979)),
          ),
          focusColor: PrimaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xff797979)),
          ),
        ),
      ),
    );
