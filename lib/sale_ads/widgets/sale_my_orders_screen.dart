import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/sale_ads/track_order/track_order_screen.dart';
import 'package:jan_x/sale_ads/widgets/sale_order_tracking_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SaleMyOrder extends StatefulWidget {
  const SaleMyOrder({super.key, required this.isOrderReady});
  final bool isOrderReady;
  @override
  State<SaleMyOrder> createState() => _SaleMyOrderState();
}

class _SaleMyOrderState extends State<SaleMyOrder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
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
                          Image.asset("assets/pro.png"),
                          buildHSpacer(10),
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
                          ),
                          // const Spacer(),
                          // CircleAvatar(
                          //   radius: Adaptive.w(5),
                          //   backgroundColor: const Color(0xffD9D9D9),
                          //   child: const Center(
                          //     child: Icon(
                          //       Icons.favorite,
                          //       color: Colors.white,
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
                      buildVSpacer(6.h),
                      Stack(
                        children: [
                          Container(
                            width: Adaptive.w(100),
                            padding: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                                color: const Color(0xffF4BC1C),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.sp),
                                    topRight: Radius.circular(12.sp))),
                            child: Column(
                              children: [
                                buildVSpacer(4.h),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/Mask group.png'),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18.sp),
                                              color: white),
                                          height: Adaptive.h(3),
                                          padding: const EdgeInsets.all(2),
                                          child: Row(children: [
                                            Text(
                                              '4.5',
                                              style: GoogleFonts.lato(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.sp),
                                            ),
                                            ...List.generate(3, (index) {
                                              return SizedBox(
                                                height: 3.h,
                                                child: const Icon(
                                                  Icons.star,
                                                  size:
                                                      12, // Adjust size as needed
                                                  color: Colors
                                                      .black, // Adjust color as needed
                                                ),
                                              );
                                            }),
                                          ]),
                                        ),
                                      ],
                                    ),
                                    buildHSpacer(3.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Rahul Tiwari',
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.px),
                                        ),
                                        buildVSpacer(2.h),
                                        Text(
                                          'Mobile   :  +91 1234567890',
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 9.px),
                                        ),
                                        buildVSpacer(2.h),
                                        Text(
                                          'Address : Mg-Road , Street No: 6 , 9th Cross, Beside\nCanara Bank , Bengaluru , Kanataka - 560001',
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 8.px),
                                        ),
                                        buildVSpacer(2.h),
                                        widget.isOrderReady == false
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  buildHSpacer(8.w),
                                                  Center(
                                                    child: CustomButton3(
                                                      height: 5.h,
                                                      width: Adaptive.w(32),
                                                      text: "Track Order",
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const TrackOrderScreen(),
                                                          ),
                                                        );
                                                      },
                                                      color: white,
                                                      size: 10.px,
                                                    ),
                                                  )
                                                ],
                                              )
                                            : const SizedBox()
                                      ],
                                    )
                                  ],
                                ),
                                buildVSpacer(2.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                      buildVSpacer(5.h),
                      widget.isOrderReady == true
                          ? Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                    text: "Order Status",
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SaleOrderStatusScreen(),
                                          ));
                                    },
                                    color: buttonColor,
                                    size: 10.px,
                                  ),
                                ),
                                buildHSpacer(8.w),
                                Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                    text: "Cancel Order",
                                    onPressed: () {
                                      showCustomDialog(context);
                                    },
                                    color: buttonColor,
                                    size: 10.px,
                                  ),
                                ),
                                buildVSpacer(3.h),
                              ],
                            )
                          : const SizedBox(),
                      buildVSpacer(3.h),
                    ],
                  ),
                ),
              ],
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
          Positioned(
            bottom: Adaptive.h(32),
            left: Adaptive.w(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xff5EAB04),
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
                        "Wish OD ID : 400001",
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
}

Widget _buildText(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 18.0,
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

Future<void> showCustomDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible:
        false, // Set to true if you want to dismiss the dialog by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: white,
        surfaceTintColor: white,
        contentPadding: const EdgeInsets.all(0), // Remove default padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 16.0, right: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildVSpacer(5.h),
                  const Text(
                    "Are you\nsure that you want to\nCancel the order?",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: buttonColor),
                    textAlign: TextAlign.center,
                  ),
                  buildVSpacer(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton3(
                        text: "Yes",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: buttonColor,
                        width: Adaptive.w(30),
                        height: Adaptive.h(5),
                        size: 12.px,
                        weight: FontWeight.w700,
                      ),
                      buildHSpacer(8.w),
                      CustomButton3(
                        text: "No",
                        height: Adaptive.h(5),
                        size: 12.px,
                        weight: FontWeight.w700,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: buttonColor,
                        width: Adaptive.w(30),
                      )
                    ],
                  ),
                  buildVSpacer(5.h)
                ],
              ),
            ),
            Positioned(
                top: -Adaptive.h(0.3.h),
                right: -Adaptive.w(2),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: Adaptive.w(5),
                    backgroundColor: black,
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        color: white,
                      ),
                    ),
                  ),
                )
                // IconButton(
                //   icon: Icon(Icons.close),
                //   onPressed: () {
                //     Navigator.of(context).pop(false); // Close dialog with No action
                //   },
                // ),
                ),
          ],
        ),
      );
    },
  );
}
