import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/post_sell_ad/my_ad_onTap_screen.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_product_details/mitra_details_screen.dart';
import 'package:jan_x/profile/profile_other_screens/mitra_details/mitra_details_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:jan_x/wish_karo_screen/wish_karo_details/wish_karo_details_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraReviewItemWidget extends StatefulWidget {
  const MitraReviewItemWidget(
      {super.key,
      required this.color,
      required this.image,
      required this.title});
  final Color color;
  final String image;
  final String title;
  @override
  State<MitraReviewItemWidget> createState() => _MitraReviewItemWidgetState();
}

class _MitraReviewItemWidgetState extends State<MitraReviewItemWidget> {
  @override
  Widget build(BuildContext context) {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MitraDetailsScreenForMitra(),
                  ));
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
                        Image.asset("assets/${widget.image}.png"),
                        buildHSpacer(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildText1(title: "${widget.title}", size: 18),
                            _buildText1(
                                title: "Variety :  v1,Sharbati", size: 11),
                            _buildText1(title: "Location : Jabalpur", size: 11),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton3(
                          text: "Approve",
                          onPressed: () {
                            approveReviewMethode(context);
                          },
                          borderColor: black,
                          color: Colors.white,
                          width: Adaptive.w(35),
                          size: 12.px,
                        ),
                        CustomButton3(
                          text: "Reject",
                          onPressed: () {
                            rejectReviewMethode(context);
                          },
                          borderColor: black,
                          color: Colors.black,
                          width: Adaptive.w(35),
                          size: 12.px,
                          textColor: white,
                        )
                      ],
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
                color: widget.color,
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
}

Future<void> rejectReviewMethode(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible:
        false, // Set to true if you want to dismiss the dialog by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
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
                  Text(
                    "Do You Really Want\nTo Approve",
                    style: TextStyle(
                        fontSize: 22.px,
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
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //           const MitraProfileDetailsScreen(),
                          //     ));
                        },
                        color: white,
                        borderColor: black,
                        width: Adaptive.w(30),
                      ),
                      buildHSpacer(8.w),
                      CustomButton(
                        text: "No",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: black,
                        textColor: white,
                        width: Adaptive.w(30),
                      )
                    ],
                  ),
                  buildVSpacer(5.h)
                ],
              ),
            ),
            Positioned(
                top: -Adaptive.h(0.1.h),
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

Future<void> approveReviewMethode(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible:
        false, // Set to true if you want to dismiss the dialog by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
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
                  Text(
                    "Do You Really Want\nTo Approve",
                    style: TextStyle(
                        fontSize: 22.px,
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
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //           const MitraProfileDetailsScreen(),
                          //     ));
                        },
                        color: white,
                        borderColor: black,
                        width: Adaptive.w(30),
                      ),
                      buildHSpacer(8.w),
                      CustomButton(
                        text: "No",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: black,
                        textColor: white,
                        width: Adaptive.w(30),
                      )
                    ],
                  ),
                  buildVSpacer(5.h)
                ],
              ),
            ),
            Positioned(
                top: -Adaptive.h(0.1.h),
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

class MitraReviewWidget2 extends StatefulWidget {
  const MitraReviewWidget2({super.key});

  @override
  State<MitraReviewWidget2> createState() => _MitraReviewWidget2State();
}

class _MitraReviewWidget2State extends State<MitraReviewWidget2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const WishKaroDetailsScreen(),
                ),
              );
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
                  buildVSpacer(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/wishimage.png"),
                            buildHSpacer(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _buildText1(
                                    title: "Electronic,Washing Machine",
                                    size: 18),
                                _buildText1(title: "Brand :  LG", size: 11),
                                _buildText1(
                                    title: "Location : Jabalpur", size: 11),
                                _buildText1(
                                    title: "30-04-24 - 04-05-24", size: 11),
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
                        buildVSpacer(20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton3(
                              text: "Approve",
                              onPressed: () {},
                              borderColor: black,
                              color: Colors.white,
                              width: Adaptive.w(35),
                              size: 12.px,
                            ),
                            CustomButton3(
                              text: "Reject",
                              onPressed: () {},
                              borderColor: black,
                              color: Colors.black,
                              width: Adaptive.w(35),
                              size: 12.px,
                              textColor: white,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
        ],
      ),
    );
  }
}

Widget _buildText3(
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

Widget _buildText2(
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
                    "Are You Sure You Want To Delete?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  buildVSpacer(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: "Yes",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: buttonColor,
                        width: Adaptive.w(30),
                      ),
                      buildHSpacer(8.w),
                      CustomButton(
                        text: "No",
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
