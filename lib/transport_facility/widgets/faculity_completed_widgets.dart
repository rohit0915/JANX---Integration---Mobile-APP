import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_product_details/mitra_product_type3.dart';
import 'package:jan_x/transport_facility/faculity_complete_bill/faculity_complete_bill_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FaculityCompletedWidgets extends StatelessWidget {
  const FaculityCompletedWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FaculityCompleteBillScreen(),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(13.sp)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: Adaptive.w(30),
                    height: Adaptive.h(5),
                    decoration: BoxDecoration(
                        color: const Color(0xffF4BC1C),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(13.sp),
                          // bottomRight: Radius.circular(13.sp),
                          bottomLeft: Radius.circular(14.sp),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star),
                        Text(
                          'Verified',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600, fontSize: 10.px),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildVSpacer(2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          title: "Order ID : 67001",
                          size: 12.px,
                          align: TextAlign.start,
                          fontWeight: FontWeight.w800),
                    ),
                    buildVSpacer(2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          title: "Date : 05-04-24 , Timing : 5:PM",
                          size: 12.px,
                          fontWeight: FontWeight.w800),
                    ),
                    buildVSpacer(2.h),
                    _buildText(
                        title: "Jabalpur <--> Delhi",
                        size: 12.px,
                        fontWeight: FontWeight.w800),
                    buildVSpacer(2.h),
                    Stack(
                      children: [
                        Container(
                          height: Adaptive.h(9),
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: const Color(0xffEEEEEE),
                            borderRadius: BorderRadius.circular(12.sp),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/active_transation.png',
                                fit: BoxFit.cover,
                                scale: 1,
                              ),
                              _buildText(
                                  title: "LCV Open (2.5-7 )Tons\nMINI TRUCK",
                                  size: 12.px,
                                  fontWeight: FontWeight.w600)
                            ],
                          ),
                        ),
                        // Positioned(
                        //   right: 0,
                        //   bottom: 0,
                        //   child: Container(
                        //     width: Adaptive.w(23),
                        //     height: Adaptive.h(4),
                        //     decoration: BoxDecoration(color: black),
                        //     child: Center(
                        //       child: _buildText(
                        //         title: "Cancel",
                        //         size: 9.px,
                        //         color: white,
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    buildVSpacer(3.h),
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: const BoxDecoration(
                        color: buttonColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildText(
                                  title: "Vehicle No :",
                                  size: 10.px,
                                  fontWeight: FontWeight.w500),
                              _buildText(
                                  title: "Driver : Rahul Tiwari",
                                  size: 10.px,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                          buildVSpacer(1.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildText(
                                  title: "MP20BC1234",
                                  size: 10.px,
                                  fontWeight: FontWeight.w500),
                              _buildText(
                                  title: "+91 1234567890",
                                  size: 10.px,
                                  fontWeight: FontWeight.w500)
                            ],
                          )
                        ],
                      ),
                    ),
                    buildVSpacer(2.h),
                    CustomButton(
                      text: "Delivered Successfully",
                      onPressed: () {},
                      color: buttonColor,
                    )
                  ],
                ),
              ),
              buildVSpacer(3.h)
            ],
          ),
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
      textAlign: align ?? TextAlign.start,
      style: GoogleFonts.poppins(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
