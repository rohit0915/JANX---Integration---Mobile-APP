import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

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
          title: "Payments History",
          color: white,
          size: 18.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: Column(
          children: [
            buildVSpacer(2.h),
            Container(
              padding: EdgeInsets.all(14.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                color: buttonColor,
              ),
              child: Row(
                children: [
                  _buildText(
                      title: "Search by lot Id , amount , crop",
                      size: 11.px,
                      fontWeight: FontWeight.w600),
                  const Spacer(),
                  const Icon(Icons.search)
                ],
              ),
            ),
            buildVSpacer(2.h),
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) => buildVSpacer(2.h),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(top: Adaptive.h(2)),
                        child: Container(
                          width: Adaptive.w(100),
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                              border: Border.all(color: buttonColor),
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
                                            'assets/paymenthistory${index+1}.png')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Image.asset("assets/paymenthistory4.png")
                  ],
                );
              },
            ))
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
