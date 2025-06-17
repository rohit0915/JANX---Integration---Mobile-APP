import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/report_screen/report_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CompleteInspectionWidget extends StatefulWidget {
  const CompleteInspectionWidget({super.key});

  @override
  State<CompleteInspectionWidget> createState() =>
      _CompleteInspectionWidgetState();
}

class _CompleteInspectionWidgetState extends State<CompleteInspectionWidget> {
  bool isClick1 = true;
  bool isClick2 = false;
  bool isClick3 = false;
  String text = "5%";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [inProgressMethod(context)],
    );
  }

  inProgressMethod(BuildContext context) {
    return Column(
      children: [
        buildVSpacer(2.h),
        saleProducMethod(context),
        buildVSpacer(3.h),
        Align(
            alignment: Alignment.centerLeft,
            child: _buildText(
                title: "Inspection Status",
                size: 14.px,
                fontWeight: FontWeight.w800,
                color: white)),
        buildVSpacer(1.h),
        Container(
          width: Adaptive.w(100),
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
                title: "Completed",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        buildVSpacer(3.h),
        Align(
            alignment: Alignment.centerLeft,
            child: _buildText(
                title: "Inspection Report",
                size: 14.px,
                fontWeight: FontWeight.w800,
                color: white)),
        buildVSpacer(1.h),
        Container(
          width: Adaptive.w(100),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ReportScreen(),
                  ),
                );
              },
              child: _buildText(
                title: "View/ Download",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        buildVSpacer(2.h),
        Align(
            alignment: Alignment.centerLeft,
            child: _buildText(
                title: "Inspection Grade%",
                size: 14.px,
                fontWeight: FontWeight.w800,
                color: white)),
        buildVSpacer(2.h),
        Container(
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp), color: white),
          child: Column(
            children: [
              buildVSpacer(2.h),
              Row(
                children: [
                  _buildText(
                      title: "Grade (%)",
                      size: 10.px,
                      fontWeight: FontWeight.w500),
                  buildHSpacer(17.w),
                  Container(
                    height: Adaptive.h(5),
                    width: Adaptive.w(45),
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        borderRadius: BorderRadius.circular(12.sp)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        isClick1
                            ? _buildText(title: text, color: Colors.red)
                            : isClick2
                                ? _buildText(title: text, color: Colors.green)
                                : isClick3
                                    ? _buildText(
                                        title: text, color: Colors.black)
                                    : SizedBox(),
                      ],
                    ),
                  )
                ],
              ),
              buildVSpacer(2.h),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: isClick1
                        ? CustomButton3(
                            height: 5.h,
                            size: 10.px,
                            weight: FontWeight.w700,
                            text: "Discount",
                            onPressed: () {
                              setState(() {
                                isClick1 = true;
                                isClick2 = false;
                                isClick3 = false;
                                text = "5 %";
                              });
                            },
                            width: Adaptive.w(35),
                            borderColor: Colors.red,
                            textColor: white,
                            color: Colors.red,
                          )
                        : CustomButton3(
                            height: 5.h,
                            size: 10.px,
                            weight: FontWeight.w700,
                            text: "Discount",
                            onPressed: () {
                              setState(() {
                                isClick1 = true;
                                isClick2 = false;
                                isClick3 = false;
                                text = "5 %";
                              });
                            },
                            width: Adaptive.w(35),
                            borderColor: black,
                            color: white,
                          ),
                  ),
                  buildHSpacer(5.w),
                  Expanded(
                    flex: 1,
                    child: isClick2
                        ? CustomButton3(
                            height: 5.h,
                            size: 10.px,
                            weight: FontWeight.w700,
                            text: "Premium",
                            textColor: white,
                            onPressed: () {
                              setState(() {
                                isClick1 = false;
                                isClick2 = true;
                                isClick3 = false;
                                text = "5 %";
                              });
                            },
                            width: Adaptive.w(35),
                            borderColor: Colors.green,
                            color: Colors.green,
                          )
                        : CustomButton3(
                            height: 5.h,
                            size: 10.px,
                            weight: FontWeight.w700,
                            text: "Premium",
                            onPressed: () {
                              setState(() {
                                isClick1 = false;
                                isClick2 = true;
                                isClick3 = false;
                                text = "5 %";
                              });
                            },
                            width: Adaptive.w(35),
                            borderColor: black,
                            color: white,
                          ),
                  ),
                  buildHSpacer(5.w),
                  Expanded(
                    flex: 1,
                    child: isClick3
                        ? CustomButton3(
                            height: 5.h,
                            size: 10.px,
                            weight: FontWeight.w700,
                            text: "Market Rate",
                            onPressed: () {
                              isClick1 = false;
                              isClick2 = false;
                              isClick3 = true;
                              text = "0 %";
                            },
                            width: Adaptive.w(35),
                            borderColor: black,
                            color: white,
                          )
                        : CustomButton3(
                            height: 5.h,
                            size: 10.px,
                            weight: FontWeight.w700,
                            text: "Market Rate",
                            onPressed: () {
                              isClick1 = false;
                              isClick2 = false;
                              isClick3 = true;
                              text = "0 %";
                            },
                            width: Adaptive.w(35),
                            borderColor: black,
                            color: white,
                          ),
                  )
                ],
              ),
              buildVSpacer(2.h),
              _buildText(
                  title:
                      "data will be fetched automatically from backend/not manual",
                  size: 10.px,
                  fontWeight: FontWeight.w600)
            ],
          ),
        ),
       
      ],
    );
  }

  Widget saleProducMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         const ProductOrderDetailsScreen(isFromTrade: true),
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
                            _buildText(title: "Wheat", size: 18),
                            _buildText(
                                title: "Variety :  v1,Sharbati", size: 11),
                            _buildText(title: "Location : Jabalpur", size: 11),
                          ],
                        ),
                        // const Spacer(),
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
                          _buildText(title: "Quantity (approx.)"),
                          const Spacer(),
                          _buildText(title: "100 QT"),
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
                          _buildText(title: "Min-Price (approx.)"),
                          const Spacer(),
                          _buildText(title: "₹ 2,400.00"),
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
                          _buildText(title: "Total Cost (approx.)"),
                          const Spacer(),
                          _buildText(title: "₹ 2,40,000.00"),
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
