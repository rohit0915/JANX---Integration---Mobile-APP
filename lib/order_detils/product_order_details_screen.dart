// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_summary/order_summary_from_my_orders.dart';
import 'package:jan_x/post_sell_ad/call_screen/call_screen.dart';
import 'package:jan_x/post_sell_ad/chat_screen/chat_screen.dart';
import 'package:jan_x/post_sell_ad/view_details/view_details_screen.dart';
import 'package:jan_x/post_sell_ad/widgets/post_sell_widgets_widget.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductOrderDetailsScreen extends StatelessWidget {
  const ProductOrderDetailsScreen({super.key, this.isFromTrade = false});
  final bool isFromTrade;

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
            title: "Product Detail",
            color: white,
            size: 22.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
        // actions: [
        //   isFromTrade == false ? Image.asset('assets/order1.png') : SizedBox(),
        //   buildHSpacer(3.w)
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.w(2),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildVSpacer(2.h),
              Image.asset('assets/orderDetails1.png'),
              buildVSpacer(2.h),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildText(
                    title: "Overview",
                    color: white,
                    size: 14.px,
                    fontWeight: FontWeight.w800),
              ),
              buildVSpacer(2.h),
              _itemMethod(),
              buildVSpacer(2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildText(
                      title: "Other Details (optional)",
                      size: 15.px,
                      fontWeight: FontWeight.w500,
                      color: buttonColor),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: buttonColor,
                  )
                ],
              ),
              buildVSpacer(2.h),
              CompleteInspectionWidget2(title: "Inspection"),
              buildVSpacer(2.h),
            CompletedScreenFieldWidget(
              title: 'MITRA INFORMATION',
              title2: "MITRA INFORMATION",
              id: "Mitra ID",
            ),
              buildVSpacer(2.h),
              CompletedScreenFieldWidget(title: "SELLER Information"),
              buildVSpacer(2.h),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildText(
                    title: "Ad Posted Location",
                    size: 14.px,
                    fontWeight: FontWeight.w800,
                    color: white),
              ),
              buildVSpacer(1.h),
              Image.asset('assets/orderDetailsmap.png'),
              buildVSpacer(15.h),
            isFromTrade==false?  CustomButton(
                text: "Add To Cart",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderSummaryFromMyOrdersScreen(),
                      ));
                },
                color: buttonColor,
              ): CustomButton(
                text: "Back",
                onPressed: () {
                  Navigator.pop(context);
                },
                color: buttonColor,
              ),
              buildVSpacer(5.h)
            ],
          ),
        ),
      ),
    );
  }

  Padding _itemMethod() {
    return Padding(
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
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
                            _buildText1(title: "Location : Jabalpur", size: 11),
                          ],
                        ),
                        const Spacer(),
                        // CircleAvatar(
                        //   radius: Adaptive.w(5),
                        //   backgroundColor: const Color(0xffD9D9D9),
                        //   child: const Center(
                        //     child: Icon(
                        //       Icons.favorite,
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        // )
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
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     CustomButton3(
                    //       text: "Add To Cart",
                    //       onPressed: () {},
                    //       borderColor: buttonColor,
                    //       color: buttonColor,
                    //       width: Adaptive.w(45),
                    //       size: 12.px,
                    //       height: Adaptive.h(6),
                    //     ),
                    //   ],
                    // ),
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
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
class CompletedScreenFieldWidget extends StatefulWidget {
  CompletedScreenFieldWidget(
      {super.key,
      required this.title,
      this.title2 = '',
      this.isBlur = false,
      this.id = ''});
  final String title;
  String title2;
  String id;
  bool isBlur;
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
            isClicked==false?    const Icon(
                  Icons.keyboard_arrow_down,
                  color: grey,
                ): const Icon(
                  Icons.keyboard_arrow_up,
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
                      child: widget.title2.isNotEmpty
                          ? Text(
                              widget.title2,
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.px,
                                  color: grey),
                            )
                          : Text(
                              'Seller information',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.px,
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
                        widget.id.isNotEmpty
                            ? Row(
                                children: [
                                  Text(
                                    widget.id,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.px,
                                        color: black),
                                  ),
                                  Text(
                                    "-000023",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.px,
                                        color: buttonColor),
                                  )
                                ],
                              )
                            : Text(
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
                        widget.id.isNotEmpty
                            ? Text(
                                '+91 1234567890',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.px,
                                    color: black),
                              )
                            : Text(
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
                    widget.isBlur
                        ? CustomButton(
                            color: buttonColor.withOpacity(0.4),
                            text: 'View Details',
                            textColor: black.withOpacity(0.5),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => ViewDetailsScreen(),
                              //     ));
                            })
                        : CustomButton(
                            text: 'View Details',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ViewDetailsScreen(),
                                  ));
                            }),
                    buildVSpacer(2.h),
                    widget.isBlur
                        ? Container(
                            padding: EdgeInsets.all(12.sp),
                            color: buttonColor.withOpacity(0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                    text: 'Chat',
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => ChatScreen(),
                                      //     ));
                                    },
                                    width: Adaptive.w(33),
                                    color: white.withOpacity(0.4),
                                    textColor: black.withOpacity(0.4)),
                                CustomButton3(
                                    text: 'Call',
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => CallScreen(),
                                      //     ));
                                    },
                                    width: Adaptive.w(33),
                                    color: black.withOpacity(0.4),
                                    textColor: white.withOpacity(0.4))
                              ],
                            ),
                          )
                        : Container(
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
}
