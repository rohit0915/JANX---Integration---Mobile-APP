import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_detils/product_order_details_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: buttonColor, size: 18.sp)),
        title: _buildText(
            title: "My Orders",
            color: white,
            size: 26.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
        actions: [Image.asset('assets/order1.png'),
        buildHSpacer(3.w)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(2), vertical: Adaptive.h(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(
                color: buttonColor,
                thickness: 1,
              ),
              buildVSpacer(2.h),
              Row(
                children: [
                  Container(
                    width: Adaptive.w(80),
                    height: Adaptive.h(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.sp),
                        color: buttonColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          buildHSpacer(5.w),
                          _buildText(
                              title: "Search Your Order Here",
                              size: 10.px,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Image.asset('assets/order_filt.png'),
                  buildHSpacer(Adaptive.w(2)),
                ],
              ),
              buildVSpacer(2.h),
              Divider(
                color: buttonColor,
                thickness: 1,
              ),
              buildVSpacer(2.h),
              _myOrders(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _myOrders(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          trackOrderMethod(context),
          buildVSpacer(3.h),
          Image.asset('assets/wishkaroorders.png'),
          buildVSpacer(2.h),

          _buildText(
              title: "Note : Not able to cancel order after 24 hrs",
              size: 16.px,
              color: white),
          buildVSpacer(3.h),
          Center(
              child: _buildText(
                  title: "Time Remaining :", size: 12.px, color: white)),
          // buildVSpacer(1.h),
          Center(
              child: _buildText(
            title: "23:42 hrs",
            size: 24.px,
            fontWeight: FontWeight.w700,
            color: white,
          )),
          buildVSpacer(7.h),
          _buildText(
              title: "NO MORE ORDERS",
              size: 14.px,
              fontWeight: FontWeight.w700,
              color: white),
          buildVSpacer(12.h),
        ],
      ),
    );
  }

  Padding trackOrderMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
             Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProductOrderDetailsScreen(),
                ),
              );
            },
            child: Container(
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
                                _buildText1(
                                    title: "Electronic,Washing Machine",
                                    size: 18),
                                _buildText1(title: "Brand :  LG", size: 11),
                                _buildText1(
                                    title: "Location : Jabalpur", size: 11),
                                _buildText1(
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
                              _buildText1(title: "Quantity (approx.)"),
                              const Spacer(),
                              _buildText1(title: "01 Pc"),
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
                                  color: Color(0xffF4BC1C),
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
                                                    BorderRadius.circular(
                                                        18.sp),
                                                color: white),
                                            height: Adaptive.h(3),
                                            padding: EdgeInsets.all(2),
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
                                                  child: Icon(
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
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  buildVSpacer(2.h),
                                  buildVSpacer(3.h)
                                ],
                              ),
                            ),
                          ],
                        ),
                        buildVSpacer(5.h),
                        IntrinsicWidth(
                          child: CustomButton(
                            text: "Track Order",
                            onPressed: () {},
                            color: buttonColor,
                            size: 12.px,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
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
            bottom: Adaptive.h(32),
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
      Color? color}) {
    return Text(
      title,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }

  Widget _buildText1(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
              fontSize: size ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
              fontFamily: 'Poppins',
              color: color ?? Colors.black),
        ),
      ),
    );
  }
}
