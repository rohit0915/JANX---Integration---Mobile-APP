import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/post_sell_ad/call_screen/call_screen.dart';
import 'package:jan_x/post_sell_ad/chat_screen/chat_screen.dart';
import 'package:jan_x/post_sell_ad/view_details/view_details_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraProductTypeDetails extends StatelessWidget {
  const MitraProductTypeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: buttonColor, size: 18.sp)),
        title: _buildText(
            title: "Upcoming",
            color: white,
            size: 22.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              activeTransationWidget3(),
              buildVSpacer(2.h),
              Container(
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp), color: white),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/product_type3.png'),
                        // buildVSpacer(1.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ViewDetailsScreen(),
                                ));
                          },
                          child: _buildText(
                              title: "View Profile",
                              size: 12.px,
                              fontWeight: FontWeight.w500,
                              color: buttonColor),
                        ),
                      ],
                    ),
                    buildHSpacer(2.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildText(
                          title: "New Mp Andhra Road Stars......",
                          size: 14.px,
                          fontWeight: FontWeight.w800,
                        ),
                        buildVSpacer(2.h),
                        _buildText(
                          title: "Anuraj Gautham",
                          size: 12.px,
                          fontWeight: FontWeight.w500,
                        ),
                        buildVSpacer(2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton3(
                              text: "Chat",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ChatScreen(),
                                    ));
                              },
                              color: white,
                              borderColor: black,
                              height: Adaptive.h(5),
                              width: Adaptive.w(27),
                              size: 12.px,
                            ),
                            buildHSpacer(3.w),
                            CustomButton3(
                              text: "Call",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CallScreen(),
                                    ));
                              },
                              color: black,
                              textColor: white,
                              borderColor: black,
                              height: Adaptive.h(5),
                              width: Adaptive.w(27),
                              size: 12.px,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              buildVSpacer(3.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: _buildText(
                      title: "Drop Point",
                      size: 14.px,
                      fontWeight: FontWeight.w800,
                      color: white)),
              buildVSpacer(1.h),
              Container(
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(13.sp)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildText(
                          title: "Seller Details",
                          size: 14.px,
                          fontWeight: FontWeight.w800,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.location_on,
                          color: buttonColor,
                        ),
                        buildHSpacer(2.w),
                        _buildText(
                            title: "Google Map",
                            color: buttonColor,
                            size: 11.px,
                            fontWeight: FontWeight.w700)
                      ],
                    ),
                    buildVSpacer(1.h),
                    _buildText(
                        title: "Suraj Singh",
                        size: 11.px,
                        fontWeight: FontWeight.w600),
                    buildVSpacer(1.h),
                    _buildText(
                        title: "+91 12345678890",
                        size: 11.px,
                        fontWeight: FontWeight.w600),
                    buildVSpacer(1.h),
                    _buildText(
                        title:
                            "D-61, Block D, Mansa Ram park, Uttam nagar, New\nDelhi 110059",
                        size: 11.px,
                        fontWeight: FontWeight.w600,
                        align: TextAlign.start)
                  ],
                ),
              ),
              buildVSpacer(2.h),
              Container(
                width: Adaptive.w(100),
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(13.sp)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildText(
                      title: "Booked By :",
                      size: 12.px,
                      fontWeight: FontWeight.w800,
                    ),
                    buildVSpacer(1.h),
                    _buildText(
                        title: "Ramlal Singh",
                        size: 12.px,
                        fontWeight: FontWeight.w600),
                    buildVSpacer(1.h),
                    _buildText(
                        title: "+91 12345678890",
                        size: 11.px,
                        fontWeight: FontWeight.w600),
                    buildVSpacer(1.h),
                    _buildText(
                        title: "Ramlal@gmail.com",
                        size: 11.px,
                        fontWeight: FontWeight.w600),
                    buildVSpacer(1.h),
                    _buildText(
                        title:
                            "Mg-Road , Street No: 6 , 9th Cross, Beside Canara\nBank ,Bengaluru , Kanataka. 8899077889.",
                        size: 11.px,
                        fontWeight: FontWeight.w600,
                        align: TextAlign.start)
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
                    align: TextAlign.left),
              ),
              buildVSpacer(2.h),
              Container(
                // padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp), color: white),
                child: Column(
                  children: [
                    buildVSpacer(1.h),
                    priceMethod(title1: "Price", title2: "₹ 10,000"),
                    Divider(
                      thickness: 1,
                      color: grey.withOpacity(0.1),
                    ),
                    // buildVSpacer(1.h),
                    priceMethod(title1: "Total Amount", title2: "₹ 60,000"),
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
                        title1: "Convenience Fee (2%)", title2: "₹ 1,200"),
                    Divider(
                      thickness: 1,
                      color: grey.withOpacity(0.1),
                    ),
                    priceMethod2(title1: "Others", title2: "₹ 1,200"),
                    Divider(
                      thickness: 1,
                      color: grey.withOpacity(0.1),
                    ),

                    buildVSpacer(2.h)
                  ],
                ),
              ),
              buildVSpacer(8.h),
              CustomButton(
                text: "Back",
                onPressed: () {
                  Navigator.pop(context);
                },
                color: buttonColor,
                size: 13.px,
              ),
              buildVSpacer(3.h),
            ],
          ),
        ),
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
              color: Colors.black54,
              fontWeight: weight ?? FontWeight.w600),
          _buildText(
              title: title2,
              size: 12.px,
              color: Colors.black54,
              fontWeight: weight ?? FontWeight.w600),
        ],
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
                title: title1,
                size: 13.px,
                fontWeight: FontWeight.w800,
                color: Colors.black54,
              ),
              buildHSpacer(3.w),
              Image.asset('assets/order exm.png')
            ],
          ),
          _buildText(
            title: title2,
            size: 13.px,
            fontWeight: FontWeight.w800,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }

  Widget activeTransationWidget3() {
    return Container(
      decoration: BoxDecoration(
          color: white, borderRadius: BorderRadius.circular(12.sp)),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildVSpacer(2.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildText(
                      title: "Order ID : 67001",
                      size: 12.px,
                      align: TextAlign.start,
                      fontWeight: FontWeight.w800),
                ),
                buildVSpacer(2.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildText(
                      title: "Date : 05-04-24 , Timing : 5:PM",
                      size: 12.px,
                      fontWeight: FontWeight.w800),
                ),
                buildVSpacer(2.h),
                _buildText(
                    title: "Jabalpur <--> Delhi",
                    size: 12.px,
                    fontWeight: FontWeight.w800),
                buildVSpacer(2.h),
                Container(
                  height: Adaptive.h(9),
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: const Color(0xffEEEEEE),
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/active_transation.png',
                        fit: BoxFit.cover,
                        scale: 1,
                      ),
                      _buildText(
                          title: "LCV Open (2.5-7 )Tons\nMINI TRUCK",
                          size: 12.px,
                          fontWeight: FontWeight.w600)
                    ],
                  ),
                ),
                buildVSpacer(3.h),
                Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: const BoxDecoration(
                    color: buttonColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildText(
                              title: "Vehicle No :",
                              size: 10.px,
                              fontWeight: FontWeight.w500),
                          _buildText(
                              title: "Driver : Rahul Tiwari",
                              size: 10.px,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                      buildVSpacer(1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildText(
                              title: "MP20BC1234",
                              size: 10.px,
                              fontWeight: FontWeight.w500),
                          _buildText(
                              title: "+91 1234567890",
                              size: 10.px,
                              fontWeight: FontWeight.w500)
                        ],
                      )
                    ],
                  ),
                )
              ],
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
      Color? color,
      TextAlign? align}) {
    return Text(
      title,
      textAlign: align ?? TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
