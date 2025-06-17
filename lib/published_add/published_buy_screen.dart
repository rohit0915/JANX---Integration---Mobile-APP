import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_summary/buyer_contact_details_screen.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PublishedBuyScreen extends StatelessWidget {
  const PublishedBuyScreen({super.key, this.isFromSeller = false});
  final bool isFromSeller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff444444),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: const Color(0xffF4BC1C),
          iconSize: 19.sp,
        ),
        title: _buildTextHeader(
            title: "Published Ad",
            color: Colors.white,
            fontWeight: FontWeight.w800,
            size: 17.px),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildVSpacer(30.h),
            Text(
              'Your Add has been Successfully\nPublished',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w800,
                  fontSize: 17.px,
                  color: Colors.white),
            ),
            buildVSpacer(3.h),
           isFromSeller? Text(
              'Ad ID :  2404-222819',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w800,
                  fontSize: 22.px,
                  color: const Color(0xffF4BC1C)),
            ):Text(
              'Buy ID :  2404-222819',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w800,
                  fontSize: 22.px,
                  color: const Color(0xffF4BC1C)),
            ),
            Text(
              'Search Your product with buy ID',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w800,
                  fontSize: 8.px,
                  color: const Color(0xffF4BC1C)),
            ),
            buildVSpacer(18.h),
            isFromSeller
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 6),
                    child: CustomButton(
                        text: "Seller Contact No : 67001",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BuyerContactDetailsScreen(isFromFacilityComplete: true),
                              ));
                        }),
                  )
                : const SizedBox(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 7.h),
        child: CustomButton(
            text: "Home",
            onPressed: () {
              // Navigator.pop(context);
              Navigator.pop(context);
            }),
      ),
    );
  }

  Widget _buildTextHeader(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Text(
      title,
      // textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
