import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/post_sell_ad/view_details/view_details_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraDetailsScreenForMitra extends StatelessWidget {
  const MitraDetailsScreenForMitra({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:
                  Icon(Icons.arrow_back_ios, color: buttonColor, size: 18.sp)),
          title: _buildText(
              title: "Client Active Transaction",
              color: white,
              size: 22.px,
              fontWeight: FontWeight.w700),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset("assets/banner.png"),
                const SizedBox(height: 20),
                _buildText(
                    title: "Overview",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
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
                                horizontal: 18.0, vertical: 12),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      _buildText1(
                                          title: "Total Cost (approx.)"),
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
                                        size: 10.px),
                                  ),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
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
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildText(
                    title: "Views",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (context) => ReportScreen(),
                    //   ),
                    // );
                  },
                  child: Container(
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
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(
                          //     builder: (context) => ReportScreen(),
                          //   ),
                          // );
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildText(
                      title: "Your Ad Expiry",
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildText(
                      title: "Ad Posted Location",
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Image.asset('assets/map.png'),
                const SizedBox(height: 20),
               const  CompletedScreenFieldWidget(
                  title: 'MITRA INFORMATION',
                ),
                const SizedBox(height: 20),
                const CompletedScreenFieldWidget(title: 'SELLER INFORMATION'),
                const SizedBox(height: 20),
                buildVSpacer(7.h),
                CustomButton(
                  text: "Back",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: buttonColor,
                  size: 16.px,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
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
  const CompletedScreenFieldWidget({super.key, required this.title});
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
               const  Icon(
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
                   const  Divider(
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
                              onPressed: () {},
                              width: Adaptive.w(33),
                              color: white,
                              textColor: black),
                          CustomButton(
                              text: 'Call',
                              onPressed: () {},
                              width: Adaptive.w(33),
                              color: black,
                              textColor: white)
                        ],
                      ),
                    )
                  ],
                ),
              )
            :  const SizedBox()
      ],
    );
  }
}
