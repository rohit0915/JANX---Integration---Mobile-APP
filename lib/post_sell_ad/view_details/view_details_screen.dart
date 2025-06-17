// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewDetailsScreen extends StatelessWidget {
  const ViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: buttonColor,
            )),
        title: Text(
          'Reviews',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w700, fontSize: 22.px, color: white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      buildVSpacer(3.h),
                      Container(
                        width: Adaptive.w(100),
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                            color: const Color(0xffF4BC1C),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.sp),
                                topRight: Radius.circular(12.sp))),
                        child: Column(
                          children: [
                            buildVSpacer(4.h),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/Frame 1321316506.png'),
                                  ],
                                ),
                                buildHSpacer(3.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rahul Tiwari',
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.px),
                                    ),
                                    buildVSpacer(0.5.h),
                                    Text(
                                      'Mobile   :  +91 1234567890',
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 8.px),
                                    ),
                                    buildVSpacer(0.5.h),
                                    Text(
                                      'Address : Mg-Road , Street No: 6 , 9th Cross, Beside\nCanara Bank , Bengaluru , Kanataka - 560001',
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8.px),
                                    )
                                  ],
                                )
                              ],
                            ),
                            buildVSpacer(2.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: Adaptive.h(1),
                    left: Adaptive.w(3),
                    child: IntrinsicWidth(
                      child: Container(
                        padding: EdgeInsets.all(8.sp),
                        decoration: BoxDecoration(
                            color: const Color(0xff5EAB04),
                            borderRadius: BorderRadius.circular(24.sp)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: Adaptive.w(3),
                              backgroundColor: white,
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  color: black,
                                  size: 13,
                                ),
                              ),
                            ),
                            buildHSpacer(1.3.w),
                            Text(
                              'Aadhar Verified',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600, fontSize: 10.px),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              buildVSpacer(2.h),
              Container(
                padding: EdgeInsets.all(12.sp),
                color: buttonColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                        text: 'Chat',
                        onPressed: () {},
                        width: Adaptive.w(33),
                        color: white,
                        textColor: black),
                    CustomButton(
                        text: 'Call',
                        onPressed: () {},
                        width: Adaptive.w(33),
                        color: black,
                        textColor: white)
                  ],
                ),
              ),
              buildVSpacer(4.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '578 Reviews',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.px,
                      color: white),
                ),
              ),
              buildVSpacer(2.h),
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(22.sp),
                ),
                child: Center(
                  child: Text(
                    'Write a Review',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.px,
                        color: white),
                  ),
                ),
              ),
              buildVSpacer(2.h),
              Container(
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp), color: white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sort by Newest Review',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.px,
                      ),
                    ),
                    // Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down,
                    )
                  ],
                ),
              ),
              buildVSpacer(2.h),
              Image.asset('assets/Frame 1321316513.png'),
              buildVSpacer(3.h),
              reviewWidgets(),
              buildVSpacer(3.h),
              reviewWidgets(),
                            buildVSpacer(3.h),
              blankContainers(title: "Operating Lanes"),
                            blankContainers(title: "Truck Types"),
              blankContainers(title: "Products"),

            ],
          ),
        ),
      ),
    );
  }

  Widget blankContainers({required String title}) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  _buildText(title: title,fontWeight: FontWeight.w500,size: 14.px,align: true,color: white),
            buildVSpacer(3.h),
Container(
height: Adaptive.h(15),
width: Adaptive.w(100),
decoration: BoxDecoration(
  color: white,
  borderRadius: BorderRadius.circular(12.sp)
),
),
buildVSpacer(3.h)
                ],
              ),
            );
  }

  Padding reviewWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          color: white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText(
                title: 'Jan 20, 2024',
                size: 12.px,
                fontWeight: FontWeight.w600,
                color: grey),
            buildVSpacer(2.h),
            Image.asset('assets/review.png'),
            buildVSpacer(2.h),
            Row(
              children: [
                CircleAvatar(
                  radius: Adaptive.w(4),
                  backgroundColor: Color(0xff5465FF).withOpacity(0.1),
                  child: Center(
                      child: _buildText(
                          title: "AK",
                          size: 13.px,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff5465FF))),
                ),
                buildHSpacer(3.w),
                _buildText(
                    title: "Alex K.", size: 13.px, fontWeight: FontWeight.w500)
              ],
            ),
            buildVSpacer(2.h),
            _buildText(
                title: "Senior Analyst",
                size: 14.px,
                color: Colors.grey,
                fontWeight: FontWeight.w500),
            buildVSpacer(2.h),
            _buildText(
                title:
                    "Working at Sam.AI has been an incredible journey so far. The technology we're building is truly cutting-edge, and being a part of a team that's revolutionizing how people achieve their goals is immensely fulfilling. ",
                size: 14.px,
                // color: Colors.grey,
                fontWeight: FontWeight.w400),
          ],
        ),
      ),
    );
  }

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color,
      bool align = false}) {
    return align
        ? Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: size ?? 14,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  fontFamily: 'Poppins',
                  color: color ?? Colors.black),
            ),
          )
        : Text(
            title,
            style: TextStyle(
                fontSize: size ?? 14,
                fontWeight: fontWeight ?? FontWeight.w400,
                fontFamily: 'Poppins',
                color: color ?? Colors.black),
          );
  }
}
