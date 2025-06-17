import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTxtFormField extends StatelessWidget {
  const CustomTxtFormField({super.key, required this.hintText, this.width,this.controller,this.icon});
  final String hintText;
  final double? width;
  final TextEditingController? controller;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Adaptive.h(6),
      width: width ?? double.infinity,
      child: TextField(
        controller:controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12.sp),
            fillColor: buttonColor,
            filled: true,
            suffixIcon: icon??SizedBox(),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: black),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: black),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: black),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            hintText: hintText,
            hintStyle:
                GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 10.px)),
      ),
    );
  }
}
