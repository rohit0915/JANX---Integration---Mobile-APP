import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/widgets/mitra_review_widgets.dart';
import 'package:jan_x/profile/profile_other_screens/mitra_details/mitra_details_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraAddReviewScreen extends StatelessWidget {
  const MitraAddReviewScreen({super.key});

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
            title: "Review Request",
            color: white,
            size: 26.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildVSpacer(2.h),
            Row(
              children: [
                Container(
                  width: Adaptive.w(85),
                  height: Adaptive.h(5),
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.sp),
                    color: buttonColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Adaptive.w(6)),
                    child: Row(
                      children: [
                        _buildText(
                          title:
                              "Search with Ad-ID, Name ,Date ,Segment etc.........",
                          size: 10.px,
                        )
                      ],
                    ),
                  ),
                ),
                buildHSpacer(3.w),
                Image.asset('assets/mi_filter.png')
              ],
            ),
            buildVSpacer(3.h),
            const MitraReviewItemWidget(
              image: "pro",
              title: "Wheats",
              color: Color(0xff3985D7),
            ),
            buildVSpacer(3.h),
            const MitraReviewWidget2(),
            buildVSpacer(3.h),
            const MitraReviewItemWidget(
              image: "pro",
              title: "Wheat",
              color: Color(0xff3985D7),
            ),
            buildVSpacer(3.h),
            const MitraReviewWidget2()
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
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
