import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_summary/payment/payment_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

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
                        Container(
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
              buildVSpacer(2.h),
              Container(
                padding: EdgeInsets.all(13.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.sp),
                  color: white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Adaptive.w(40),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              _buildText(
                                title: "Mitra Registration",
                                size: 10.px,
                                fontWeight: FontWeight.w700,
                              ),
                              buildVSpacer(2.h),
                              Image.asset('assets/order_summary2.png')
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _buildText(
                                      title: "Location : Gujrath",
                                      size: 10.px,
                                      fontWeight: FontWeight.w500),
                                  const Icon(Icons.location_on)
                                ],
                              ),
                              buildVSpacer(1.h),
                              orderSummaryMethod(
                                  title: "Self/Company", title2: "Self"),
                              buildVSpacer(1.h),
                              orderSummaryMethod(
                                  title: "Industry", title2: "Agriculture"),
                              buildVSpacer(1.h),
                              orderSummaryMethod(
                                  title: "Mobile no", title2: "+91 123456789"),
                              buildVSpacer(1.h),
                              orderSummaryMethod(
                                  title: "Email", title2: "abc@gmail.com"),
                              buildVSpacer(1.h),
                              orderSummaryMethod(
                                  title: "KYC status", title2: "Complaint")
                            ],
                          ),
                        )
                      ],
                    ),
                    buildVSpacer(1.h),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Description :",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600, color: black)),
                      TextSpan(
                          text:
                              "Turmeric, a plant in the ginger family, is native to Southeast Asia and is grown commercially in that region.",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w400,
                              color: Colors.black26,
                              fontSize: 12.px))
                    ]))
                  ],
                ),
              ),
              buildVSpacer(2.h),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildText(
                    title: "Price Details",
                    size: 12.px,
                    // align: TextAlign.start,
                    fontWeight: FontWeight.w800,
                    color: buttonColor),
              ),
              buildVSpacer(2.h),
              Container(
                // padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp), color: white),
                child: Column(
                  children: [
                    priceMethod(title1: "Price ( 1 Item )", title2: "₹ 360/-"),
                    // buildVSpacer(1.h),
                    priceMethod(title1: "Discount", title2: "₹ 0/-"),
                    // buildVSpacer(1.h),
                    priceMethod(
                        title1: "Delivery Charges",
                        title2: "₹ 0/ Free Delivery"),
                    buildVSpacer(1.h),
                    const Divider(
                      color: black,
                      thickness: 1,
                    ),
                    priceMethod2(
                      title1: "Total Amount",
                      title2: "₹ 360/-",
                    ),
                    const Divider(
                      color: black,
                      thickness: 1,
                    ),
                    buildVSpacer(1.h),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            // textAlign: TextAlign.start,
                            text: TextSpan(children: [
                          TextSpan(
                              text: " You Will Save",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor)),
                          TextSpan(
                              text: " ₹ 0/- ",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              )),
                          TextSpan(
                              text: " On these Order",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor)),
                        ])),
                      ),
                    )
                  ],
                ),
              ),
              buildVSpacer(12.h),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Adaptive.w(3), vertical: Adaptive.h(2)),
                child: CustomButton(
                    text: "Continue",
                    onPressed: () {
                     
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentScreen(isFromOtherOrder: false),
                          ));
                    },
                    size: 17.px,
                    weight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
      //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Padding(
      //   padding: EdgeInsets.symmetric(
      //       horizontal: Adaptive.w(3), vertical: Adaptive.h(2)),
      //   child: CustomButton(
      //       text: "Continue",
      //       onPressed: () {
      //         Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => OrderSummaryScreen(),
      //             ));
      //       },
      //       size: 17.px,
      //       weight: FontWeight.w600),
      // ),
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
          _buildText(title: title1, size: 13.px, fontWeight: FontWeight.w800),
          _buildText(title: title2, size: 13.px, fontWeight: FontWeight.w800),
        ],
      ),
    );
  }

  Flex orderSummaryMethod({required String title, required String title2}) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 3,
          child: _buildText(
            title: title,
            size: 10.px,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          flex: 1,
          child: _buildText(
            title: ":",
            size: 10.px,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          flex: 3,
          child: _buildText(
            title: title2,
            size: 10.px,
            fontWeight: FontWeight.w500,
          ),
        )
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
}
