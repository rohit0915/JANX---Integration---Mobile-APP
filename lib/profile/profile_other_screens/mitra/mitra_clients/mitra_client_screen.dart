import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/widgets/mitra_review_widgets.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraClientScreen extends StatelessWidget {
  const MitraClientScreen({super.key});

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
            title: "Mitra",
            color: white,
            size: 26.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Adaptive.w(100),
                padding: EdgeInsets.all(14.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.sp),
                    color: buttonColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildText(title: "Mitra Name  : Ramlal singh"),
                    buildVSpacer(2.h),
                    _buildText(title: "Mitra ID  : 000023"),
                  ],
                ),
              ),
              buildVSpacer(2.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  // alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(14.sp),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(14.sp),
                  ),
                  child: IntrinsicWidth(
                    child: Center(
                      child: _buildText(
                          title: "Clients",
                          size: 12.px,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              buildVSpacer(2.h),
              clientMethods(title: "Sidhu Singh"),
               buildVSpacer(2.h),
              clientMethods(title: "Suraj"),
               buildVSpacer(2.h),
              clientMethods(title: "Ramu"),
               buildVSpacer(2.h),
              clientMethods(title: "Nihal"),
                 buildVSpacer(2.h),
              clientMethods(title: "Pruthvi"),
               buildVSpacer(2.h),
              clientMethods(title: "Ramlal"),
               buildVSpacer(2.h),
              clientMethods(title: "Phanraju"),
        
            ],
          ),
        ),
      ),
    );
  }

  Container clientMethods({required String title}) {
    return Container(
            height: Adaptive.h(9),
            width: Adaptive.w(100),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(14.sp),
            ),
            child: Row(
              children: [
                // Main content section
                SizedBox(
                  width: Adaptive.w(85),
                  child: Padding(
                    padding: EdgeInsets.all(14.sp),
                    child: Row(
                      children: [
                        // Image and text
                        Image.asset('assets/mitra_img3.png'),
                        buildHSpacer(3.w),
                        _buildText(
                          title: title,
                          size: 14.px,
                          fontWeight: FontWeight.w600,
                        ),
                        Spacer(), // Fills the space between the text and icons
                        // Icons section
                        Image.asset('assets/mitra_img1.png'),
                        buildHSpacer(3.w),
                        Image.asset('assets/mitra_img2.png'),
                        buildHSpacer(3.w),
                      ],
                    ),
                  ),
                ),
                // Arrow button section
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.sp),
                        bottomRight: Radius.circular(12.sp),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),
              ],
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
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
