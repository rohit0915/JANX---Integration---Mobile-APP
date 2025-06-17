import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:jan_x/post_sell_ad/call_screen/call_screen.dart';
import 'package:jan_x/post_sell_ad/chat_screen/chat_screen.dart';
import 'package:jan_x/post_sell_ad/view_details/view_details_screen.dart';
import 'package:jan_x/transport_facility/bookings_transport/booking_transport_summary_screen.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingTransportScreen extends StatelessWidget {
  const BookingTransportScreen({super.key});

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
          title: "Book Transport",
          color: white,
          size: 18.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Adaptive.w(100),
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: buttonColor),
                child: Column(
                  children: [
                    _buildText(
                        title: "JABALPUR   To   DELHI",
                        size: 16.px,
                        fontWeight: FontWeight.w800),
                    buildVSpacer(2.h),
                    _buildText(
                        title: "Date : 05-04-24 , Timing : 5:PM",
                        size: 12.px,
                        fontWeight: FontWeight.w800),
                  ],
                ),
              ),
              buildVSpacer(2.h),
              Container(
                width: Adaptive.w(100),
                height: Adaptive.h(11),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildText(
                              title: "LCV Open (2.5-7 )Tons\nMINI TRUCK",
                              size: 12.px,
                              fontWeight: FontWeight.w600),
                          buildVSpacer(1.h),
                          _buildText(
                              title: "₹ 900",
                              size: 16.px,
                              fontWeight: FontWeight.w800)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              buildVSpacer(2.h),
              Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: _buildText(
                    title:
                        "Lorem ipsum dolor sit amet consectetur. Ac neque ligula eget diam mauris tristique. Enim massa lacinia in scelerisque facilisis. Tellus nullam mauris aliquam nulla egestas auctor. Velit adipiscing platea libero lorem. Consectetur a aliquet dolor sit. Ultrices in adipiscing.",
                    size: 12.px,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff6C6C6C)),
              ),
              buildVSpacer(2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Adaptive.w(0)),
                child: const DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.white,
                  // dashGradient: [Colors.red, Colors.blue],
                  dashRadius: 0.0,
                  dashGapLength: 2.0,
                  dashGapColor: Colors.transparent,
                  // dashGapGradient: [Colors.red, Colors.blue],
                  dashGapRadius: 0.0,
                ),
              ),
              buildVSpacer(2.h),
              SizedBox(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return bookTransportMethod(context);
                    },
                    separatorBuilder: (context, index) => buildVSpacer(2.h),
                    itemCount: 4),
              ),
              buildVSpacer(10.h),
              CustomButton(
                text: "Next ",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const BookingTransportReviewScreen(),
                      ));
                },
                width: Adaptive.w(85),
              ),
              buildVSpacer(6.h),
            ],
          ),
        ),
      ),
    );
  }

  Container bookTransportMethod(BuildContext context ) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(12.sp)),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp), color: white),
        child: Row(
          children: [
            Column(
              children: [
                Image.asset('assets/transport1.png'),
                // buildVSpacer(1.h),
                GestureDetector(
                  onTap: () {
                    
                     Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewDetailsScreen(),
                                  ));
                  },
                  child: _buildText(
                      title: "View Profile",
                      size: 12.px,
                      fontWeight: FontWeight.w500,
                      color: buttonColor),
                ),
              ],
            ),
            buildHSpacer(1.5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText(
                  title: "New Mp Andhra Road Stars....",
                  size: 14.px,
                  fontWeight: FontWeight.w800,
                ),
                buildVSpacer(1.h),
                _buildText(
                  title: "Anuraj Gautham",
                  size: 12.px,
                  fontWeight: FontWeight.w500,
                ),
                buildVSpacer(2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton3(
                      text: "Chat",
                      onPressed: () {
                         Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatScreen(),
                                  ));
                      },
                      color: white,
                      borderColor: black,
                      height: Adaptive.h(4),
                      width: Adaptive.w(27),
                      size: 12.px,
                    ),
                    buildHSpacer(3.w),
                    CustomButton3(
                      text: "Call",
                      onPressed: () {
                         Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CallScreen(),
                                  ));
                      },
                      color: black,
                      textColor: white,
                      borderColor: black,
                      height: Adaptive.h(4),
                      width: Adaptive.w(27),
                      size: 12.px,
                    )
                  ],
                ),
              ],
            )
          ],
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
      textAlign: align ?? TextAlign.start,
      style: GoogleFonts.poppins(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
