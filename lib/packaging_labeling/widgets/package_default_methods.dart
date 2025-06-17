import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget mitraSellMethod() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: Adaptive.w(30),
                  height: Adaptive.h(5),
                  decoration: BoxDecoration(
                      color: const Color(0xffF4BC1C),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(14.sp),
                          topRight: Radius.circular(14.sp))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star),
                      Text(
                        'Verified',
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600, fontSize: 10.px),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  buildVSpacer(5),
                  Row(
                    children: [
                      Image.asset("assets/pro.png"),
                      buildHSpacer(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildText1(title: "Wheat", size: 18),
                          _buildText1(
                              title: "Variety :  v1,Sharbati", size: 11),
                          _buildText1(title: "Location : Jabalpur", size: 11),
                        ],
                      )
                    ],
                  ),
                  buildVSpacer(10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildText1(title: "Quantity (approx.)"),
                        const Spacer(),
                        _buildText1(title: "100 QT"),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffF4BC1C),
                    ),
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildText1(title: "Min-Price (approx.)"),
                        const Spacer(),
                        _buildText1(title: "₹ 2,400.00"),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffF4BC1C),
                    ),
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildText1(title: "Total Cost (approx.)"),
                        const Spacer(),
                        _buildText1(title: "₹ 2,40,000.00"),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF4BC1C),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildText1(
                          title:
                              "Description : Turmeric, a plant in the ginger family, is native to South east Asia and is grown commercially in that region.",
                          size: 11.px),
                    ),
                  ),
                  buildVSpacer(20),
                ],
              ),
            ),
            buildVSpacer(3.h),
            Stack(
              children: [
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
                              Image.asset('assets/Mask group.png'),
                              SizedBox(
                                height: Adaptive.h(6),
                                child: Row(children: [
                                  Text(
                                    '4.5',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp),
                                  ),
                                  ...List.generate(3, (index) {
                                    return SizedBox(
                                      height: 3.h,
                                      child: const Icon(
                                        Icons.star,
                                        size: 12, // Adjust size as needed
                                        color: Colors
                                            .black, // Adjust color as needed
                                      ),
                                    );
                                  }),
                                ]),
                              )
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
                              buildVSpacer(2.h),
                              Text(
                                'Mobile   :  +91 1234567890',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 9.px),
                              ),
                              buildVSpacer(2.h),
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
                      buildVSpacer(1.h)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: -18,
        left: 20,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xff3985D7),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.black26),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/check.png",
                scale: 0.8,
              ),
              buildHSpacer(5),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AD ID: 4545454454",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Posted Date : 05-April-24",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: Adaptive.h(18),
        left: 20,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xff5EAB04),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.black26),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/check.png",
                scale: 0.8,
              ),
              buildHSpacer(5),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order ID: 67001",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Date : 05-April-24",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _buildText1(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Text(
      title,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    ),
  );
}



Widget mitraSellForCompleteMethod() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: Adaptive.w(30),
                  height: Adaptive.h(5),
                  decoration: BoxDecoration(
                      color: const Color(0xffF4BC1C),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(14.sp),
                          topRight: Radius.circular(14.sp))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star),
                      Text(
                        'Verified',
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600, fontSize: 10.px),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  buildVSpacer(5),
                  Row(
                    children: [
                      Image.asset("assets/pro.png"),
                      buildHSpacer(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildText1(title: "Wheat", size: 18),
                          _buildText1(
                              title: "Variety :  v1,Sharbati", size: 11),
                          _buildText1(title: "Location : Jabalpur", size: 11),
                        ],
                      )
                    ],
                  ),
                  buildVSpacer(10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildText1(title: "Quantity (approx.)"),
                        const Spacer(),
                        _buildText1(title: "100 QT"),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffF4BC1C),
                    ),
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildText1(title: "Min-Price (approx.)"),
                        const Spacer(),
                        _buildText1(title: "₹ 2,400.00"),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffF4BC1C),
                    ),
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildText1(title: "Total Cost (approx.)"),
                        const Spacer(),
                        _buildText1(title: "₹ 2,40,000.00"),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF4BC1C),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildText1(
                          title:
                              "Description : Turmeric, a plant in the ginger family, is native to South east Asia and is grown commercially in that region.",
                          size: 11.px),
                    ),
                  ),
                  buildVSpacer(20),
                ],
              ),
            ),
            buildVSpacer(3.h),
            Stack(
              children: [
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
                              Image.asset('assets/Mask group.png'),
                              SizedBox(
                                height: Adaptive.h(6),
                                child: Row(children: [
                                  Text(
                                    '4.5',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp),
                                  ),
                                  ...List.generate(3, (index) {
                                    return SizedBox(
                                      height: 3.h,
                                      child: const Icon(
                                        Icons.star,
                                        size: 12, // Adjust size as needed
                                        color: Colors
                                            .black, // Adjust color as needed
                                      ),
                                    );
                                  }),
                                ]),
                              )
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
                              buildVSpacer(2.h),
                              Text(
                                'Mobile   :  +91 1234567890',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 9.px),
                              ),
                              buildVSpacer(2.h),
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
                         CustomButton(
          text: "Completed",
          onPressed: () {},
          color: white,
        ),
                      buildVSpacer(1.h)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: -18,
        left: 20,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xff3985D7),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.black26),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/check.png",
                scale: 0.8,
              ),
              buildHSpacer(5),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AD ID: 4545454454",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Posted Date : 05-April-24",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: Adaptive.h(24),
        left: 20,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xff5EAB04),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.black26),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/check.png",
                scale: 0.8,
              ),
              buildHSpacer(5),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order ID: 67001",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Date : 05-April-24",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
