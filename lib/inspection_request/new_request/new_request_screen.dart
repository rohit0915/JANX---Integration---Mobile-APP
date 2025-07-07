import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/inspection_request/new_request/sample_drop_and_pickup/sample_drop_screen.dart';
import 'package:jan_x/inspection_request/new_request/sample_drop_and_pickup/sample_pickup_screen.dart';
import 'package:jan_x/order_detils/product_order_details_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewRequestScreen extends StatefulWidget {
  const NewRequestScreen({super.key});

  @override
  State<NewRequestScreen> createState() => _NewRequestScreenState();
}

class _NewRequestScreenState extends State<NewRequestScreen> {
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
            title: "New Request",
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
              buildVSpacer(5.h),
              isClicked
                  ? Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: _buildText(
                                title: "Choose Type :",
                                size: 12.px,
                                fontWeight: FontWeight.w800,
                                color: white)),
                        buildVSpacer(2.h),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isClicked1 = !isClicked1;
                              });
                            },
                            child: _InspectRequestWidget(
                              title: "Sample Drop",
                              isClicked: isClicked1,
                            )),
                        buildVSpacer(1.h),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isClicked2 = !isClicked2;
                              });
                            },
                            child: _InspectRequestWidget(
                              title: "Sample Pick-Up",
                              isClicked: isClicked2,
                            )),
                            
                                  buildVSpacer(6.h),
        
                      ],
                    )
                  : const SizedBox(),
                  buildVSpacer(3.h),
                            Padding(
          padding: EdgeInsets.only(
              bottom: Adaptive.h(3), left: Adaptive.w(3), right: Adaptive.w(3)),
          child: CustomButton3(
            text: "Next",
            onPressed: () {
              setState(() {
                isClicked = true;
              });
              if (isClicked1) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SampleDropScreen(),
                    ));
              } else if (isClicked2) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SamplePickupScreen(),
                    ));
              }
            },
            size: 19.px,
            weight: FontWeight.w500,
            color: buttonColor,
          ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: 
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

class _InspectRequestWidget extends StatelessWidget {
  const _InspectRequestWidget({
    required this.title,
    required this.isClicked,
  });
  final bool isClicked;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adaptive.h(6),
      width: Adaptive.w(100),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      padding: EdgeInsets.all(12.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildText(title: title, size: 12.px, fontWeight: FontWeight.w700),
          const Spacer(),
          CircleAvatar(
            radius: Adaptive.w(3),
            backgroundColor: Colors.blueGrey.shade300,
            child: Center(
              child: CircleAvatar(
                radius: Adaptive.w(2.5),
                backgroundColor: white,
                child: Center(
                  child: CircleAvatar(
                    radius: Adaptive.w(2),
                    backgroundColor: isClicked == true ? black : white,
                  ),
                ),
              ),
            ),
          )
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
