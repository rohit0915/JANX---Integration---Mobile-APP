import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/future_services/tutorial_videos/upload_tutorial_video_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TutorialVideoScreen extends StatelessWidget {
  const TutorialVideoScreen({super.key});

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
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UploadTutorialScreen(),
                    ));
              },
              child: Image.asset(
                'assets/video1.png',
              )),
          buildHSpacer(3.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildVSpacer(3.h),
            _buildText(
                title: "Farming Content",
                size: 14.px,
                fontWeight: FontWeight.w400,
                color: white),
            Image.asset('assets/video2.png'),
            buildVSpacer(3.h),
            _buildText(
                title: "Farming Content",
                size: 14.px,
                fontWeight: FontWeight.w400,
                color: white),
            Image.asset('assets/video3.png'),
            buildVSpacer(3.h),
            _buildText(
                title: "Farming Content",
                size: 14.px,
                fontWeight: FontWeight.w400,
                color: white),
            Image.asset('assets/video4.png'),
            buildVSpacer(4.h),
            CustomButton(
                text: "back", onPressed: () {}, color: buttonColor, size: 12.px)
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
}
