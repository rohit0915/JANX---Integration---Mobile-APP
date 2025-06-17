import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/post_sell_ad/call_screen/call_screen.dart';
import 'package:jan_x/post_sell_ad/chat_screen/chat_screen.dart';
import 'package:jan_x/post_sell_ad/view_details/view_details_screen.dart';
import 'package:jan_x/report_screen/report_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CompletedContentPostBuy extends StatefulWidget {
  @override
  _CompletedContentPostBuyState createState() => _CompletedContentPostBuyState();
}
  bool isOtherServiceClicked=false;

class _CompletedContentPostBuyState extends State<CompletedContentPostBuy> {
  bool isClickedCompleted = false;
  bool isClickedCompleted2=false;
  @override
  Widget build(BuildContext context) {
    return isClickedCompleted2==false? SingleChildScrollView(
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
                  setState(() {
                    isClickedCompleted2=!isClickedCompleted2;
                  });
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
                                child: _buildText1(
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
    ):myAdMethod(context);
 
  }

  Column myAdMethod(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Image.asset("assets/banner.png"),
        const SizedBox(height: 20),
        _buildText1(
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
                              _buildText1(title: "Wheat", size: 18),
                              _buildText1(
                                  title: "Variety :  v1,Sharbati", size: 11),
                              _buildText1(
                                  title: "Location : Jabalpur", size: 11),
                            ],
                          )
                        ],
                      ),
                      buildVSpacer(10),
                      Row(
                        children: [
                          _buildText1(title: "Quantity (approx.)"),
                          const Spacer(),
                          _buildText1(title: "100 QT"),
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
                          _buildText1(title: "Min-Price (approx.)"),
                          const Spacer(),
                          _buildText1(title: "₹ 2,400.00"),
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
                          _buildText1(title: "Total Cost (approx.)"),
                          const Spacer(),
                          _buildText1(title: "₹ 2,40,000.00"),
                        ],
                      ),
                      buildVSpacer(10),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF4BC1C),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.all(12.sp),
                        child: _buildText1(
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
              _buildText1(
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
                  _buildText1(title: "Moisture", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText1(title: "Color", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText1(
                      title: "Extraneous", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText1(
                      title: "Foriegn Matter", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText1(
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
        _buildText1(
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
                child: _buildText1(
                  title: "View - 12",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildText1(
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
              child: _buildText1(
                title: "Posted : 20-09-2023 Expires : 20-10-2023",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildText1(
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
}

class CompletedScreenFieldWidget extends StatefulWidget {
  CompletedScreenFieldWidget({super.key, required this.title});
  final String title;
  @override
  State<CompletedScreenFieldWidget> createState() =>
      _CompletedScreenFieldWidgetState();
}

class _CompletedScreenFieldWidgetState
    extends State<CompletedScreenFieldWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: Container(
            height: Adaptive.h(7),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                color: white,
                border: Border.all(
                  color: buttonColor,
                ),
                borderRadius: BorderRadius.circular(14.sp)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.px,
                      color: grey),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: grey,
                )
              ],
            ),
          ),
        ),
        buildVSpacer(3.h),
        isClicked
            ? Container(
                width: Adaptive.w(100),
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(
                    color: buttonColor,
                  ),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Seller information',
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.px,
                            color: grey),
                      ),
                    ),
                    buildVSpacer(2.h),
                    const Divider(
                      thickness: 1,
                      color: buttonColor,
                    ),
                    buildVSpacer(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Seller name',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.px,
                              color: black),
                        ),
                        Text(
                          'Ajeet Kumar',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.px,
                              color: black),
                        ),
                      ],
                    ),
                    buildVSpacer(2.h),
                    const Divider(
                      thickness: 1,
                      color: buttonColor,
                    ),
                    buildVSpacer(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mobile No',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.px,
                              color: black),
                        ),
                        Text(
                          '+91 12****90',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.px,
                              color: black),
                        ),
                      ],
                    ),
                    buildVSpacer(2.h),
                    const Divider(
                      thickness: 1,
                      color: buttonColor,
                    ),
                    buildVSpacer(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rating',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.px,
                              color: black),
                        ),
                        Image.asset('assets/Group 297.png')
                      ],
                    ),
                    buildVSpacer(2.h),
                    CustomButton(
                        text: 'View Details',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ViewDetailsScreen(),
                              ));
                        }),
                    buildVSpacer(2.h),
                    Container(
                      padding: EdgeInsets.all(12.sp),
                      color: buttonColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                              text: 'Chat',
                              onPressed: () {
                                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChatScreen(),
                              ));
                              },
                              width: Adaptive.w(33),
                              color: white,
                              textColor: black),
                          CustomButton(
                              text: 'Call',
                              onPressed: () {
                                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CallScreen(),
                              ));
                              },
                              width: Adaptive.w(33),
                              color: black,
                              textColor: white)
                        ],
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox()
      ],
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
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black),
    ),
  );
}

  Column myAdMethod(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Image.asset("assets/banner.png"),
        const SizedBox(height: 20),
        _buildText1(
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
                              _buildText1(title: "Wheat", size: 18),
                              _buildText1(
                                  title: "Variety :  v1,Sharbati", size: 11),
                              _buildText1(
                                  title: "Location : Jabalpur", size: 11),
                            ],
                          )
                        ],
                      ),
                      buildVSpacer(10),
                      Row(
                        children: [
                          _buildText1(title: "Quantity (approx.)"),
                          const Spacer(),
                          _buildText1(title: "100 QT"),
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
                          _buildText1(title: "Min-Price (approx.)"),
                          const Spacer(),
                          _buildText1(title: "₹ 2,400.00"),
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
                          _buildText1(title: "Total Cost (approx.)"),
                          const Spacer(),
                          _buildText1(title: "₹ 2,40,000.00"),
                        ],
                      ),
                      buildVSpacer(10),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF4BC1C),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.all(12.sp),
                        child: _buildText1(
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
              _buildText1(
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
                  _buildText1(title: "Moisture", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText1(title: "Color", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText1(
                      title: "Extraneous", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText1(
                      title: "Foriegn Matter", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText1(
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
        _buildText1(
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
                child: _buildText1(
                  title: "View - 12",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildText1(
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
              child: _buildText1(
                title: "Posted : 20-09-2023 Expires : 20-10-2023",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildText1(
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

}
