// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_summary/buyer_contact_details_screen.dart';
import 'package:jan_x/transport_facility/transport_facility_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookingConfirmationScreen extends StatelessWidget {
  BookingConfirmationScreen({super.key});

  SelectedTab? selectedTab = SelectedTab.booking;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildVSpacer(2.h),
              confirmationmethod(
                  title1: "Transport Booking ID", title2: "TR-ID : 67001"),
              buildVSpacer(4.h),
              Image.asset('assets/confirmationbooking.png'),
              buildVSpacer(2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  confirmationmethod(
                      title1: "Depature Date", title2: "15-04-2024"),
                  confirmationmethod(
                      title1: "Departure Timing", title2: "5:00PM , IST"),
                ],
              ),
              buildVSpacer(3.h),
              Container(
                padding: EdgeInsets.all(13.sp),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: _buildText(
                    title:
                        "Cab operator will be assigned as soon as booking is\ncomplete.\nYour cab and driver details will be shared via\nWhatsapp & SMS on your registered mobile number by"),
              ),
              buildVSpacer(2.h),
              confirmationmethod(
                  title1: "Booked For", title2: "Anurag Goutham"),
              buildVSpacer(2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  confirmationmethod(title1: "Trip Includes", title2: "45 KMs"),
                  confirmationmethod(
                      title1: "View Fair Inclusions",
                      title2: "Fare rules & Others"),
                ],
              ),
              buildVSpacer(2.h),
              confirmationmethod(title1: "You Paid", title2: "₹ 5000/-"),
              buildVSpacer(10.h),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
                    child: CustomButton(
                      text: "Transport Contact- TR-ID : 67001",
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const BuyerContactDetailsScreen(isFromFacilityComplete: true,
                                ),
                          ),
                        );
                      },
                      size: 15.px,
                      weight: FontWeight.w600,
                    ),
                  ),
                  buildVSpacer(3.h),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
                      child: CustomButton(
                        text: "Home",
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => TransportFacilityScreen(
                                    selectedTab: selectedTab)),
                          );
                        },
                        size: 15.px,
                        weight: FontWeight.w600,
                      ))
                ],
              ),
              buildVSpacer(6.h),
            ],
          ),
        ),
      ),
    );
  }

  Column confirmationmethod({required String title1, required String title2}) {
    return Column(
      children: [
        _buildText(
            title: title1,
            size: 12.px,
            fontWeight: FontWeight.w800,
            color: white),
        buildVSpacer(1.h),
        _buildText(
            title: title2,
            size: 12.px,
            fontWeight: FontWeight.w500,
            color: white),
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
