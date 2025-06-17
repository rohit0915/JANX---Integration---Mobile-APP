import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UploadTutorialScreen extends StatelessWidget {
  const UploadTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: buttonColor, size: 18.sp)),
        title: _buildText(
            title: "Uploaded Videos",
            color: white,
            size: 22.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: Column(
          children: [
            buildVSpacer(3.h),
            Container(
              height: Adaptive.h(18),
              width: Adaptive.w(100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp), color: white),
              child: Center(
                child: Image.asset('assets/uploadvideo1.png'),
              ),
            ),
            buildVSpacer(4.h),
            Align(
              alignment: Alignment.centerLeft,
              child: _buildText2(
                title: "Header Name",
                size: 14.px,
                fontWeight: FontWeight.w400,
              ),
            ),
            buildVSpacer(1),
            Image.asset('assets/uploadvideo2.png'),
            buildVSpacer(2.h),
            Align(
              alignment: Alignment.centerLeft,
              child: _buildText2(
                title: "Description",
                size: 14.px,
                fontWeight: FontWeight.w400,
              ),
            ),
            buildVSpacer(1),
            Image.asset('assets/uploadvideo3.png'),
            buildVSpacer(2.h),
            Align(
              alignment: Alignment.centerLeft,
              child: _buildText2(
                title: "Additional Links ( or ) Data",
                size: 14.px,
                fontWeight: FontWeight.w400,
              ),
            ),
            buildVSpacer(1),
            Image.asset('assets/uploadvideo4.png'),
            buildVSpacer(5.h),
            CustomButton(
              text: "Upload",
              onPressed: () {
                Navigator.pop(context);
              },
              size: 12.px,
              weight: FontWeight.w700,
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
      textAlign: align ?? TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }

  Widget _buildText2(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? align}) {
    return Text(
      title,
      textAlign: align ?? TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          decoration: TextDecoration.underline,
          decorationColor: white,
          color: color ?? Colors.black),
    );
  }
}
