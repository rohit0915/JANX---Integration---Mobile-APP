import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({super.key});

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
          title: "Bank Details",
          color: buttonColor,
          size: 18.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
        child: Column(
          children: [
            buildVSpacer(3.h),
            Center(child: Image.asset('assets/bank.png')),
            _buildText(
                title: "Please add your Bank details",
                size: 15.px,
                fontWeight: FontWeight.w500,
                color: buttonColor),
                buildVSpacer(6.h),
            const CustomTxtFormField(hintText: "Select Bank",icon: Icon(Icons.keyboard_arrow_down))
                         , buildVSpacer(1.h),
                           const CustomTxtFormField(hintText: "Account Number",)
                         , buildVSpacer(1.h),
                           const CustomTxtFormField(hintText: "Re-Enter Account Number",)
                         , buildVSpacer(1.h),
                           const CustomTxtFormField(hintText: "Account Hoder name",)
                         , buildVSpacer(1.h),
                           const CustomTxtFormField(hintText: "IFSC Code",)
                         , buildVSpacer(1.h),

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
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
