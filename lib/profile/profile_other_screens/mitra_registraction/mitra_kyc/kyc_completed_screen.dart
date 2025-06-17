import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/mitra_registraction/mitra_registraction/mitra_registraction_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraKycCompletedScreen extends StatelessWidget {
  const MitraKycCompletedScreen({super.key});

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
          color: white,
          size: 24.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildVSpacer(8.h),
          Center(
            child: Container(
              height: Adaptive.h(50),
              width: Adaptive.w(75),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildText(
                      title: "Your KYC is\nSuccessfully completed",
                      size: 24.px,
                      fontWeight: FontWeight.w800)
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(5), vertical: Adaptive.h(3)),
        child: CustomButton(
          text: "Next",
          onPressed: () {
             Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MitraRegistractionScreen(),
            ));
          },
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
