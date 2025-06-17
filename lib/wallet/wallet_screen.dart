import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
                            Navigator.pop(context);

            },
            icon:  Icon(
              Icons.arrow_back_ios,
              color: buttonColor,
              size: 17.sp,
            )),
        title: _buildText(
            title: "Wallet",
            color: buttonColor,
            size: 18.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(2), vertical: Adaptive.h(1)),
        child: Column(
          children: [
            Container(
              height: Adaptive.h(9),
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(14.sp)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildText(
                          title: "JanX Balance",
                          size: 10.px,
                          fontWeight: FontWeight.w700),
                      _buildText(
                          title: "₹ 2500 ",
                          size: 15.px,
                          fontWeight: FontWeight.w700)
                    ],
                  ),
                  const Spacer(),
                  Image.asset('assets/wallet1.png'),
                  buildHSpacer(2.w)
                ],
              ),
            ),
            buildVSpacer(2.h),
            walletItems(),
            buildVSpacer(3.h),
            Container(
              width: Adaptive.w(100),
              padding: EdgeInsets.all(14.sp),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildText(
                    title: "Add Money to JanX Wallet",
                    size: 10.px,
                    fontWeight: FontWeight.w700,
                  ),
                  buildVSpacer(2.h),
                  Card(
                    color: white,
                    surfaceTintColor: white,
                    shadowColor: black,
                    child: Container(
                        height: Adaptive.h(6),
                        // width: ,
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            border: Border.all(color: const Color(0xffD2D2D2))),
                        child: Row(
                          children: [
                            _buildText(
                                title: "₹ 3500",
                                size: 16.px,
                                fontWeight: FontWeight.w700)
                          ],
                        )),
                  ),
                  buildVSpacer(2.h),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      addingMoneyMethod("+ ₹ 100"),
                      buildHSpacer(3.w),
                      addingMoneyMethod("+ ₹ 200"),
                      buildHSpacer(3.w),
                      addingMoneyMethod("+ ₹ 1000"),
                      buildHSpacer(3.w),
                      addingMoneyMethod("+ ₹ 2000"),
                      buildHSpacer(3.w),
                    ],
                  ),
                  buildVSpacer(2.h),
                  CustomButton(
                    text: "Proceed to add ₹1000",
                    onPressed: () {},
                    color: buttonColor,
                    size: 15.px,
                    textColor: white,
                  ),
                  buildVSpacer(1.h)
                ],
              ),
            ),
            buildVSpacer(4.h),
            Container(
                height: Adaptive.h(6),
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(14.sp)),
                child: Row(
                  children: [
                    Image.asset('assets/wallet6.png'),
                    buildHSpacer(4.w),
                    _buildText(
                        title: "Contact Jan - X Support",
                        size: 11.px,
                        fontWeight: FontWeight.w700)
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Expanded addingMoneyMethod(String title) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(14.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.sp),
            border: Border.all(color: const Color(0xffD2D2D2))),
        child: Center(
          child: _buildText(
              title: title,
              size: 10.px,
              fontWeight: FontWeight.w400,
              color: Colors.black45),
        ),
      ),
    );
  }

  Flex walletItems() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(14.sp),
            ),
            child: Center(child: Image.asset('assets/wallet2.png')),
          ),
        ),
        buildHSpacer(2.w),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(14.sp),
            ),
            child: Center(child: Image.asset('assets/wallet3.png')),
          ),
        ),
        buildHSpacer(2.w),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(14.sp),
            ),
            child: Center(child: Image.asset('assets/wallet4.png')),
          ),
        ),
        buildHSpacer(2.w),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(14.sp),
            ),
            child: Center(child: Image.asset('assets/wallet5.png')),
          ),
        )
      ],
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
