import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff444444),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 18.sp,
              color: const Color(0xffF4BC1C),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xff444444),
            image: DecorationImage(
              image: AssetImage("assets/splash3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildText(
                    title: "Jan-X",
                    size: 40,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffF4BC1C)),
                buildVSpacer(20),
                _buildText(
                  title: "Mitra Password Re-set",
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  size: 26.px,
                ),
                buildVSpacer(30),
                buildCustomTextField(
                  hintText: "000023",
                  size: 12.px,
                  suffixIcon: const Icon(Icons.person),                  vMargin: 5

                ),
                buildVSpacer(2.h),
                buildCustomTextField(
                  hintText: "Enter Your New Password",
                  size: 12.px,
                  suffixIcon: Image.asset('assets/reset1.png'),                  vMargin: 5

                ),                buildVSpacer(2.h),

                buildCustomTextField(
                  hintText: "Re-enter Your New Password",
                  size: 12.px,
                  suffixIcon: const Icon(Icons.person),
                  vMargin: 5
                ),                buildVSpacer(2.h),

                buildCustomTextField(
                  hintText: "Enter your Date of Birth",
                  size: 12.px,
                  suffixIcon: Image.asset('assets/reset2.png'),                  vMargin: 5

                ),                buildVSpacer(2.h),

                buildVSpacer(2.h),
                CustomButton3(text: "Save", onPressed: (){
                  Navigator.pop(context);
                },
                color: buttonColor,
                size: 12.px,
                width: Adaptive.w(35),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: Text(
        title,
        style: GoogleFonts.lato(
            fontSize: size ?? 14,
            fontWeight: fontWeight ??
                FontWeight
                    .w400, // Use the provided fontWeight or default to FontWeight.w500
            // fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    );
  }
}
