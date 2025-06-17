import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_summary/order_summary_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraSubscriptionScreen extends StatelessWidget {
  const MitraSubscriptionScreen({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.h(2)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(18.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                color: white,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: Adaptive.w(2.5),
                        backgroundColor: Color(0xffBDBCB8),
                        child: Center(
                          child: CircleAvatar(
                            radius: Adaptive.w(2),
                            backgroundColor: buttonColor,
                          ),
                        ),
                      ),
                      buildHSpacer(2.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: _buildText(
                                title: "Mitra Registration Fee",
                                size: 12.px,
                                fontWeight: FontWeight.w500,
                              )),
                          _buildText(
                              title: "₹ 399",
                              fontWeight: FontWeight.w800,
                              size: 27.px),
                          CustomButton(
                            text: "6 Months membership",
                            onPressed: () {},
                            size: 12.px,
                            width: Adaptive.w(70),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            buildVSpacer(4.h),
            Container(
              padding: EdgeInsets.all(18.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                color: white,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: Adaptive.w(2.5),
                        backgroundColor: Colors.grey.shade700,
                        child: Center(
                          child: CircleAvatar(
                            radius: Adaptive.w(2),
                            backgroundColor: Color(0xffBDBCB8),
                          ),
                        ),
                      ),
                      buildHSpacer(2.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: _buildText(
                                title: "Mitra Registration Fee",
                                size: 12.px,
                                fontWeight: FontWeight.w500,
                              )),
                          _buildText(
                              title: "₹ 999",
                              fontWeight: FontWeight.w800,
                              size: 27.px),
                          CustomButton(
                            text: "9 Months membership",
                            onPressed: () {},
                            size: 12.px,
                            width: Adaptive.w(70),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            buildVSpacer(4.h),
            Container(
              padding: EdgeInsets.all(18.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                color: white,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: Adaptive.w(2.5),
                        backgroundColor: Colors.grey.shade700,
                        child: Center(
                          child: CircleAvatar(
                            radius: Adaptive.w(2),
                            backgroundColor: Color(0xffBDBCB8),
                          ),
                        ),
                      ),
                      buildHSpacer(2.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: _buildText(
                                title: "Mitra Registration Fee",
                                size: 12.px,
                                fontWeight: FontWeight.w500,
                              )),
                          _buildText(
                              title: "₹ 1499",
                              fontWeight: FontWeight.w800,
                              size: 27.px),
                          CustomButton(
                            text: "12 Months membership",
                            onPressed: () {},
                            size: 12.px,
                            width: Adaptive.w(70),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.h(2)),
        child: CustomButton(
            text: "Add To Cart",
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderSummaryScreen(),
                  ));
            },
            size: 17.px,
            weight: FontWeight.w600),
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
      //  textAlign: TextAlign.start,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
