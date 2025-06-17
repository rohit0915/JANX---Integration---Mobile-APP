import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/mitra_registraction/mitra_kyc/mitra_kyc_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraREgistractionScreen extends StatelessWidget {
  const MitraREgistractionScreen({super.key});

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
          title: "Mitra Registration",
          color: buttonColor,
          size: 18.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
        child: Column(
          children: [
            buildVSpacer(12.h),
            Center(
              child: Container(
                height: Adaptive.h(50),
                width: Adaptive.w(75),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildText(
                        title: "Please Complete\nYour KYC",
                        size: 24.px,
                        fontWeight: FontWeight.w800),
                    buildVSpacer(3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Adaptive.w(6)),
                      child: CustomButton(
                          text: "Click here",
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MitraKycScreen(),
                                ));
                          }),
                    )
                  ],
                ),
              ),
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
