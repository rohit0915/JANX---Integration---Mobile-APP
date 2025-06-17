

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/sale_ads/category_screen/widgets/category_widgets.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategorySelectedScreen extends StatelessWidget {
  const CategorySelectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 18.sp,
                        color: buttonColor,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          color: buttonColor,
                        ),
                        child: Row(
                          children: [
                            _buildText(
                              title: "Search....",
                              size: 14.px,
                              fontWeight: FontWeight.w400,
                            ),
                            const Spacer(),
                            const Icon(Icons.search),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                buildVSpacer(3.h),
                _buildText(
                  title: "Selected Commodities",
                  size: 14.px,
                  fontWeight: FontWeight.w500,
                  color: white,
                ),
                buildVSpacer(3.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: Adaptive.h(1),
                    crossAxisSpacing: Adaptive.w(3),
                  ),
                  itemCount: 8, // Set the number of items in the grid
                  itemBuilder: (context, index) {
                    return const CategoryItem(isSelectedScreen: true,);
                  },
                ),
                buildVSpacer(3.h),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: Adaptive.h(2),horizontal: Adaptive.w(3)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton3(
              size: 16.px,
              width: Adaptive.w(90),
              text: "9 Commodities Selected",
              onPressed: () {},
              
              // width: Adaptive.w(42),
            ),
           
          ],
        ),
      ),
    );
  }
   Widget _buildText({
    required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Align(
      child: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black,
        ),
      ),
    );
  }
}