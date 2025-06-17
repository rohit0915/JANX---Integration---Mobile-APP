import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_summary/payment/payment_screen.dart';
import 'package:jan_x/profile/profile_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderSummaryFromMyOrdersScreen extends StatelessWidget {
  const OrderSummaryFromMyOrdersScreen(
      {super.key, this.isOrderDetails = false,this.isFromWish=false});
      final bool isFromWish;
  final bool isOrderDetails;
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
          ),
        ),
        title: _buildText(
          title: "Order Summary",
          color: white,
          size: 22.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.h(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Image.asset('assets/order_summery.png')),
              buildVSpacer(2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        flex: 1,
                        child: _buildText(
                            title: "Address",
                            color: white,
                            size: 12.px,
                            fontWeight: FontWeight.w500)),
                    Expanded(
                        flex: 1,
                        child: _buildText(
                            title: "Order Summary",
                            color: buttonColor,
                            size: 12.px,
                            align: TextAlign.center,
                            fontWeight: FontWeight.w500)),
                    Expanded(
                        flex: 1,
                        child: _buildText(
                            title: "Payment",
                            color: white,
                            size: 12.px,
                            align: TextAlign.end,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              buildVSpacer(2.h),
              const Divider(
                color: white,
                height: 0,
              ),
              buildVSpacer(2.h),
              Container(
                padding: EdgeInsets.all(12.sp),
                decoration: const BoxDecoration(color: buttonColor),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildText(
                            title: "Deliver  to:",
                            size: 12.px,
                            fontWeight: FontWeight.w800),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileScreen(),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(14.sp),
                            decoration: const BoxDecoration(
                              color: white,
                            ),
                            child: Center(
                              child: _buildText(
                                  title: "Change",
                                  size: 12.px,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                    buildVSpacer(1.h),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildText(
                            title: "Suraj Singh",
                            size: 12.px,
                            fontWeight: FontWeight.w800),
                        buildHSpacer(5.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.sp, vertical: 8.sp),
                          decoration: const BoxDecoration(
                            color: white,
                          ),
                          child: Center(
                            child: _buildText(
                                title: "Home",
                                size: 12.px,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    buildVSpacer(2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          // align: TextAlign.left,
                          title:
                              "Mg-Road , Street No: 6 , 9th Cross,\nBeside Canara Bank ,\nBengaluru , Kanataka.\n8899077889.",
                          size: 12.px,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              buildVSpacer(4.h),
              itemMethod(),
              buildVSpacer(2.h),
              isOrderDetails == false
                  ? Column(
                      children: [
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
                              priceMethod(
                                  title1: "tax (5%)", title2: "₹ 2,000"),
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
                              Divider(
                                thickness: 1,
                                color: grey.withOpacity(0.1),
                              ),
                              priceMethod(
                                  title1: "Net Amount", title2: "₹ 60,000"),
                              buildVSpacer(2.h)
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _buildText(
                              title: "Inspection Details",
                              size: 12.px,
                              fontWeight: FontWeight.w800,
                              color: buttonColor,
                              align: TextAlign.left),
                        ),
                        buildVSpacer(2.h),
                        Container(
                            padding: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.sp),
                                color: white),
                            child: Column(children: [
                              priceMethod(
                                  title1: "Date", title2: "10-Oct-2023"),
                              Divider(
                                thickness: 1,
                                color: grey.withOpacity(0.1),
                              ),
                              // buildVSpacer(1.h),
                              priceMethod(
                                  title1: "Time", title2: "02:00 PM-05:00 PM"),
                              // buildVSpacer(1.h),
                              Divider(
                                thickness: 1,
                                color: grey.withOpacity(0.1),
                              ),
                              priceMethod(
                                  title1: "Inspector",
                                  title2: "Shashank singh"),
                              Divider(
                                thickness: 1,
                                color: grey.withOpacity(0.1),
                              )
                            ])),
                        buildVSpacer(4.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _buildText(
                              title: "Price Details",
                              size: 12.px,
                              color: buttonColor,
                              fontWeight: FontWeight.w800,
                              align: TextAlign.left),
                        ),
                        buildVSpacer(2.h),
                        Container(
                            padding: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.sp),
                                color: white),
                            child: Column(children: [
                              priceMethod(
                                  title1: "Price ( 1 Item )",
                                  title2: "₹ 100/-"),
                              Divider(
                                thickness: 1,
                                color: grey.withOpacity(0.1),
                              ),
                              // buildVSpacer(1.h),
                              priceMethod(title1: "Discount", title2: "₹ 0/-"),
                              // buildVSpacer(1.h),
                              Divider(
                                thickness: 1,
                                color: grey.withOpacity(0.1),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.sp),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    _buildText(
                                        title: "Delivery Charges",
                                        size: 12.px,
                                        fontWeight: FontWeight.w600),
                                    // Spacer(),
                                    const Spacer(),
                                    _buildText(
                                        title: "₹ 0/",
                                        size: 12.px,
                                        fontWeight: FontWeight.w600),
                                    buildHSpacer(2.w),
                                    _buildText(
                                        title: "Free Delivery",
                                        size: 12.px,
                                        color: buttonColor,
                                        fontWeight: FontWeight.w600),
                                    // buildHSpacer(3.w),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                                color: black,
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildText(
                                        title: "Total Amount",
                                        size: 13.px,
                                        fontWeight: FontWeight.w900),
                                    // Spacer(),
                                    // Spacer(),
                                    _buildText(
                                        title: "₹ 100/-",
                                        size: 13.px,
                                        fontWeight: FontWeight.w900),
                                    //  buildHSpacer(2.w),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                                color: black,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "You Will Save ",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12.px,
                                          color: buttonColor)),
                                  TextSpan(
                                    text: " ₹ 0/-  ",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.px,
                                        color: black),
                                  ),
                                  TextSpan(
                                      text: "On these Order",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12.px,
                                          color: buttonColor)),
                                ])),
                              )
                            ])),
                      ],
                    ),
              buildVSpacer(14.h),
              CustomButton(
                text: "Continue",
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(
                            isFromOtherOrder: true,
                            isFromInspection: isOrderDetails,
                            isFromWish: isFromWish,
                            ),
                      ));
                },
                color: buttonColor,
                size: 18.px,
                weight: FontWeight.w700,
              )
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
              fontWeight: weight ?? FontWeight.w600),
          _buildText(
              title: title2,
              size: 12.px,
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

  Widget itemMethod() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => const ProductOrderDetailsScreen(),
            //   ),
            // );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
              child: Column(
                children: [
                  buildVSpacer(20),
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
                      ),
                      const Spacer(),
                      // CircleAvatar(
                      //   radius: Adaptive.w(5),
                      //   backgroundColor: const Color(0xffD9D9D9),
                      //   child: const Center(
                      //     child: Icon(
                      //       Icons.favorite,
                      //       color: Colors.red,
                      //     ),
                      //   ),
                      // )
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
                      child: _buildText(
                          title:
                              "Description : Turmeric, a plant in the ginger family, is native to South east Asia and is grown commercially in that region.",
                          size: 11.px),
                    ),
                  ),
                  buildVSpacer(20),
                ],
              ),
            ),
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
      ],
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
      textAlign: align ?? TextAlign.start,
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
