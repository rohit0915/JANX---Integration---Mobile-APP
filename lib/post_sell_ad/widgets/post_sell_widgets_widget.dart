import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CompleteInspectionWidget2 extends StatefulWidget {
  final String title;

  final bool isBlur;

  CompleteInspectionWidget2({
    Key? key,
    required this.title,
    
    this.isBlur = false,
  }) : super(key: key);

  @override
  State<CompleteInspectionWidget2> createState() =>
      _CompleteInspectionWidget2State();
}

class _CompleteInspectionWidget2State extends State<CompleteInspectionWidget2> {
  @override
  Widget build(BuildContext context) {
    bool isClicked = false;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isClicked = !isClicked;
                });
              },
              child: Container(
                height: Adaptive.h(7),
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: buttonColor, // Replace with your buttonColor
                  ),
                  borderRadius: BorderRadius.circular(14.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.px,
                        color: Colors.grey,
                      ),
                    ),
                  isClicked==false?  const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ): const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 3.h), // Replace with buildVSpacer(3.h)
            isClicked
                ? Container(
                    width: Adaptive.w(100),
                    padding: EdgeInsets.all(7.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: buttonColor, // Replace with your buttonColor
                      ),
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildText(
                              title: "Status",
                              fontWeight: FontWeight.w600,
                              size: 12.px,
                            ),
                            Container(
                              padding: EdgeInsets.all(12.sp),
                              decoration: BoxDecoration(
                                color:
                                    buttonColor, // Replace with your buttonColor
                                borderRadius: BorderRadius.circular(14.sp),
                              ),
                              child: Center(
                                child: _buildText(
                                  title: "Under Process",
                                  size: 12.px,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                        buildVSpacer(1.h),
                        const Divider(
                          color: buttonColor,
                        ),
                        buildVSpacer(1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildText(
                              title: "Report",
                              fontWeight: FontWeight.w600,
                              size: 12.px,
                            ),
                            Container(
                              padding: EdgeInsets.all(12.sp),
                              decoration: BoxDecoration(
                                color:
                                    buttonColor, // Replace with your buttonColor
                                borderRadius: BorderRadius.circular(14.sp),
                              ),
                              child: Center(
                                child: _buildText(
                                  title: "View/ Download",
                                  size: 12.px,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                        buildVSpacer(1.h),
                        const Divider(
                          color: buttonColor,
                        ),
                        buildVSpacer(1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildText(
                              title: "Grade (%)",
                              size: 12.px,
                              fontWeight: FontWeight.w800,
                            ),
                            _buildText(
                              title: "10(%)",
                              size: 12.px,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                        buildVSpacer(2.h),
                     widget.isBlur?const SizedBox():  Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.sp, vertical: 1.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: black,
                                    ),
                                    borderRadius: BorderRadius.circular(12.sp)),
                                child: Center(
                                  child: _buildText(
                                      title: "Discount",
                                      size: 11.px,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                              ),
                            ),
                            buildHSpacer(5.w),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.sp, vertical: 1.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: black,
                                    ),
                                    borderRadius: BorderRadius.circular(12.sp)),
                                child: Center(
                                  child: _buildText(
                                      title: "Premium",
                                      size: 11.px,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                              ),
                            ),
                            buildHSpacer(5.w),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.sp, vertical: 1.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: black,
                                    ),
                                    borderRadius: BorderRadius.circular(12.sp)),
                                child: Center(
                                  child: _buildText(
                                      title: "Market Rate",
                                      size: 9.px,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                              ),
                            )
                          ],
                        ),
                        buildVSpacer(3.h),
                        _buildText(title: "data will be fetched automaticaly from backnd/not manuel",
                        size: 10.px,fontWeight: FontWeight.w600
                        ),
                                                buildVSpacer(3.h),

                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }

  Widget _buildText({
    required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: size ?? 14,
            fontWeight: fontWeight ?? FontWeight.w400,
            fontFamily: 'Poppins',
            color: color ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
