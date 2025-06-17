import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_detils/product_order_details_screen.dart';
import 'package:jan_x/order_summary/buyer_contact_Details_Screen.dart';
import 'package:jan_x/order_summary/payment/order_success_message_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class paymentSuccessScreen extends StatefulWidget {
  const paymentSuccessScreen({super.key, required this.isFromCart});
  final bool isFromCart;
  @override
  State<paymentSuccessScreen> createState() => _paymentSuccessScreenState();
}

class _paymentSuccessScreenState extends State<paymentSuccessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (widget.isFromCart == false) {
          intFunction();
        }
      },
    );
  }

  intFunction() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OrderSuccessMessageScreen(),
        ));
  }

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildVSpacer(10.h),
          Center(
            child: SizedBox(
                width: 278.px,
                height: 278.px,
                child: Lottie.asset("assets/Animation - 1723812954253.json")),
          ),
          widget.isFromCart == false
              ? Text(
                  "Payment has Succesfully\nCompleted",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w900,
                      fontSize: 20.px,
                      color: white),
                )
              : Text(
                  "Payment has Succesfully\nCompleted\nOD-ID : 67001",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w900,
                      fontSize: 20.px,
                      color: white),
                ),
          buildVSpacer(5.h),
          widget.isFromCart == true
              ? Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
                      child: CustomButton(
                        text: "Buyer Contact No : 67001",
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const BuyerContactDetailsScreen(),));
                        },
                        size: 16.px,
                        weight: FontWeight.w700,
                      ),
                    ),
                    buildVSpacer(3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
                      child: CustomButton(
                        text: "Back",
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ProductOrderDetailsScreen(),
                            ),
                          );
                        },
                        size: 16.px,
                        weight: FontWeight.w700,
                      ),
                    )
                  ],
                )
              : const SizedBox(),
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
      textAlign: align ?? TextAlign.start,
      style: GoogleFonts.poppins(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
