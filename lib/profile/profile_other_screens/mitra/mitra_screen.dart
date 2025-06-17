import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_ad_review_screen.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_clients/mitra_client_screen.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_income/miktra_income_screen.dart';
import 'package:jan_x/trade_setllement/trade_settlement_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraProfileScreen extends StatelessWidget {
  const MitraProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: buttonColor, size: 18.sp)),
        title: _buildText(
            title: "Mitra",
            color: white,
            size: 26.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: Column(
          children: [
            Container(
              width: Adaptive.w(100),
              padding: EdgeInsets.all(17.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.sp),
                color: buttonColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildText(
                              title: "Mitra Name : Ramlal singh",
                              size: 12.px,
                              fontWeight: FontWeight.w600,
                              color: black),
                          buildVSpacer(2.h),
                          _buildText(
                              title: "Mitra ID : 000023",
                              size: 12.px,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MitraClientScreen(),
                                ));
                          },
                          child: Image.asset('assets/mitraimg1.png'))
                    ],
                  ),
                  buildVSpacer(3.h),
                  Row(
                    children: [
                      _buildText(
                        title: " My Earnings",
                        size: 12.px,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: Adaptive.w(23),
                      ),
                      _buildText(
                          title: "₹ 10,0000/-",
                          size: 22.px,
                          fontWeight: FontWeight.w800)
                    ],
                  )
                ],
              ),
            ),
            buildVSpacer(2.h),
            Row(
              children: [
                CustomButton3(
                  text: "Ad Review",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MitraAddReviewScreen(),
                        ));
                  },
                  color: buttonColor,
                  size: 10.px, // Adjust size if needed
                  width: Adaptive.w(28),
                ),
                buildHSpacer(1.w),
                CustomButton3(
                  text: "Trade Settlement",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TradeSettlementScreen(),
                      ),
                    );
                  },
                  color: white,
                  size: 10.px,
                  width: Adaptive.w(38),
                ),
                buildHSpacer(1.w),
                CustomButton3(
                  text: "Income",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MitraIncomeScreen(),
                        ));
                  },
                  color: white,
                  size: 11.px,
                  width: Adaptive.w(27),
                ),
              ],
            ),
            buildVSpacer(2.h)
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
