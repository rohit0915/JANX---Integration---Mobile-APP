import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/about_janx/about_janx_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
            )),
      ),
      body: Column(
        children: [
          buildVSpacer(3.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildText(
                    title: "Connect With\nSeller",
                    size: 23.px,
                    fontWeight: FontWeight.w600,
                    align: TextAlign.start,
                    color: white),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: buttonColor,
                      size: 24.sp,
                    ),
                    buildHSpacer(3.w),
                    CircleAvatar(
                      radius: Adaptive.w(5),
                      backgroundColor: buttonColor,
                      child: Center(
                        child: Image.asset('assets/chat.png'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          buildVSpacer(5.h),
          Expanded(
              child: Container(
            width: Adaptive.w(100),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Adaptive.w(7)),
                  topRight: Radius.circular(Adaptive.w(7)),
                )),
            child: Column(
              children: [
                buildVSpacer(8.h),
                fistChatMethod(),
                buildVSpacer(3.h),
                secondChatMethod(),
                buildVSpacer(3.h),
                fistChatMethod(),
                buildVSpacer(3.h),
                secondChatMethod(),
                buildVSpacer(3.h),
                secondChatMethod(),
                buildVSpacer(3.h),
              ],
            ),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: Adaptive.h(3)),
        child: SizedBox(
          height: Adaptive.h(7),
          child: Row(
            children: [
              Container(
                // height: Adaptive.h(10),
                width: Adaptive.w(80),
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.sp), color: black),
                child: Center(
                  child: _buildText(
                      title:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.........",
                      size: 9.px,
                      fontWeight: FontWeight.w600,
                      color: white,
                      align: TextAlign.start),
                ),
              ),
              buildHSpacer(3.w),
              CircleAvatar(
                radius: Adaptive.w(6),
                backgroundColor: black,
                child: Center(
                  child: Image.asset('assets/chat2.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row secondChatMethod() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: 14.sp, vertical: Adaptive.h(2)),
          constraints: BoxConstraints(
            maxWidth: Adaptive.w(60),
            // minWidth: Adaptive.w(width)
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.sp),
              topLeft: Radius.circular(22.sp),
              bottomLeft: Radius.circular(22.sp),
            ),
            color: black,
          ),
          child: Center(
            child: _buildText(
                title:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                size: 9.px,
                fontWeight: FontWeight.w600,
                color: white),
          ),
        )
      ],
    );
  }

  Row fistChatMethod() {
    return Row(
      children: [
        CircleAvatar(
          radius: Adaptive.w(4),
          backgroundColor: black,
        ),
        buildHSpacer(6.w),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: 14.sp, vertical: Adaptive.h(2)),
          constraints: BoxConstraints(
            maxWidth: Adaptive.w(60),
            // minWidth: Adaptive.w(width)
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.sp),
              topRight: Radius.circular(22.sp),
              bottomRight: Radius.circular(22.sp),
            ),
            color: black,
          ),
          child: Center(
            child: _buildText(
                title:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                size: 9.px,
                fontWeight: FontWeight.w600,
                color: white),
          ),
        )
      ],
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
