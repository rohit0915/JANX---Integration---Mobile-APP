import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_income/widgets/active_transaction_widget.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_income/widgets/income_widgets.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_product_details/mitra_product_type3.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/widgets/mitra_review_widgets.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraIncomeScreen extends StatefulWidget {
  const MitraIncomeScreen({super.key});

  @override
  State<MitraIncomeScreen> createState() => _MitraIncomeScreenState();
}

class _MitraIncomeScreenState extends State<MitraIncomeScreen> {
  SelectedTab selectedTab = SelectedTab.income;
  String headerTitle = 'Income';
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
            title: headerTitle,
            color: white,
            size: 22.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildVSpacer(2.h),
          Container(
            height: Adaptive.h(5),
            width: Adaptive.w(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              color: buttonColor,
            ),
            child: Center(
              child: _buildText(
                  title: "Name : Ramesh",
                  size: 12.px,
                  fontWeight: FontWeight.w700),
            ),
          ),
          buildVSpacer(2.h),
          Flex(
            direction: Axis.horizontal,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: _buildTab(SelectedTab.active, "Active\nTransactions",
                      "Active Transaction")),
              buildHSpacer(5.w),
              Expanded(
                  flex: 1,
                  child: _buildTab(SelectedTab.complete,
                      "Complete\nTransaction", "Complete Transaction")),
              buildHSpacer(5.w),
              Expanded(
                  flex: 1,
                  child: _buildTab(SelectedTab.income, "Income", "Income")),
            ],
          ),
            buildVSpacer(2.h),

          Expanded(
            child: SingleChildScrollView(child: _selectedTabContent()),
          ),
        ],
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
        height: Adaptive.h(6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF4BC1C) : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: _buildText(
                title: title,
                color: isSelected ? Colors.black : Colors.black,
                size: 10.px),
          ),
        ),
      ),
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

  Widget _selectedTabContent() {
    switch (selectedTab) {
      case SelectedTab.active:
        return activeTransaction();
      case SelectedTab.complete:
        return completeTransaction();
      case SelectedTab.income:
        return const IncomeMitraWidgets();
      default:
        return const IncomeMitraWidgets();
    }
  }

  Widget activeTransaction() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildVSpacer(4.h),
          const ActiveTransactionWidget(
            image: "pro",
            title: "Wheat",
            color: Color(0xff3985D7),
          ),
          buildVSpacer(3.h),
          const ActiveTransactionWidget2(),
          buildVSpacer(3.h),
          const ActiveTransactionWidget(
            image: "pro",
            title: "Wheat",
            color: Color(0xff3985D7),
          ),
          buildVSpacer(3.h),
          const ActiveTransactionWidget2(),
          buildVSpacer(2.h),
          activeTransationWidget3()
        ],
      ),
    );
  }

  Widget completeTransaction() {
    return Column(
      children: [
        buildVSpacer(3.h),
        mitraSellMethod(),
        buildVSpacer(3.h),
        mitraCompleteBuyMethod(),
        buildVSpacer(3.h),
        completeTransationWidget3(),
        buildVSpacer(3.h),
      ],
    );
  }

  Padding mitraCompleteBuyMethod() {
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
                  buildVSpacer(2.h),
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
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       padding: EdgeInsets.all(12.sp),
                            //       decoration: BoxDecoration(
                            //           borderRadius:
                            //               BorderRadius.circular(14.sp),
                            //           color: Colors.white),
                            //       child: Center(
                            //         child: Text(
                            //           'Sold Out',
                            //           style: GoogleFonts.lato(
                            //               fontWeight: FontWeight.w600,
                            //               fontSize: 12.px),
                            //         ),
                            //       ),
                            //     )
                            //   ],
                            // ),
                            buildVSpacer(1.h)
                          ],
                        ),
                      ),
                    ],
                  ),
                  buildVSpacer(3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Adaptive.h(5),
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        decoration: BoxDecoration(
                          color: const Color(0xffF4BC1C),
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        child: Center(
                          child: Text(
                            'Completed',
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600, fontSize: 10.px),
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
            bottom: Adaptive.h(26),
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
    );
  }

  Padding mitraSellMethod() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                // isClickedCompleted = !isClickedCompleted;
              });
            },
            child: Container(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12.sp),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(14.sp),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      'Sold Out',
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.px),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            buildVSpacer(1.h)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
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
          Positioned(
            bottom: Adaptive.h(21),
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

  Padding activeTransationWidget3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MitraProductTypeDetails(),
              ));
        },
        child: Container(
          decoration: const BoxDecoration(
            color: white,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildVSpacer(2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          title: "Order ID : 67001",
                          size: 12.px,
                          align: TextAlign.start,
                          fontWeight: FontWeight.w800),
                    ),
                    buildVSpacer(2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          title: "Date : 05-04-24 , Timing : 5:PM",
                          size: 12.px,
                          fontWeight: FontWeight.w800),
                    ),
                    buildVSpacer(2.h),
                    _buildText(
                        title: "Jabalpur <--> Delhi",
                        size: 12.px,
                        fontWeight: FontWeight.w800),
                    buildVSpacer(2.h),
                    Container(
                      height: Adaptive.h(9),
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: const Color(0xffEEEEEE),
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/active_transation.png',
                            fit: BoxFit.cover,
                            scale: 1,
                          ),
                          _buildText(
                              title: "LCV Open (2.5-7 )Tons\nMINI TRUCK",
                              size: 12.px,
                              fontWeight: FontWeight.w600)
                        ],
                      ),
                    ),
                    buildVSpacer(3.h),
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: const BoxDecoration(
                        color: buttonColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildText(
                                  title: "Vehicle No :",
                                  size: 10.px,
                                  fontWeight: FontWeight.w500),
                              _buildText(
                                  title: "Driver : Rahul Tiwari",
                                  size: 10.px,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                          buildVSpacer(1.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildText(
                                  title: "MP20BC1234",
                                  size: 10.px,
                                  fontWeight: FontWeight.w500),
                              _buildText(
                                  title: "+91 1234567890",
                                  size: 10.px,
                                  fontWeight: FontWeight.w500)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding completeTransationWidget3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: white,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildVSpacer(2.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildText(
                        title: "Order ID : 67001",
                        size: 12.px,
                        align: TextAlign.start,
                        fontWeight: FontWeight.w800),
                  ),
                  buildVSpacer(2.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildText(
                        title: "Date : 05-04-24 , Timing : 5:PM",
                        size: 12.px,
                        fontWeight: FontWeight.w800),
                  ),
                  buildVSpacer(2.h),
                  _buildText(
                      title: "Jabalpur <--> Delhi",
                      size: 12.px,
                      fontWeight: FontWeight.w800),
                  buildVSpacer(2.h),
                  Container(
                    height: Adaptive.h(9),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: const Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/active_transation.png',
                          fit: BoxFit.cover,
                          scale: 1,
                        ),
                        _buildText(
                            title: "LCV Open (2.5-7 )Tons\nMINI TRUCK",
                            size: 12.px,
                            fontWeight: FontWeight.w600)
                      ],
                    ),
                  ),
                  buildVSpacer(3.h),
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: const BoxDecoration(
                      color: buttonColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildText(
                                title: "Vehicle No :",
                                size: 10.px,
                                fontWeight: FontWeight.w500),
                            _buildText(
                                title: "Driver : Rahul Tiwari",
                                size: 10.px,
                                fontWeight: FontWeight.w500)
                          ],
                        ),
                        buildVSpacer(1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildText(
                                title: "MP20BC1234",
                                size: 10.px,
                                fontWeight: FontWeight.w500),
                            _buildText(
                                title: "+91 1234567890",
                                size: 10.px,
                                fontWeight: FontWeight.w500)
                          ],
                        )
                      ],
                    ),
                  ),
                  buildVSpacer(2.h),
                  CustomButton(
                    text: "Delivered Successfully",
                    onPressed: () {},
                    color: buttonColor,
                    weight: FontWeight.w700,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum SelectedTab { active, complete, income }
