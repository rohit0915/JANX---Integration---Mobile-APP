import 'package:flutter/material.dart';
import 'package:jan_x/order_summary/payment/payment_facility_screen.dart';
import 'package:jan_x/transport_facility/bookings_transport/booking_transport_summary_screen.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingTransportReviewScreen extends StatefulWidget {
  const BookingTransportReviewScreen({super.key});

  @override
  State<BookingTransportReviewScreen> createState() =>
      _BookingTransportReviewScreenState();
}

bool value = false;

class _BookingTransportReviewScreenState
    extends State<BookingTransportReviewScreen> {
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
          title: "Book Transport",
          color: white,
          size: 18.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Adaptive.w(100),
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: buttonColor),
                child: Column(
                  children: [
                    _buildText(
                        title: "JABALPUR   To   DELHI",
                        size: 16.px,
                        fontWeight: FontWeight.w800),
                    buildVSpacer(2.h),
                    _buildText(
                        title: "Date : 05-04-24 , Timing : 5:PM",
                        size: 12.px,
                        fontWeight: FontWeight.w800),
                  ],
                ),
              ),
              buildVSpacer(2.h),
              Container(
                width: Adaptive.w(100),
                height: Adaptive.h(11),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildText(
                              title: "LCV Open (2.5-7 )Tons\nMINI TRUCK",
                              size: 12.px,
                              fontWeight: FontWeight.w600),
                          buildVSpacer(1.h),
                          _buildText(
                              title: "₹ 900",
                              size: 16.px,
                              fontWeight: FontWeight.w800),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              buildVSpacer(2.h),
              bookTransportMethod(),
              buildVSpacer(2.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: _buildText(
                      title: "PickUp Point",
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
                padding: EdgeInsets.all(12.sp),
                decoration: const BoxDecoration(color: buttonColor),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildText(
                            title: "Booked By :",
                            size: 12.px,
                            fontWeight: FontWeight.w800),
                        Container(
                          padding: EdgeInsets.all(14.sp),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10.sp)),
                          child: Center(
                            child: _buildText(
                                title: "Edit",
                                size: 12.px,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    buildVSpacer(1.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          title: "Suraj Singh",
                          size: 12.px,
                          fontWeight: FontWeight.w500),
                    ),
                    // buildHSpacer(5.w),
                    buildVSpacer(1.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          title: "+91 1234567890",
                          size: 12.px,
                          fontWeight: FontWeight.w500),
                    ),
                    buildVSpacer(1.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          title: "Ramlal@gmail.com",
                          size: 12.px,
                          fontWeight: FontWeight.w500),
                    ),
                    buildVSpacer(1.h),

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
              Column(
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
                        priceMethod(title1: "Net Amount", title2: "₹ 60,000"),
                        buildVSpacer(2.h)
                      ],
                    ),
                  ),
                ],
              ),
              buildVSpacer(2.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: value,
                            onChanged: (bool? newValue) {
                              setState(() {
                                value = newValue ??
                                    false; // Update the value of the checkbox
                              });
                            },
                            activeColor: const Color(0xffF4BC1C),
                          ),
                          Text(
                            "Mitra Verification",
                            style: GoogleFonts.poppins(
                                color: const Color(0xffF4BC1C)),
                          ),
                          buildHSpacer(30),
                          Text(
                            "Ad Posted Location",
                            style: GoogleFonts.poppins(
                                color: const Color(0xffF4BC1C), fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (bool? newValue) {
                              setState(() {
                                value = newValue ??
                                    false; // Update the value of the checkbox
                              });
                            },
                            activeColor: const Color(0xffF4BC1C),
                          ),
                          Text(
                            "Terms & Conditions",
                            style: GoogleFonts.poppins(
                                color: const Color(0xffF4BC1C)),
                          ), // Optional: Add a label next to the checkbox
                          buildHSpacer(50),
                          const Icon(
                            Icons.location_on,
                            color: Color(0xffF4BC1C),
                            size: 40,
                          )
                        ],
                      ),
                    ],
                  ),
                  // Spacer(),
                  // Image.asset("assets/locate.png")
                ],
              ),
              buildVSpacer(8.h),
              CustomButton(
                text: "Next",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentFacilityScreen(),
                      ));
                },
                color: buttonColor,
              ),
              buildVSpacer(8.h),
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

  Container bookTransportMethod() {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(12.sp)),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp), color: white),
        child: Row(
          children: [
            Column(
              children: [
                Image.asset('assets/transport1.png'),
                // buildVSpacer(1.h),
                _buildText(
                    title: "View Profile",
                    size: 12.px,
                    fontWeight: FontWeight.w500,
                    color: buttonColor),
              ],
            ),
            buildHSpacer(1.5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText(
                  title: "New Mp Andhra Road Stars....",
                  size: 14.px,
                  fontWeight: FontWeight.w800,
                ),
                buildVSpacer(1.h),
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
                      onPressed: () {},
                      color: white,
                      borderColor: black,
                      height: Adaptive.h(4),
                      width: Adaptive.w(27),
                      size: 12.px,
                    ),
                    buildHSpacer(3.w),
                    CustomButton3(
                      text: "Call",
                      onPressed: () {},
                      color: black,
                      textColor: white,
                      borderColor: black,
                      height: Adaptive.h(4),
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
      style: GoogleFonts.poppins(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
