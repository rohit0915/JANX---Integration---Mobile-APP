import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_detils/product_order_details_screen.dart';
import 'package:jan_x/packaging_labeling/widgets/package_default_methods.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewRequestScreenForPackaging extends StatelessWidget {
  const NewRequestScreenForPackaging({super.key});

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
            title: "New Request",
            color: white,
            size: 22.px,
            fontWeight: FontWeight.w700),

        centerTitle: true,
        // actions: [Image.asset('assets/order1.png'), buildHSpacer(3.w)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: Adaptive.w(75),
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(18.sp)),
                    child: _buildText(
                        title:
                            "Search with Ad-ID, Crop ,Price, phone number etc.........",
                        size: 8.px),
                  ),
                  const Spacer(),
                  Image.asset('assets/inspectionimg1.png'),
                ],
              ),
              buildVSpacer(3.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: _buildText(
                      title: "Search Your Ad",
                      size: 10.px,
                      color: white,
                      fontWeight: FontWeight.w600)),            buildVSpacer(3.h),
        
                       Align(
                alignment: Alignment.centerLeft,
                child: _buildText(
                    title: "Results 1/1",
                    size: 10.px,
                    color: white,
                    fontWeight: FontWeight.w600),
              ),
              buildVSpacer(3.h),
              InkWell(
                 onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOrderDetailsScreen(isFromTrade: true),
                    ));
                 },
                child: mitraSellMethod()),
              buildVSpacer(9.h),
              CustomButton(
                text: "Next",
                onPressed: () {},
                color: buttonColor,
              ),
              buildVSpacer(9.h),
            ],
          ),
        ),
      ),
    );
  }
  //====================

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Text(
        title,
        style: GoogleFonts.lato(
            fontSize: size ?? 14,
            fontWeight: fontWeight ?? FontWeight.w400,
            // fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    );
  }
}
