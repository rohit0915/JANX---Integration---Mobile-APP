// ignore_for_file: unused_element

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/post_buy_ads/post_by_ad_screen.dart';
import 'package:jan_x/post_buy_ads/tap_on_post_buy/widgets/completed_screen_widget.dart'
    hide CompletedContentPostBuy;
import 'package:jan_x/post_buy_ads/tap_on_post_buy/widgets/my_add_post_buy_widget.dart';
import 'package:jan_x/published_add/published_buy_screen.dart';
import 'package:jan_x/report_screen/report_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyAdonTapScreenPostBuy extends StatefulWidget {
  final SelectedTab? someData; // Example of a parameter

  const MyAdonTapScreenPostBuy({
    Key? key,
    this.someData, // Require this parameter
  }) : super(key: key);

  @override
  State<MyAdonTapScreenPostBuy> createState() => _MyAdonTapScreenPostBuyState();
}

class _MyAdonTapScreenPostBuyState extends State<MyAdonTapScreenPostBuy> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedTab = widget.someData ?? SelectedTab.newSale;
  }

  bool isSelected = false; // Mock definition for isSelected
  String headerTitle = "Header Title"; // Mock definition for headerTitle
  String? selectedCrop;
  List<String> cropTypes = ['Wheat', 'Paddy', 'Moong'];
  SelectedTab selectedTab = SelectedTab.newSale;
  bool isOtherServiceClicked = false;

  void _handleDropdownChange(String? newValue) {
    setState(() {
      selectedCrop = newValue;
    });
  }

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff444444),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_back_ios_new,
                      color: Color(0xffF4BC1C)),
                  const SizedBox(width: 100),
                  _buildTextHeader(
                      title: "My AD's", color: Colors.white, size: 18),
                ],
              ),
              const SizedBox(height: 30),
              Flex(
                direction: Axis.horizontal,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: _buildTab(
                          SelectedTab.newSale, "Buy Request", "Buyer")),
                  buildHSpacer(5.w),
                  Expanded(
                      flex: 1,
                      child:
                          _buildTab(SelectedTab.myAds, "My Ad's", "My AD's")),
                  buildHSpacer(5.w),
                  Expanded(
                      flex: 1,
                      child: _buildTab(
                          SelectedTab.completed, "Completed", "Completed")),
                ],
              ),
              buildVSpacer(1.h),
              Container(
                height: MediaQuery.of(context).size.height -
                    40, // Adjust the height as needed
                child: SingleChildScrollView(
                  child: _selectedTabContent(),
                ),
              ),
              buildVSpacer(2.h)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(SelectedTab tab, String title, String headerText) {
    bool isSelected = selectedTab == tab;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = tab;
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

  Widget _buildTextHeader(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size ?? 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: 'Poppins',
        color: color ?? Colors.black,
      ),
    );
  }

  Widget _selectedTabContent() {
    switch (selectedTab) {
      case SelectedTab.newSale:
        return _newSaleContent();
      case SelectedTab.myAds:
        return myAdMethod(context);

      case SelectedTab.completed:
        return CompletedContentPostBuy();
      default:
        return myAdMethod(context);
    }
  }

  Widget _completedContent(BuildContext context) {
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
                    //     builder: (context) => const MyAdonTapScreen(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      _buildText1(title: "Wheat", size: 18),
                                      _buildText1(
                                          title: "Variety :  v1,Sharbati",
                                          size: 11),
                                      _buildText1(
                                          title: "Location : Jabalpur",
                                          size: 11),
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

  Widget _newSaleContent() {
    return Column(
      children: [
        buildVSpacer(20),
        _buildText(
            title: "Availability of Stock",
            color: const Color(0xffF4BC1C),
            fontWeight: FontWeight.bold,
            size: 16),
        buildVSpacer(20),
        _buildText(title: "Type of Crop", color: const Color(0xffF4BC1C)),
        buildCustomTextFieldWithDropdown(),
        buildVSpacer(20),
        _buildText(title: "Variety", color: const Color(0xffF4BC1C)),
        buildCustomTextFieldWithDropdown(),
        buildVSpacer(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'From',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: Colors.amber),
                ),
                SizedBox(
                  width: Adaptive.w(35),
                  height: Adaptive.h(6),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        suffixIcon: Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'To',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: Colors.amber),
                ),
                SizedBox(
                  width: Adaptive.w(35),
                  height: Adaptive.h(6),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        suffixIcon: Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
        buildVSpacer(20),
        _buildText(title: "Quantity (approx) ", color: const Color(0xffF4BC1C)),
        buildCustomTextField3(
          hintText: "Select Quantity",
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF4BC1C),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: _buildTextHeader(title: "Ton", size: 12),
              ),
            ),
            buildHSpacer(5),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: _buildTextHeader(title: "QT", size: 12),
              ),
            ),
            buildHSpacer(5),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF4BC1C),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildTextHeader(title: "Kg", size: 12),
              ),
            ),
            buildHSpacer(5),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF4BC1C),
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: Adaptive.w(4), vertical: Adaptive.h(1)),
              child: _buildTextHeader(title: "Packet", size: 12),
            ),
          ],
        ),
        buildVSpacer(20),
        _buildText(
            title: "Min Price (approx) ", color: const Color(0xffF4BC1C)),
        buildCustomTextField3(hintText: ""),
        buildVSpacer(20),
        _buildText(
            title: "Total Cost (approx) ", color: const Color(0xffF4BC1C)),
        buildCustomTextField3(hintText: ""),
        buildVSpacer(20),
        _buildText(title: "Add Product Images", color: const Color(0xffF4BC1C)),
        buildVSpacer(10),
        Image.asset("assets/add_image.png"),
        buildVSpacer(20),
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
                children: [
                  buildVSpacer(10),
                  _buildText(title: "Moisture", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText(title: "Color", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText(
                      title: "Extraneous", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText(
                      title: "Foriegn Matter", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText(
                      title: "Other Crop", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                ],
              )
            : const SizedBox(),
        buildVSpacer(3.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.sp),
          ),
          child: Column(
            children: [
              Container(
                height: Adaptive.h(5),
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    color: const Color(0xffF4BC1C),
                    borderRadius: BorderRadius.circular(12.sp)),
                child: Row(
                  children: [
                    Text(
                      'Payment & Delivery',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500, fontSize: 10.px),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Column(
                  children: [
                    paymentWidgetMethod(titile: "Payment", title2: "D+15 days"),
                    buildVSpacer(3.h),
                    paymentWidgetMethod(
                        titile: "Delivery date", title2: "T+12 days"),
                    buildVSpacer(3.h),
                    paymentWidgetMethod(
                        titile: "Other Charges", title2: "5/QT"),
                    buildVSpacer(3.h),
                    paymentWidgetMethod(titile: "Remarks", title2: "N/A"),
                    buildVSpacer(3.h),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              'Upload Document',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500, fontSize: 12.px),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: Adaptive.h(5),
                              decoration: BoxDecoration(
                                color: const Color(0xffF4BC1C),
                                borderRadius: BorderRadius.circular(12.sp),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/ph_upload-duotone.png'),
                                  buildHSpacer(2.w),
                                  Text(
                                    'Add document',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.px),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          width: Adaptive.w(10),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Adaptive.w(88),
                  child: Row(
                    children: [
                      Checkbox(
                        value: value,
                        onChanged: (bool? newValue) {
                          setState(() {
                            value = newValue ??
                                false; // Update the value of the checkbox
                          });
                        },
                        activeColor: const Color(0xffF4BC1C),
                      ),
                      Text(
                        "Mitra Verification",
                        style: GoogleFonts.poppins(
                            color: const Color(0xffF4BC1C), fontSize: 10.px),
                      ),
                      const Spacer(),
                      Text(
                        "Ad Posted Location",
                        style: GoogleFonts.poppins(
                            color: const Color(0xffF4BC1C), fontSize: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Adaptive.w(88),
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (bool? newValue) {
                          setState(() {
                            value = newValue ??
                                false; // Update the value of the checkbox
                          });
                        },
                        activeColor: const Color(0xffF4BC1C),
                      ),
                      Text(
                        "Terms & Conditions",
                        style: GoogleFonts.poppins(
                            color: const Color(0xffF4BC1C), fontSize: 10.px),
                      ), // Optional: Add a label next to the checkbox
                      // buildHSpacer(50),
                      const Spacer(),
                      Image.asset('assets/Rectangle 409.png'),
                      // buildHSpacer(10.w)
                    ],
                  ),
                ),
              ],
            ),
            // Spacer(),
            // Image.asset("assets/locate.png")
          ],
        ),
        buildVSpacer(10.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: CustomButton(
              text: "Submit",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PublishedBuyScreen(),
                    ));
              }),
        ),
        buildVSpacer(18.h)
      ],
    );
  }

  Flex paymentWidgetMethod({required String titile, required String title2}) {
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
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                hintText: title2,
                hintStyle: GoogleFonts.lato(
                    fontWeight: FontWeight.w600, fontSize: 10.px, color: black),
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

  Column myAdMethod(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Image.asset("assets/banner.png"),
        const SizedBox(height: 20),
        _buildText(
            title: "Overview",
            color: Colors.white,
            fontWeight: FontWeight.bold),
        const SizedBox(height: 20),
        Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => MyAdonTapScreen(),
                //   ),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
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
                              _buildText(title: "Wheat", size: 18),
                              _buildText(
                                  title: "Variety :  v1,Sharbati", size: 11),
                              _buildText(
                                  title: "Location : Jabalpur", size: 11),
                            ],
                          )
                        ],
                      ),
                      buildVSpacer(10),
                      Row(
                        children: [
                          _buildText(title: "Quantity (approx.)"),
                          const Spacer(),
                          _buildText(title: "100 QT"),
                        ],
                      ),
                      buildVSpacer(10),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffF4BC1C),
                        ),
                        height: 1,
                      ),
                      Row(
                        children: [
                          _buildText(title: "Min-Price (approx.)"),
                          const Spacer(),
                          _buildText(title: "₹ 2,400.00"),
                        ],
                      ),
                      buildVSpacer(10),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffF4BC1C),
                        ),
                        height: 1,
                      ),
                      Row(
                        children: [
                          _buildText(title: "Total Cost (approx.)"),
                          const Spacer(),
                          _buildText(title: "₹ 2,40,000.00"),
                        ],
                      ),
                      buildVSpacer(10),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF4BC1C),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.all(12.sp),
                        child: _buildText(
                            title:
                                "Description : Turmeric, a plant in the ginger family, is native to South east Asia and is grown commercially in that region.",
                            size: 11.px),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -18,
              left: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xffA76012),
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
          ],
        ),
        const SizedBox(height: 20),
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
                children: [
                  buildVSpacer(10),
                  _buildText(title: "Moisture", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText(title: "Color", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText(
                      title: "Extraneous", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText(
                      title: "Foriegn Matter", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText(
                      title: "Other Crop", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                ],
              )
            : const SizedBox(),
        buildVSpacer(3.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.sp),
          ),
          child: Column(
            children: [
              Container(
                height: Adaptive.h(5),
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    color: const Color(0xffF4BC1C),
                    borderRadius: BorderRadius.circular(12.sp)),
                child: Row(
                  children: [
                    Text(
                      'Payment & Delivery',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500, fontSize: 10.px),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Column(
                  children: [
                    paymentWidgetMethod(titile: "Payment", title2: "D+15 days"),
                    buildVSpacer(3.h),
                    paymentWidgetMethod(
                        titile: "Delivery date", title2: "T+12 days"),
                    buildVSpacer(3.h),
                    paymentWidgetMethod(
                        titile: "Other Charges", title2: "5/QT"),
                    buildVSpacer(3.h),
                    paymentWidgetMethod(titile: "Remarks", title2: "N/A"),
                    buildVSpacer(3.h),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              'Upload Document',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500, fontSize: 12.px),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: Adaptive.h(5),
                              decoration: BoxDecoration(
                                color: const Color(0xffF4BC1C),
                                borderRadius: BorderRadius.circular(12.sp),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/ph_upload-duotone.png'),
                                  buildHSpacer(2.w),
                                  Text(
                                    'Add document',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.px),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          width: Adaptive.w(10),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        buildVSpacer(2.h),
        _buildText(
            title: "Views", color: Colors.white, fontWeight: FontWeight.bold),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ReportScreen(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffF4BC1C),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ReportScreen(),
                    ),
                  );
                },
                child: _buildText(
                  title: "View - 12",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildText(
            title: "Your Ad Expiry",
            color: Colors.white,
            fontWeight: FontWeight.bold),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffF4BC1C),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextButton(
              onPressed: () {
                // Button action
              },
              child: _buildText(
                title: "Posted : 20-09-2023 Expires : 20-10-2023",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildText(
            title: "Ad Posted Location",
            color: Colors.white,
            fontWeight: FontWeight.bold),
        const SizedBox(height: 20),
        Image.asset('assets/map.png'),
        const SizedBox(height: 20),
        buildVSpacer(2.h),
        CompletedScreenFieldWidget(title: 'MITRA INFORMATION'),
        buildVSpacer(2.h),
        CompletedScreenFieldWidget(title: 'BUYER INFORMATION'),
        buildVSpacer(2.h),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffF4BC1C),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    // Edit button action
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostBuyAdScreen(),
                        ));
                  },
                  icon: const Icon(Icons.edit, color: Colors.black),
                  label: const Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    // Delete button action
                    showCustomDialogProfile(context);
                  },
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        buildVSpacer(2.h),
        CustomButton(
          text: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
          color: buttonColor,
        ),
        SizedBox(height: 19.h),
      ],
    );
  }

  Widget buildCustomTextFieldWithDropdown() {
    return Container(
      height: Adaptive.h(6),
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

Widget _buildText(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black),
    ),
  );
}

Widget _buildText1(
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
