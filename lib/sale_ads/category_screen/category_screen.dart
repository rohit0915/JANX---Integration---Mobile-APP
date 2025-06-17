import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/sale_ads/category_screen/category_selected_screen.dart';
import 'package:jan_x/sale_ads/category_screen/widgets/category_widgets.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
                  title: "You can add maximum of 8 crops",
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
                    return const CategoryItem(
                      isSelectedScreen: false,
                    );
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
        padding: EdgeInsets.symmetric(vertical: Adaptive.h(2)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton1(
              text: "Next",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategorySelectedScreen(),
                    ));
              },
              width: Adaptive.w(42),
            ),
            buildHSpacer(30),
            CustomButton3(
              width: Adaptive.w(42),
              text: "Skip",
              textColor: const Color(0xffF4BC1C),
              onPressed: () {},
              color: const Color(0xff444444),
              borderColor: buttonColor,
            )
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
