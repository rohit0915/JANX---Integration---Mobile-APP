import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:jan_x/wish_karo_screen/wish_karo_details/widgets/seller_information_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WishKaroDetailsScreen extends StatefulWidget {
  const WishKaroDetailsScreen({super.key});

  @override
  State<WishKaroDetailsScreen> createState() => _WishKaroDetailsScreenState();
}

class _WishKaroDetailsScreenState extends State<WishKaroDetailsScreen> {
  @override
  bool isOtherServiceClicked = false;
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
              size: 17.sp,
            )),
        title: _buildText(
            title: "Wish Karo",
            color: white,
            size: 18.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/banner.png",
                scale: 0.9,
              ),
              buildVSpacer(3.h),
              wishKaroDetailsScreenItemMethod(context),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOtherServiceClicked = !isOtherServiceClicked;
                  });
                },
                child: Row(
                  children: [
                    _buildText(
                        title: "Other Details",
                        color: const Color(0xffF4BC1C),
                        fontWeight: FontWeight.bold,
                        size: 16),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xffF4BC1C),
                    )
                  ],
                ),
              ),
              isOtherServiceClicked == true
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildVSpacer(10),
                        _buildText(
                            title: "Moisture", color: const Color(0xffF4BC1C)),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                        buildVSpacer(10),
                        _buildText(
                            title: "Color", color: const Color(0xffF4BC1C)),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                        buildVSpacer(10),
                        _buildText(
                            title: "Extraneous",
                            color: const Color(0xffF4BC1C)),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                        buildVSpacer(10),
                        _buildText(
                            title: "Foriegn Matter",
                            color: const Color(0xffF4BC1C)),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                        buildVSpacer(10),
                        _buildText(
                            title: "Other Crop",
                            color: const Color(0xffF4BC1C)),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                      ],
                    )
                  : const SizedBox(),
              buildVSpacer(2.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: _buildText(
                      title: "Highlight",
                      size: 14.px,
                      fontWeight: FontWeight.w800,
                      color: white)),
              buildVSpacer(1.h),
              wishKaroDetailsHighLights(),
              buildVSpacer(1.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: _buildText(
                      title: "Overview",
                      size: 14.px,
                      fontWeight: FontWeight.w800,
                      color: white)),
              buildVSpacer(1.h),
              wishKaroDetailsHighLights(),
              buildVSpacer(3.h),
              WishKaroDetailsScreenFieldWidget(title: "MITRA INFORMATION"),
  buildVSpacer(8.h),
    Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: CustomButton(text: "Back", onPressed: () {
              Navigator.pop(context);
            }),
          ),
                          buildVSpacer(1.h),
  
            ],
          ),
        ),
      ),
      // floatingActionButton: 
    );
  }

  Container wishKaroDetailsHighLights() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Adaptive.w(4), vertical: Adaptive.h(2)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: buttonColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildText(
                  title: "Wish ID  : -- (Seller Back-end Update)",
                  size: 10.px,
                  fontWeight: FontWeight.w700),
              Spacer(),
              _buildText(
                  title: "Gujrath", size: 10.px, fontWeight: FontWeight.w700),
              Icon(
                Icons.location_on,
                size: 17.sp,
              )
            ],
          ),
          buildVSpacer(3.h),
          wishKaroDetailsHighlightMethod(title: "Category"),
          buildVSpacer(1.h),
          wishKaroDetailsHighlightMethod(title: "Brand"),
          buildVSpacer(1.h),
          wishKaroDetailsHighlightMethod(title: "Quantity"),
          buildVSpacer(1.h),
          wishKaroDetailsHighlightMethod(title: "Price"),
          buildVSpacer(1.h),
          wishKaroDetailsHighlightMethod(title: "Specification 1"),
          buildVSpacer(1.h),
          wishKaroDetailsHighlightMethod(title: "Specification 2"),
          buildVSpacer(1.h),
          wishKaroDetailsHighlightMethod(title: "Other Detail"),
          buildVSpacer(1.h),
          wishKaroDetailsHighlightMethod(title: "Date From"),
          buildVSpacer(1.h),
          wishKaroDetailsHighlightMethod(title: "Date To"),
          buildVSpacer(3.h),
          Align(
              alignment: Alignment.centerLeft,
              child: _buildText(
                  title: "Back-end Developed by JANX",
                  size: 10.px,
                  fontWeight: FontWeight.w700))
        ],
      ),
    );
  }

  Flex wishKaroDetailsHighlightMethod({required String title}) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
            flex: 1,
            child: _buildText(
              title: title,
              size: 10.px,
              fontWeight: FontWeight.w500,
            )),
        Expanded(
            flex: 2,
            child: _buildText(
              title: ": --",
              size: 13.px,
              fontWeight: FontWeight.w500,
            ))
      ],
    );
  }

  Padding wishKaroDetailsScreenItemMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const WishKaroDetailsScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: Adaptive.w(30),
                        height: Adaptive.h(5),
                        decoration: BoxDecoration(
                            color: const Color(0xffF4BC1C),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(14.sp),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star),
                            Text(
                              'Verified',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600, fontSize: 10.px),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  buildVSpacer(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/wishimage.png"),
                            buildHSpacer(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _buildText1(
                                    title: "Electronic,Washing Machine",
                                    size: 18),
                                _buildText1(title: "Brand :  LG", size: 11),
                                _buildText1(
                                    title: "Location : Jabalpur", size: 11),
                                _buildText1(
                                    title: "30-04-24 - 04-05-24", size: 11),
                              ],
                            )
                          ],
                        ),
                        buildVSpacer(10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              _buildText1(title: "Quantity (approx.)"),
                              const Spacer(),
                              _buildText1(title: "01 Pc"),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF4BC1C),
                          ),
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              _buildText1(title: "Min-Price (approx.)"),
                              const Spacer(),
                              _buildText1(title: "₹ 2,400.00"),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF4BC1C),
                          ),
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              _buildText1(title: "Total Cost (approx.)"),
                              const Spacer(),
                              _buildText1(title: "₹ 2,40,000.00"),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffF4BC1C),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildText(
                                title:
                                    "Description : Turmeric, a plant in the ginger family, is native to South east Asia and is grown commercially in that region.",
                                size: 9.px,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        buildVSpacer(20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -18,
            left: Adaptive.w(5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xff3985D7),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.black26),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/check.png",
                    scale: 0.8,
                  ),
                  buildHSpacer(5),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Wish ID: 4545454454",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Posted Date : 05-April-24",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText1(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
              fontSize: size ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
              fontFamily: 'Poppins',
              color: color ?? Colors.black),
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
      textAlign: TextAlign.start,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
