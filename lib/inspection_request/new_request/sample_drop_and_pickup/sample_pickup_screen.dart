import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_detils/product_order_details_screen.dart';
import 'package:jan_x/order_summary/order_summary_from_my_orders.dart';
import 'package:jan_x/post_sell_ad/add_location/add_location_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SamplePickupScreen extends StatefulWidget {
  const SamplePickupScreen({super.key});

  @override
  State<SamplePickupScreen> createState() => _SamplePickupScreenState();
}

class _SamplePickupScreenState extends State<SamplePickupScreen> {
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
            title: "Sample Pick-Up",
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
                  buildVSpacer(2.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildText(
                        title: "Select Date",
                        size: 12.px,
                        fontWeight: FontWeight.w800,
                        color: white),
                  ),
                  buildVSpacer(1.h),
                  sampleDropMethod(img: "sample_pickup1", title: ""),
                  buildVSpacer(2.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildText(
                        title: "Select Timing",
                        size: 12.px,
                        fontWeight: FontWeight.w800,
                        color: white),
                  ),
                  buildVSpacer(1.h),
                  sampleDropMethod(img: "sample_pickup2", title: ""),
                  buildVSpacer(2.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildText(
                        title: "Choose Inspector",
                        size: 12.px,
                        fontWeight: FontWeight.w800,
                        color: white),
                  ),
                  buildVSpacer(1.h),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddLocationScreen(),
                            ));
                      },
                      child: sampleDropMethod(
                          img: "", title: "Search...by 201301,Noida")),
                ],
              ),
              buildVSpacer(12.h),
              CustomButton3(
                text: "Schedule Inspection",
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const OrderSummaryFromMyOrdersScreen(
                                isOrderDetails: true),
                      ));
                },
                size: 17.px,
                weight: FontWeight.w500,
                color: buttonColor,
              ),
              buildVSpacer(6.h),
            ],
          ),
        ),
      ),
    );
  }

  Container sampleDropMethod({
    String img = '',
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
            _buildText(
                title: title,
                size: 14.px,
                fontWeight: FontWeight.w400,
                color: white.withOpacity(0.4)),
            const Spacer(),
            img.isNotEmpty ? Image.asset('assets/$img.png') : const SizedBox()
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
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
