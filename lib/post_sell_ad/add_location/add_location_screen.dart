import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff444444),
          image: DecorationImage(
            image: AssetImage("assets/splash3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: buttonColor,
                      )),
                  buildHSpacer(3.w),
                  Container(
                    height: Adaptive.h(5),
                    width: Adaptive.w(75),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        color: buttonColor),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildText(
                          title: "Search...by pincode",
                          size: 14.px,
                          fontWeight: FontWeight.w400,
                        ),
                        const Spacer(),
                        const Icon(Icons.search)
                      ],
                    ),
                  )
                ],
              ),
              buildVSpacer(3.h),
              _buildText(
                  title:
                      "Please Choose the location from where\nyou want to buy",
                  size: 14.px,
                  color: white,
                  fontWeight: FontWeight.w500),
              buildVSpacer(10.h),
              Image.asset('assets/location.png'),
              buildVSpacer(10.h),
              Container(
                height: Adaptive.h(5),
                // width: Adaptive.w(75),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: buttonColor),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildText(
                      title: "Choose the location",
                      size: 14.px,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down,
                    )
                  ],
                ),
              ),
              buildVSpacer(3.h),
              _buildText(
                  title:
                      "Note - By choosing the location you can see\nthe sellers and products of that area",
                  size: 14.px,
                  color: white,
                  fontWeight: FontWeight.w500),

            ],
          ),
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: Padding(
      padding:  EdgeInsets.only(bottom: Adaptive.h(3)),
      child: CustomButton(text: "Confirm ", onPressed: (){
        Navigator.pop(context);
      },
      width: Adaptive.w(80),
      ),
    ),
    );
  }

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color,
      bool align = false}) {
    return align
        ? Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontSize: size ?? 14,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  // fontFamily: 'Lato',
                  color: color ?? Colors.black),
            ),
          )
        : Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                fontSize: size ?? 14,
                fontWeight: fontWeight ?? FontWeight.w400,
                // fontFamily: 'Lato',
                color: color ?? Colors.black),
          );
  }
}
