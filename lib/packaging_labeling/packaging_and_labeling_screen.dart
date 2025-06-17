import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_detils/product_details_screen_from_packages.dart';
import 'package:jan_x/order_detils/product_order_details_screen.dart';
import 'package:jan_x/packaging_labeling/new_request_screen/new_request_screen.dart';
import 'package:jan_x/packaging_labeling/widgets/package_default_methods.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PackagingAndLabelinScreen extends StatefulWidget {
  const PackagingAndLabelinScreen({super.key});

  @override
  State<PackagingAndLabelinScreen> createState() =>
      _PackagingAndLabelinScreenState();
}

class _PackagingAndLabelinScreenState extends State<PackagingAndLabelinScreen> {
  SelectedTab selectedTab = SelectedTab.defaults;

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
            title: "Packaging & Labeling",
            color: white,
            size: 22.px,
            fontWeight: FontWeight.w700),

        centerTitle: true,
        // actions: [Image.asset('assets/order1.png'), buildHSpacer(3.w)],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildVSpacer(3.h),
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: _buildTab(
                          SelectedTab.newRequest, "New Request", "Seller")),
                  buildHSpacer(5.w),
                  Expanded(
                      flex: 1,
                      child: _buildTab(
                          SelectedTab.inprogress, "InProgress", "My AD's")),
                  buildHSpacer(5.w),
                  Expanded(
                      flex: 1,
                      child: _buildTab(
                          SelectedTab.completed, "Completed", "Completed")),
                ],
              ),
              buildVSpacer(3.h),
              _selectedTabContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectedTabContent() {
    switch (selectedTab) {
      case SelectedTab.newRequest:
        return SingleChildScrollView(child: defaultMethod());
      case SelectedTab.inprogress:
        return inProgressmethod();
      case SelectedTab.completed:
        return Column(
          children: [
            mitraSellForCompleteMethod(),
            buildVSpacer(9.h),
            CustomButton(
              text: "Next",
              onPressed: () {},
              color: buttonColor,
            ),
            buildVSpacer(9.h),
          ],
        );
      default:
        return defaultMethod();
    }
  }

  inProgressmethod() {
    return Column(
      children: [
        buildVSpacer(3.h),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProductOrderDetailsFromPackagesScreen(),
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
    );
  }

  defaultMethod() {
    return Column(
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
                fontWeight: FontWeight.w600)),
        buildVSpacer(3.h),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProductOrderDetailsScreen(isFromTrade: true),
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
    );
  }

  completeMethod() {
    return Column(
      children: [
        buildVSpacer(3.h),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProductOrderDetailsScreen(isFromTrade: true),
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
    );
  }

  Widget _buildTab(SelectedTab tab, String title, String headerText) {
    bool isSelected = selectedTab == tab;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = tab;
          // headerTitle = headerText;
        });
        if (selectedTab == SelectedTab.newRequest) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewRequestScreenForPackaging(),
              ));
        }
      },
      child: Container(
        // width: Adaptive.w(36),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF4BC1C) : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _buildTextHeader(
              title: title,
              color: isSelected ? Colors.black : Colors.grey,
              size: 12.px),
        ),
      ),
    );
  }

  Widget _buildTextHeader(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: size ?? 14,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    );
  }

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

enum SelectedTab { newRequest, inprogress, completed, defaults }
