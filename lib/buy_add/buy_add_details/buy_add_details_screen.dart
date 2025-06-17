import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/post_buy_ads/post_by_ad_screen.dart';
import 'package:jan_x/post_buy_ads/tap_on_post_buy/widgets/completed_screen_widget.dart';
import 'package:jan_x/report_screen/report_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ByAddDetailsScreen extends StatefulWidget {
  const ByAddDetailsScreen({super.key});

  @override
  State<ByAddDetailsScreen> createState() => _ByAddDetailsScreenState();
}

class _ByAddDetailsScreenState extends State<ByAddDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: buttonColor, size: 18.sp)),
        title: Text(
          "AD Details ",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              fontSize: 20.px,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: CustomButton3(
                text: "Buy Request",
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostBuyAdScreen(),
                      ));
                },
                color: white,
                textColor: black,
                height: 5.h,
                width: Adaptive.w(35),
                size: 12.px,
                weight: FontWeight.w600,
              )),
              buildVSpacer(2.h),
              myAdMethod(context),
            ],
          ),
        ),
      ),
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
        buildVSpacer(2.h),
        CustomButton3(
          text: "Home",
          onPressed: () {
            Navigator.pop(context);
                        Navigator.pop(context);

          },
          color: buttonColor,
          weight: FontWeight.w700,
        ),
        SizedBox(height: 19.h),
      ],
    );
  }

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color,
      AlignmentGeometry? align}) {
    return Align(
      alignment: align ?? Alignment.centerLeft,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
            fontSize: size ?? 14,
            fontWeight: fontWeight ?? FontWeight.w400,
            color: color ?? Colors.black),
      ),
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
