import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IncomeMitraWidgets extends StatelessWidget {
  const IncomeMitraWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => buildVSpacer(2.h),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: Adaptive.h(2)),
                      child: Container(
                        width: Adaptive.w(100),
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            border: Border.all(color: buttonColor,
                            width: 3
                            ),
                            borderRadius: BorderRadius.circular(14.sp),
                            color: white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildVSpacer(1.h),
                            Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: _buildText(
                                      title: "Advance payment for Turmeric",
                                      fontWeight: FontWeight.w800,
                                      align: TextAlign.start,
                                      size: 12.px),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: _buildText(
                                      title: "₹ 2500",
                                      size: 12.px,
                                      align: TextAlign.end,
                                      fontWeight: FontWeight.w800),
                                )
                              ],
                            ),
                            buildVSpacer(1.h),
                            Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: _buildText(
                                      title: "Lot Id : AT/O/008",
                                      fontWeight: FontWeight.w500,
                                      size: 9.px,
                                      align: TextAlign.start,
                                      color: const Color(0xff727272)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: _buildText(
                                      title: "Today, 09:20 AM",
                                      fontWeight: FontWeight.w500,
                                      size: 9.px,
                                      color: const Color(0xff727272)),
                                ),
                                buildHSpacer(12.w),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      _buildText(
                                          title: "Sent from",
                                          fontWeight: FontWeight.w500,
                                          size: 9.px,
                                          align: TextAlign.end,
                                          color: const Color(0xff727272)),
                                      buildHSpacer(2.w),
                                      Image.asset(
                                          'assets/paymenthistory${index + 1}.png')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
