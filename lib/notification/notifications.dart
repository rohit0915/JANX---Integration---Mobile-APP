// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
            color: buttonColor,
            size: 18.sp,
          ),
        ),
        title: _buildText(
            title: "Notifications",
            size: 18.px,
            fontWeight: FontWeight.w700,
            color: white),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: Column(
          children: [
            Expanded(child: ListView.separated(
              separatorBuilder: (context, index) => buildVSpacer(2.h),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(top: Adaptive.h(2)),
                        child: Container(
                          width: Adaptive.w(100),
                          padding: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                              border: Border.all(color: buttonColor),
                              borderRadius: BorderRadius.circular(14.sp),
                              color: white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                                            buildVSpacer(1.h),

                              _buildText(
                                  title: "Bid Alert !",
                                  fontWeight: FontWeight.w800,
                                  size: 12.px),
                              buildVSpacer(1.h),
   _buildText(
                                  title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                  fontWeight: FontWeight.w500,
                                  size: 9.px,
                                  color: Color(0xff727272)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Image.asset("assets/notification.png")
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
