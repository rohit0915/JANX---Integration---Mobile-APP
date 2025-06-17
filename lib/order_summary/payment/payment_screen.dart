import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_summary/payment/payment_success_from_inspection.dart';
import 'package:jan_x/order_summary/payment/payment_success_screen.dart';
import 'package:jan_x/order_summary/payment/payment_success_wishkaro.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen(
      {super.key,
      required this.isFromOtherOrder,
      this.isFromInspection = false,
      this.isFromDrop = false,
      this.isFromWish = false});
  final bool isFromOtherOrder;
  final bool isFromWish;
  final bool isFromInspection;
  final bool isFromDrop;
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
          title: "Payment",
          color: white,
          size: 22.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Column(
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
                        color: white,
                        size: 12.px,
                        align: TextAlign.center,
                        fontWeight: FontWeight.w500)),
                Expanded(
                    flex: 1,
                    child: _buildText(
                        title: "Payment",
                        color: buttonColor,
                        size: 12.px,
                        align: TextAlign.end,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          buildVSpacer(2.h),
          const Divider(
            height: 0,
            color: white,
          ),
          buildVSpacer(4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildText(
                        title: "Amount to be paid",
                        color: white,
                        size: 16.px,
                        fontWeight: FontWeight.w500),
                    _buildText(
                        title: "₹ 1",
                        size: 14.px,
                        fontWeight: FontWeight.w500,
                        color: white)
                  ],
                ),
                buildVSpacer(3.h),
                const Divider(
                  height: 0,
                  color: white,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: _buildText(
                        color: white,
                        title: "Suggested for you",
                        size: 16.px,
                        fontWeight: FontWeight.w500)),
                buildVSpacer(2.h),
                ListTile(
                  leading: CircleAvatar(
                    radius: Adaptive.w(3),
                    backgroundColor: const Color(0xff2370B5),
                    child: Center(
                      child: CircleAvatar(
                        radius: Adaptive.w(2.5),
                        backgroundColor: backgroundColor,
                        child: Center(
                          child: CircleAvatar(
                            radius: Adaptive.w(1.5),
                            backgroundColor: const Color(0xff2370B5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: _buildText(
                      title: "Kotak Mahindra Bank UPI",
                      size: 14.px,
                      fontWeight: FontWeight.w400,
                      color: white),
                  subtitle: _buildText(
                      title: "Account No.  xxxx xxxx 6746",
                      size: 12.px,
                      fontWeight: FontWeight.w400,
                      color: white),
                  trailing: SizedBox(
                      width: Adaptive.w(15),
                      child: Image.asset(
                        'assets/payment1.png',
                        fit: BoxFit.cover,
                      )),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: Adaptive.w(3),
                    backgroundColor: white,
                    child: Center(
                      child: CircleAvatar(
                        radius: Adaptive.w(2.5),
                        backgroundColor: backgroundColor,
                        child: Center(
                          child: CircleAvatar(
                            radius: Adaptive.w(1.5),
                            backgroundColor: white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: _buildText(
                      title: "Google Pay UPI",
                      size: 14.px,
                      fontWeight: FontWeight.w400,
                      color: white),
                  subtitle: _buildText(
                      title: "tejasaher67@gmail.com",
                      size: 12.px,
                      fontWeight: FontWeight.w400,
                      color: white),
                  trailing: SizedBox(
                      width: Adaptive.w(15),
                      child: Image.asset(
                        'assets/payment2.png',
                        fit: BoxFit.cover,
                      )),
                ),
                buildVSpacer(3.h),
                const Divider(
                  height: 0,
                  color: white,
                ),
                buildVSpacer(2.h),
                Align(
                    alignment: Alignment.centerLeft,
                    child: _buildText(
                        color: white,
                        title: "All other option",
                        size: 16.px,
                        fontWeight: FontWeight.w500)),
                buildVSpacer(2.h),
                paymentMethods(image: "3", title: "UPI"),
                paymentMethods(image: "4", title: "Wallets"),
                paymentMethods(image: "5", title: "Credit/ Debit/ ATM Card")
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.h(2)),
        child: CustomButton(
            text: "Payment",
            onPressed: () {
              if (isFromInspection == false) {
                log("case1 working");
                log("isfromcart:$isFromOtherOrder");
                if (isFromWish) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const paymentSuccessScreenWishkaro(),
                      ));
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            paymentSuccessScreen(isFromCart: isFromOtherOrder),
                      ));
                }
              } else {
                if (isFromDrop == false) {
                  log("case2 working");

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const paymentSuccessInspectionScreen(
                          isFromDrop: false,
                        ),
                      ));
                } else {
                  log("case3 working");

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const paymentSuccessInspectionScreen(
                          isFromDrop: true,
                        ),
                      ));
                }
              }
            },
            size: 17.px,
            weight: FontWeight.w600),
      ),
    );
  }

  ListTile paymentMethods({required String title, required String image}) {
    return ListTile(
      leading: CircleAvatar(
        radius: Adaptive.w(3),
        backgroundColor: white,
        child: Center(
          child: CircleAvatar(
            radius: Adaptive.w(2.6),
            backgroundColor: backgroundColor,
          ),
        ),
      ),
      title: _buildText(
          title: title, size: 16.px, fontWeight: FontWeight.w400, color: white),
      trailing: Image.asset('assets/payment$image.png'),
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
