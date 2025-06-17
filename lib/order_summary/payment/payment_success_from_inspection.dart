import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/inspection_request/inspection_request_screen.dart';
import 'package:jan_x/order_summary/payment/order_success_message_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:jan_x/wish_karo_screen/wish_karo_track_order/wish_karo_track_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class paymentSuccessInspectionScreen extends StatefulWidget {
  const paymentSuccessInspectionScreen({super.key, required this.isFromDrop});
  final bool isFromDrop;
  @override
  State<paymentSuccessInspectionScreen> createState() =>
      _paymentSuccessInspectionScreenState();
}

SelectedTab selectTab = SelectedTab.inProgress;

class _paymentSuccessInspectionScreenState
    extends State<paymentSuccessInspectionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(
    //   const Duration(seconds: 3),
    //   () {
    //     // if (widget.isFromCart == false) {
    //       intFunction();

    //   },
    // );
  }

  intFunction() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OrderSuccessMessageScreen(),
        ));
  }

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
            size: 18.sp,
            color: buttonColor,
          ),
        ),
        title: _buildText(
          title: "Payment",
          color: white,
          size: 22.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildVSpacer(10.h),
          Center(
            child: SizedBox(
                width: 278.px,
                height: 278.px,
                child: Lottie.asset("assets/Animation - 1723812954253.json")),
          ),
          Text(
            "Payment has Succesfully\nCompleted",
            textAlign: TextAlign.center,
            style: GoogleFonts.mulish(
                fontWeight: FontWeight.w900, fontSize: 20.px, color: white),
          ),
          buildVSpacer(2.h),
          Text(
            "Inspection ID:\n67001(Generated)",
            textAlign: TextAlign.center,
            style: GoogleFonts.mulish(
                fontWeight: FontWeight.w900, fontSize: 20.px, color: white),
          ),
          buildVSpacer(5.h),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
                child: CustomButton(
                  text: "Track Inspection",
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const WishKaroTrackOrderScreen(
                            isFromInspection: true),
                      ),
                    );
                  },
                  size: 16.px,
                  weight: FontWeight.w700,
                ),
              ),
              buildVSpacer(3.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
                child: widget.isFromDrop == false
                    ? CustomButton(
                        text: "Next",
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => InspectionRequestScreen(
                                  selectedTab: selectTab),
                            ),
                          );
                        },
                        size: 16.px,
                        weight: FontWeight.w700,
                      )
                    : CustomButton(
                        text: "Home",
                        onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);

                        },
                        size: 16.px,
                        weight: FontWeight.w700,
                      ),
              )
            ],
          )
        ],
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
      textAlign: align ?? TextAlign.start,
      style: GoogleFonts.poppins(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
