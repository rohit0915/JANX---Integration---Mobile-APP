import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_detils/product_order_details_screen.dart';
import 'package:jan_x/order_summary/order_summary_from_my_orders.dart';
import 'package:jan_x/order_summary/order_summary_from_sample_drop.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SampleDropScreen extends StatefulWidget {
  const SampleDropScreen({super.key});

  @override
  State<SampleDropScreen> createState() => _SampleDropScreenState();
}

class _SampleDropScreenState extends State<SampleDropScreen> {
  bool isClicked1 = false;

  bool isClicked2 = false;
  bool isClicked = false;

  @override
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
              size: 18.sp,
            )),
        title: _buildText(
            title: "Sample Drop",
            fontWeight: FontWeight.w700,
            size: 24.px,
            color: white),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildVSpacer(3.h),
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
                  Image.asset('assets/inspectionimg1.png')
                ],
              ),
              buildVSpacer(3.h),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildText(
                    title: "Results 1/1",
                    size: 10.px,
                    color: white,
                    fontWeight: FontWeight.w600),
              ),
              buildVSpacer(3.h),
              saleProducMethod(context),
              buildVSpacer(2.h),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildText(
                        title: "Which store did you like to drop your sample",
                        size: 14.px,
                        fontWeight: FontWeight.w700,
                        color: white),
                  ),
                  buildVSpacer(2.h),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isClicked1 = !isClicked1;
                        });
                      },
                      child: sampleDropMethod(
                          img: "sampledrop1", title: "Select City")),
                  buildVSpacer(1.h),
                  isClicked1
                      ? Container(
                          width: Adaptive.w(100),
                          padding: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.sp),
                              border: Border.all(color: white)),
                          child: Padding(
                            padding: EdgeInsets.only(left: Adaptive.w(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildText(
                                    title: "Mumbai", size: 14.px, color: white),
                                buildVSpacer(1.h),
                                _buildText(
                                    title: "Pune", size: 14.px, color: white),
                                buildVSpacer(1.h),
                                _buildText(
                                    title: "Banglore",
                                    size: 14.px,
                                    color: white),
                                buildVSpacer(1.h),
                                _buildText(
                                    title: "jabalapur",
                                    size: 14.px,
                                    color: white),
                                buildVSpacer(1.h),
                                _buildText(
                                    title: "Delhi", size: 14.px, color: white)
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  buildVSpacer(1.h),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isClicked2 = !isClicked2;
                        });
                      },
                      child: sampleDropMethod(
                          img: "sampledrop1", title: "Select Jan-X Center")),
                  buildVSpacer(2.h),
                  isClicked2
                      ? Container(
                          width: Adaptive.w(100),
                          padding: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.sp),
                              border: Border.all(color: white)),
                          child: Padding(
                            padding: EdgeInsets.only(left: Adaptive.w(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildText(
                                    title: "Jabalpur Center-01",
                                    size: 14.px,
                                    color: white),
                                buildVSpacer(1.h),
                                _buildText(
                                    title: "Jabalpur Center-02",
                                    size: 14.px,
                                    color: white),
                                buildVSpacer(1.h),
                                _buildText(
                                    title: "Jabalpur Center-03",
                                    size: 14.px,
                                    color: white),
                                buildVSpacer(1.h),
                                _buildText(
                                    title: "Jabalpur Center-04",
                                    size: 14.px,
                                    color: white),
                                buildVSpacer(1.h),
                                _buildText(
                                    title: "Jabalpur Center-05",
                                    size: 14.px,
                                    color: white)
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  isClicked == false
                      ? const SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: _buildText(
                                title: "Sample Drop Center Location :",
                                size: 14.px,
                                fontWeight: FontWeight.w700,
                                color: white,
                              ),
                            ),
                            buildVSpacer(2.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/sample.png'),
                                buildHSpacer(3.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: main,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: _buildText(
                                          title:
                                              "Jabalpur Center -02 ,  Jabalpur ",
                                          size: 12.px,
                                          color: white),
                                    ),
                                    buildVSpacer(2.h),
                                    _buildText(
                                        title:
                                            "Ground Floor JP Tower Plot No 231 P h No 23 28\nold New No 16 Survey No 129 7 2 129 10 2\nMaujhe Tilhari\nJabalpur 482020 Madhya Pradesh",
                                        size: 12.px,
                                        color: white),
                                    buildVSpacer(2.h),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: _buildText(
                                          title: "PH.No : 256723456",
                                          size: 12.px,
                                          color: white),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                  buildVSpacer(12.h),
                  CustomButton3(
                    text: "Next",
                    onPressed: () {
                      if (!isClicked) {
                        setState(() {
                          isClicked = true;
                        });
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const OrderSummaryFromSampleDropScreen(),
                            ));
                      }
                    },
                    size: 19.px,
                    weight: FontWeight.w500,
                    color: buttonColor,
                  ),
                  buildVSpacer(6.h),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container sampleDropMethod({
    required String img,
    required String title,
  }) {
    return Container(
      height: Adaptive.h(6),
      width: Adaptive.w(100),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          border: Border.all(
            color: white,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/$img.png'),
            _buildText(
                title: title,
                size: 14.px,
                fontWeight: FontWeight.w400,
                color: white),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_down,
              color: white,
            )
          ],
        ),
      ),
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      const ProductOrderDetailsScreen(isFromTrade: true),
                ),
              );
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
      textAlign: TextAlign.left,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
