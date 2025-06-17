import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/kyc/kyc_other_screens/aadhar_card_details/aadhar_card_otp_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AadharCardDetailsScreen extends StatelessWidget {
  const AadharCardDetailsScreen({super.key});

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
              color: buttonColor,
              size: 17.sp,
            )),
        title: _buildText(
            title: "Aadhar Card Details",
            color: buttonColor,
            size: 18.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: Column(
          children: [
            buildVSpacer(2.h),
            Center(
              child: IntrinsicWidth(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Adaptive.w(7),
                    vertical: Adaptive.h(5),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.sp),
                      color: buttonColor),
                  child: Image.asset('assets/Icon.png'),
                ),
              ),
            ),
            buildVSpacer(3.h),
            _buildText(
                title: "Enter your Aadhar Card number",
                size: 17.px,
                fontWeight: FontWeight.w600,
                color: buttonColor),
            buildVSpacer(3.h),
            Container(
              height: Adaptive.h(7),
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(14.sp)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildText(
                    title: "Aadhar Card Number",
                    color: const Color(0xff444444),
                  ),
                  const Spacer(),
                  Image.asset('assets/kycTile1.png', scale: 0.9)
                ],
              ),
            ),
            buildVSpacer(18.h),
            _buildText(
                title:
                    "Note : OTP has been Sent to Your\nRegstered Mobile Number",
                size: 14.px,
                color: white,
                fontWeight: FontWeight.w600),
            buildVSpacer(6.h),
            CustomButton(
              text: "Next",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpAadharCardScreen(),
                    ));
              },
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
      Color? color}) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
