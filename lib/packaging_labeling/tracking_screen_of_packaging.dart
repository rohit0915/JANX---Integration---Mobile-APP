import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrackingAndPackagingScreen extends StatelessWidget {
  const TrackingAndPackagingScreen({super.key, });
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
            title: "Tracking",
            color: white,
            size: 22.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset('assets/track_package.png'),
              // : Image.asset('assets/trackinginspection.png'),
          buildVSpacer(10.h),
         Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    text: "Back",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: buttonColor,
                    size: 13.px,
                  ),
                ),
             
          buildVSpacer(3.h),
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
      textAlign: align ?? TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
