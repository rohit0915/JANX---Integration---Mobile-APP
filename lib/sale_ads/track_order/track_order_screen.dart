// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/about_janx/about_janx_screen.dart';
import 'package:jan_x/sale_ads/widgets/sale_order_tracking_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18.sp,
              color: buttonColor,
            )),
        title: _buildText(
          title: "Track Order",
          size: 22.px,
          fontWeight: FontWeight.w700,
          color: white,
        ),
        centerTitle: true,
        actions: [
          Image.asset('assets/trackOrder2.png'),
          buildHSpacer(3.w),
          Image.asset(
            'assets/trackOrder.png',
          ),
          buildHSpacer(3.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildVSpacer(3.h),
            const Divider(
              color: buttonColor,
              thickness: 1,
            ),
            buildVSpacer(1.h),
            Align(
              alignment: Alignment.centerLeft,
              child: _buildText(
                title: "Order can be tracked by + 91 7777888899.",
                size: 12.px,
                fontWeight: FontWeight.w700,
                color: buttonColor,
              ),
            ),
            buildVSpacer(1.h),
            Align(
              alignment: Alignment.centerLeft,
              child: _buildText(
                title: "Tracking link is shared Via SMS.",
                size: 12.px,
                fontWeight: FontWeight.w700,
                color: buttonColor,
              ),
            ),
            buildVSpacer(2.h),
            const Divider(
              color: buttonColor,
              thickness: 1,
            ),
            buildVSpacer(3.h),
            trackOrderItem(context),
            buildVSpacer(3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildText(
                        title: "Shipping Address",
                        size: 14.px,
                        fontWeight: FontWeight.w800,
                        color: buttonColor),
                  ),
                  buildVSpacer(2.h),
                  Container(
                    width: Adaptive.w(100),
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.sp),
                      color: white,
                    ),
                    child: Row(
                      children: [
                        _buildText(
                            title:
                                "Deliver Address : Sunil,\nMG Road , Benagaluru , karnataka,57001.",
                            size: 12.px,
                            fontWeight: FontWeight.w600),
                        Spacer(),
                        CustomButton3(
                          text: "Change",
                          onPressed: () {},
                          width: Adaptive.w(25),
                          height: Adaptive.h(6),
                          size: 11.px,
                        )
                      ],
                    ),
                  ),
                  buildVSpacer(2.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildText(
                        title: "PAYMENT SUMMARY",
                        size: 12.px,
                        color: buttonColor,
                        fontWeight: FontWeight.w600),
                  ),
                  buildVSpacer(2.h),
                  Container(
                    // padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        color: white),
                    child: Column(
                      children: [
                        priceMethod(title1: "Price", title2: "₹ 10,000"),
                        Divider(
                          thickness: 1,
                          color: grey.withOpacity(0.1),
                        ),
                        // buildVSpacer(1.h),
                        priceMethod(
                            title1: "Total Amount", title2: "₹ 60,000"),
                        // buildVSpacer(1.h),
                        Divider(
                          thickness: 1,
                          color: grey.withOpacity(0.1),
                        ),
                        priceMethod(title1: "tax (5%)", title2: "₹ 2,000"),
                        Divider(
                          thickness: 1,
                          color: grey.withOpacity(0.1),
                        ),
                        priceMethod(
                            title1: "Convenience Fee (2%)",
                            title2: "₹ 1,200"),
                        Divider(
                          thickness: 1,
                          color: grey.withOpacity(0.1),
                        ),
                        priceMethod2(title1: "Others", title2: "₹ 1,200"),
                        // Divider(
                        //   thickness: 1,
                        //   color: grey.withOpacity(0.1),
                        // ),
                        // priceMethod(title1: "Net Amount", title2: "₹ 60,000"),
                        buildVSpacer(2.h)
                      ],
                    ),
                  ),
                  buildVSpacer(2.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildText(
                        title: "Payment Mode",
                        size: 12.px,
                        color: buttonColor,
                        fontWeight: FontWeight.w600),
                  ),
                  buildVSpacer(2.h),
                  Container(
                    padding: EdgeInsets.all(16.sp),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            _buildText(
                              title: "₹ 5000/-",
                              size: 12.px,
                              fontWeight: FontWeight.w800,
                            ),
                            buildVSpacer(1.h),
                            _buildText(
                                title: "sunil@indianupi",
                                size: 12.px,
                                fontWeight: FontWeight.w600),
                            buildVSpacer(1.h),
                            _buildText(
                                title:
                                    "Bank Transfer  (Indian)/\nUPI/G-pay etc....",
                                size: 12.px,
                                fontWeight: FontWeight.w800,
                                color: buttonColor)
                          ],
                        ),
                        // buildHSpacer(5.w),
                        Spacer(),
                        Column(
                          children: [
                            CustomButton3(
                              text: "View",
                              onPressed: () {},
                              width: Adaptive.w(25),
                              height: Adaptive.h(5),
                              size: 11.px,
                            ),
                            buildVSpacer(2.h),
                            _buildText(
                                title:
                                    "Bank Transaction\nSuccessfull\nAPI Data",
                                size: 12.px,
                                align: TextAlign.center,
                                fontWeight: FontWeight.w600)
                          ],
                        ),
                        buildHSpacer(6.w),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            buildVSpacer(2.h),
          ],
        ),
      ),
    );
  }

  Padding priceMethod2({
    required String title1,
    required String title2,
  }) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildText(
                  title: title1, size: 13.px, fontWeight: FontWeight.w800),
              buildHSpacer(3.w),
              Image.asset('assets/order exm.png')
            ],
          ),
          _buildText(title: title2, size: 13.px, fontWeight: FontWeight.w800),
        ],
      ),
    );
  }

  Padding priceMethod(
      {required String title1, required String title2, FontWeight? weight}) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildText(
              title: title1,
              size: 12.px,
              fontWeight: weight ?? FontWeight.w600),
          _buildText(
              title: title2,
              size: 12.px,
              fontWeight: weight ?? FontWeight.w600),
        ],
      ),
    );
  }

  Padding trackOrderItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
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
                          )),
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
                buildVSpacer(20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/wishimage.png"),
                          buildHSpacer(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildText(
                                  title: "Electronic,Washing Machine",
                                  size: 18),
                              _buildText(title: "Brand :  LG", size: 11),
                              _buildText(
                                  title: "Location : Jabalpur", size: 11),
                              _buildText(
                                  title: "30-04-24 - 04-05-24", size: 11),
                            ],
                          )
                        ],
                      ),
                      buildVSpacer(10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            _buildText(title: "Quantity (approx.)"),
                            const Spacer(),
                            _buildText(title: "01 Pc"),
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
                            _buildText(title: "Min-Price (approx.)"),
                            const Spacer(),
                            _buildText(title: "₹ 2,400.00"),
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
                            _buildText(title: "Total Cost (approx.)"),
                            const Spacer(),
                            _buildText(title: "₹ 2,40,000.00"),
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
                          child: _buildText(
                              title:
                                  "Description : Turmeric, a plant in the ginger family, is native to South east Asia and is grown commercially in that region.",
                              size: 9.px,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      buildVSpacer(6.h),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/Mask group.png'),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18.sp),
                                              color: white),
                                          height: Adaptive.h(3),
                                          padding: const EdgeInsets.all(2),
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
                                                  size:
                                                      12, // Adjust size as needed
                                                  color: Colors
                                                      .black, // Adjust color as needed
                                                ),
                                              );
                                            }),
                                          ]),
                                        ),
                                      ],
                                    ),
                                    buildHSpacer(3.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        ),
                                        buildVSpacer(2.h),
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
                      buildVSpacer(5.h),
                    ],
                  ),
                ),
                Image.asset('assets/trackOrder3.png'),
                buildVSpacer(3.h),
                // ignore: prefer_const_constructors
                Divider(
                  color: black,
                  thickness: 1,
                ),
                buildVSpacer(1.h),
                Image.asset('assets/trackOrder4.png'),
                buildVSpacer(1.h),

                Divider(
                  color: black,
                  thickness: 1,
                ),
                buildVSpacer(1.h),

                _buildText(
                  title: "Need Help ??",
                  size: 10.px,
                  fontWeight: FontWeight.w700,
                ),
                buildVSpacer(1.h),

                Divider(
                  color: black,
                  thickness: 1,
                ),
                buildVSpacer(2.h),
                Image.asset('assets/trackOrder5.png'),
                buildVSpacer(3.h),
              ],
            ),
          ),
          Positioned(
            top: -18,
            left: Adaptive.w(5),
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
                        "Wish ID: 4545454454",
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
            top: Adaptive.h(42),
            left: Adaptive.w(8),
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
                        "Wish OD ID : 400001",
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
        ],
      ),
    );
  }

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      TextAlign? align,
      Color? color}) {
    return Text(
      title,
       textAlign:align??TextAlign.start,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
