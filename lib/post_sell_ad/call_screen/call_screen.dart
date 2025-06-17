import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/utilz/common_functions.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

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
            )),
      ),
      body: Column(
        children: [
          buildVSpacer(3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildText(
                  title: "Calling To\nSeller",
                  color: white,
                  size: 24.px,
                  fontWeight: FontWeight.w600),
              Spacer(),
              CircleAvatar(
                radius: Adaptive.w(5),
                backgroundColor: buttonColor,
                child: Center(
                  child: Image.asset('assets/call1.png'),
                ),
              ),
              buildHSpacer(6.w),
              Image.asset('assets/call2.png'),
              buildHSpacer(4.w),
            ],
          ),
          buildVSpacer(6.h),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12.sp),
              // height: Adaptive.h(100),
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Adaptive.w(5)),
                      topRight: Radius.circular(Adaptive.w(5)))),
              child: Column(
                children: [
                  buildVSpacer(3.h),
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.sp),
                      color: black,
                    ),
                    child: Center(
                      child: Text(
                        'Your call will be recorded for security purpose',
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            color: white,
                            fontSize: 11.px),
                      ),
                    ),
                  ),
                  buildVSpacer(5.h),
                  buildText(
                    title: "00:23",
                    size: 16.px,
                    fontWeight: FontWeight.w600,
                  ),
                  buildVSpacer(14.h),
                  Image.asset('assets/call4.png'),
                  buildVSpacer(5.h),
                  Text(
                    'Calling To Lokesh....',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      fontSize: 23.px,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: Adaptive.h(3)),
        child: Image.asset('assets/call3.png'),
      ),
    );
  }
}
