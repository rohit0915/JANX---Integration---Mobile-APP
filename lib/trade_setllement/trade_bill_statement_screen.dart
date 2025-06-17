import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_detils/product_order_details_screen.dart';
import 'package:jan_x/trade_setllement/widgets/trade_settlement_widgets.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TradeBillStatementScreen extends StatelessWidget {
  const TradeBillStatementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:
                  Icon(Icons.arrow_back_ios, color: buttonColor, size: 18.sp)),
          title: _buildText(
              title: "Final Bill",
              color: white,
              size: 22.px,
              fontWeight: FontWeight.w700),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
            child: SingleChildScrollView(
              child: Column(children: [
                buildVSpacer(2.h),
                GestureDetector(
                   onTap: () {
                      Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const ProductOrderDetailsScreen(isFromTrade: true),
                ),
              );
                   },
                  child: mitraBillMethod()),
                buildVSpacer(2.h),
                buildVSpacer(2.h),
                CompletedScreenFieldWidget(title: 'MITRA INFORMATION'),
                buildVSpacer(2.h),
                CompletedScreenFieldWidget(title: 'SELLER INFORMATION'),
                buildVSpacer(2.h),
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: Adaptive.w(100),
                        height: Adaptive.h(5),
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.sp),
                                topRight: Radius.circular(12.sp))),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Adaptive.w(6)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildText(
                                  title: "Final bill",
                                  size: 10.px,
                                  align: TextAlign.center,
                                  fontWeight: FontWeight.w700),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.w(6)),
                        child: Column(
                          children: [
                            buildVSpacer(2.h),
                            flexValuesMethod(
                                title: "Weighted Quantity", title2: "95"),
                            buildVSpacer(2.h),
                            flexValuesMethod(
                                title: "Locked Final Price", title2: "2280"),
                            buildVSpacer(2.h),
                            flexValuesMethod(
                                title: "Total Sell Value ", title2: "2,16,600"),
                            buildVSpacer(3.h),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: _buildText(
                                    title: "-Discount on MRP -",
                                    size: 10.px,
                                    fontWeight: FontWeight.w700)),
                            buildVSpacer(2.h),
                            flexValuesMethod(
                                title: "Platform Fee ", title2: "2,166.6"),
                            buildVSpacer(2.h),
                            flexValuesMethod(
                                title: "Mitra Fee ", title2: "2,166.6"),
                            buildVSpacer(2.h),
                            flexValuesMethod(
                                title: "On Hold Amount\nNote : 10% total bill ",
                                title2: "2,166"),
                            buildVSpacer(2.h),
                            flexValuesMethod(
                                title: "Total Bill Amount", title2: "2,23,098"),
                          ],
                        ),
                      ),
                      buildVSpacer(
                        3.h,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.w(6)),
                        child: const DottedLine(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: Colors.black,
                          // dashGradient: [Colors.red, Colors.blue],
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                          // dashGapGradient: [Colors.red, Colors.blue],
                          dashGapRadius: 0.0,
                        ),
                      ),
                      buildVSpacer(
                        3.h,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.w(6)),
                        child: Column(
                          children: [
                            buildVSpacer(2.h),
                            flexValuesMethod(
                                title: "Balancing Fee Refund",
                                title2: "1600",
                                color: Colors.green),
                            buildVSpacer(16.h),
                            CustomButton3(
                              text: "Back",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: buttonColor,
                              weight: FontWeight.w600,
                            ),
                            buildVSpacer(6.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )));
  }

  Flex flexValuesMethod(
      {required String title, required String title2, Color? color}) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
            flex: 1,
            child: _buildText(
                title: title,
                size: 10.px,
                fontWeight: FontWeight.w500,
                align: TextAlign.start)),
        buildHSpacer(4.w),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(12.sp),
            height: Adaptive.h(5),
            decoration: BoxDecoration(
                border: Border.all(color: black),
                borderRadius: BorderRadius.circular(12.sp)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildText(
                    title: title2,
                    size: 10.px,
                    color: color ?? black,
                    fontWeight: FontWeight.w500,
                    align: TextAlign.left)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget mitraBillMethod() {
    return Stack(
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
                            topRight: Radius.circular(14.sp))),
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
                            _buildText(title: "Wheat", size: 18),
                            _buildText(
                                title: "Variety :  v1,Sharbati", size: 11),
                            _buildText(title: "Location : Jabalpur", size: 11),
                          ],
                        )
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
              buildVSpacer(3.h),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/Mask group.png'),
                                SizedBox(
                                  height: Adaptive.h(6),
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
                                          size: 12, // Adjust size as needed
                                          color: Colors
                                              .black, // Adjust color as needed
                                        ),
                                      );
                                    }),
                                  ]),
                                )
                              ],
                            ),
                            buildHSpacer(3.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                )
                              ],
                            )
                          ],
                        ),
                        buildVSpacer(2.h),
                        buildVSpacer(1.h)
                      ],
                    ),
                  ),
                ],
              ),
            ],
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
        Positioned(
          bottom: Adaptive.h(18),
          left: 20,
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
                      "Order ID: 67001",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Date : 05-April-24",
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
    );
  }

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? align}) {
    return Text(
      title,
      textAlign: align ?? TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
