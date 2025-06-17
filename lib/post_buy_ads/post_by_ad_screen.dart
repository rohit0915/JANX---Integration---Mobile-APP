// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/post_buy_ads/tap_on_post_buy/tap_on_post_by_screen.dart';
import 'package:jan_x/post_buy_ads/tap_on_post_buy/widgets/completed_screen_widget.dart';
import 'package:jan_x/post_buy_ads/tap_on_post_buy/widgets/my_add_post_buy_widget.dart';
import 'package:jan_x/post_buy_ads/widgets/new_sale_widget.dart';
import 'package:jan_x/post_sell_ad/my_ad_onTap_screen.dart';
import 'package:jan_x/published_add/published_buy_screen.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostBuyAdScreen extends StatefulWidget {
  PostBuyAdScreen({super.key, this.selectedTab = SelectedTab.newSale});

  SelectedTab selectedTab;
  @override
  State<PostBuyAdScreen> createState() => _PostBuyAdScreenState();
}

class _PostBuyAdScreenState extends State<PostBuyAdScreen> {
  String? selectedCrop;
  List<String> cropTypes = ['Wheat', 'Paddy', 'Moong'];
  String headerTitle = "Buyer";

  void _handleDropdownChange(String? newValue) {
    setState(() {
      selectedCrop = newValue;
    });
  }

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff444444),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildVSpacer(30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xffF4BC1C),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: _buildTextHeader(
                        title: headerTitle, color: Colors.white, size: 18))
              ],
            ),
            buildVSpacer(30),
            Flex(
              direction: Axis.horizontal,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child:
                        _buildTab(SelectedTab.newSale, "Buy Request", "Buyer")),
                buildHSpacer(5.w),
                Expanded(
                    flex: 1,
                    child: _buildTab(SelectedTab.myAds, "My Ad's", "My AD's")),
                buildHSpacer(5.w),
                Expanded(
                    flex: 1,
                    child: _buildTab(
                        SelectedTab.completed, "Completed", "Completed")),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(child: _selectedTabContent()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(SelectedTab tab, String title, String headerText) {
    bool isSelected = widget.selectedTab == tab;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selectedTab = tab;
          headerTitle = headerText;
        });
      },
      child: Container(
        // width: Adaptive.w(36),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF4BC1C) : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: _buildTextHeader(
              title: title,
              color: isSelected ? Colors.black : Colors.grey,
              size: 10.px),
        ),
      ),
    );
  }

  Widget _selectedTabContent() {
    switch (widget.selectedTab) {
      case SelectedTab.newSale:
        // return _newSaleContent();
        return NewSaleRequestWidget();
      case SelectedTab.myAds:
        return _myAdsContent(context);
      case SelectedTab.completed:
        return CompletedContentPostBuy();
      default:
        return NewSaleRequestWidget();
    }
  }

  bool isOtherServiceClicked = false;
  bool isClickedRequest = false;

  Flex paymentWidgetMethod({required String titile}) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
            flex: 1,
            child: Text(
              '$titile',
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w500, fontSize: 12.px),
            )),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: Adaptive.h(5),
            width: Adaptive.w(30),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
        ),
        SizedBox(
          width: Adaptive.w(10),
        )
      ],
    );
  }

  Widget buildCustomTextFieldWithDropdown() {
    return Container(
      height: 6.h,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color(0xffF4BC1C),
            width: 2.0), // Yellow border around the container
        borderRadius: BorderRadius.circular(5.0), // Rounded corners
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCrop,
          isExpanded: true, // Makes the dropdown expand to fill the container
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black), // Text color
          onChanged: _handleDropdownChange,
          items: cropTypes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          dropdownColor: const Color(0xffF4BC1C),
        ),
      ),
    );
  }
}

Widget _buildTextHeader(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Align(
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
    ),
  );
}

Widget _buildText(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style: TextStyle(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontFamily: 'Poppins',
          color: color ?? Colors.black),
    ),
  );
}

enum SelectedTab { newSale, myAds, completed, defaults }

Widget _myAdsContent(BuildContext context) {
  return Center(
      child: Column(
    children: [
      buildVSpacer(30),
      const MyAdWidgetForPostBuy(),
      buildVSpacer(20),
      const MyAdWidgetForPostBuy(),
      buildVSpacer(30),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: CustomButton(
            text: "Home",
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      buildVSpacer(50),
    ],
  ));
}

Widget _completedContent(BuildContext context) {
    bool isClickedCompleted2=false;

  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: Adaptive.h(3),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (context) =>  MyAdonTapScreen(),
                  //   ),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            buildVSpacer(20),
                            Row(
                              children: [
                                Image.asset("assets/pro.png"),
                                buildHSpacer(20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _buildText1(title: "Wheat", size: 18),
                                    _buildText1(
                                        title: "Variety :  v1,Sharbati",
                                        size: 11),
                                    _buildText1(
                                        title: "Location : Jabalpur", size: 11),
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
                                  _buildText1(title: "100 QT"),
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
                                    size: 11.px),
                              ),
                            ),
                            buildVSpacer(20),
                          ],
                        ),
                      ),
                      buildVSpacer(3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: Adaptive.h(5),
                            padding: EdgeInsets.symmetric(horizontal: 22.sp),
                            decoration: BoxDecoration(
                              color: const Color(0xffF4BC1C),
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                            child: Center(
                              child: Text(
                                'Expired',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.px),
                              ),
                            ),
                          )
                        ],
                      ),
                      buildVSpacer(1.h),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -18,
                left: 20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                            "AD ID: 4545454454",
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
              // Positioned(
              //   bottom: Adaptive.h(21),
              //   left: 20,
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              //     decoration: BoxDecoration(
              //       color: const Color(0xff5EAB04),
              //       borderRadius: BorderRadius.circular(18),
              //       border: Border.all(color: Colors.black26),
              //     ),
              //     child: Row(
              //       children: [
              //         Image.asset(
              //           "assets/check.png",
              //           scale: 0.8,
              //         ),
              //         buildHSpacer(5),
              //         const Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "Order ID: 67001",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //             Text(
              //               "Date : 05-April-24",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 10,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        buildVSpacer(10.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: CustomButton(
              text: "Home",
              onPressed: () {
                log("clicked");
                Navigator.pop(context);
              }),
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
