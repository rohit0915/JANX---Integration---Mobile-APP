import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/kyc/kyc_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/utilz/common_functions.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OtpAadharCardScreen extends StatelessWidget {
  const OtpAadharCardScreen({super.key});

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
          ),
        ),
        title: _buildText(
          title: "Aadhar Card Details",
          color: buttonColor,
          size: 18.px,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildVSpacer(16.h),
            Center(
              child: Text(
                "Enter the code",
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w800,
                    fontSize: 24.px,
                    color: buttonColor),
              ),
            ),
            buildVSpacer(2.h),
            buildText(
                title:
                    "Enter the 4 digit code that we just sent to \n670******909",
                color: buttonColor,
                size: 12.px,
                fontWeight: FontWeight.w400,
                align: false),
            buildVSpacer(4.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OTPTextField(
                  otpFieldStyle: OtpFieldStyle(
                    backgroundColor: const Color(0xFFDDDDDD),
                  ),
                  // controller: otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 40,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 8,
                  style: const TextStyle(fontSize: 17),
                  onChanged: (pin) {
                    // otps = pin;
                    // print("Changed: " + otps);
                  },
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  }),
            ),
            buildVSpacer(9.h),
            CustomButton(
              text: "Verify OTP",
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KycScreen(),
                    ),
                   );
              },
              color: buttonColor,
              size: 15.px,
              textColor: black,
              weight: FontWeight.w600,
            ),
            buildVSpacer(8.h),
            CustomButton3(
              text: "Resend",
              onPressed: () {},
              color: Colors.transparent,
              borderColor: buttonColor,
              textColor: buttonColor,
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
