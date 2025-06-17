import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:jan_x/widgets/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BusinessDetailsScreen extends StatelessWidget {
  const BusinessDetailsScreen({super.key});

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
          title: "Business Details",
          color: buttonColor,
          size: 18.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.h(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTxtFormField(
                hintText: "Enter GST number",
              ),
              buildVSpacer(2.h),
              const CustomTxtFormField(
                hintText: "Trade name",
              ),
              buildVSpacer(2.h),
              const CustomTxtFormField(
                hintText: "Your address",
              ),
              buildVSpacer(2.h),
              Flex(
                direction: Axis.horizontal,
                children: [
                  const Expanded(
                    flex: 1,
                    child: CustomTxtFormField(
                      hintText: "Pincode",
                    ),
                  ),
                  buildHSpacer(4.w),
                  const Expanded(
                    flex: 1,
                    child: CustomTxtFormField(
                      hintText: "City",
                    ),
                  ),
                ],
              ),
              buildVSpacer(2.h),
              Flex(
                direction: Axis.horizontal,
                children: [
                  const Expanded(
                    flex: 1,
                    child: CustomTxtFormField(
                      hintText: "State",
                    ),
                  ),
                  buildHSpacer(4.w),
                  const Expanded(
                    flex: 1,
                    child: CustomTxtFormField(
                      hintText: "District",
                    ),
                  ),
                ],
              ),
              buildVSpacer(2.h),
              const CustomTxtFormField(
                hintText: "Alternate Mobile Number",
              ),
              buildVSpacer(4.h),
              _buildText(
                  title: "Office address proof",
                  size: 14.px,
                  fontWeight: FontWeight.w700,
                  color: buttonColor),
              InkWell(
                onTap: () {
                  showFixedHeightBottomSheet(context, 0);
                },
                child: Container(
                  // width: double.infinity, // Makes the container take full width
                  // height: double.infinity, // Makes the container take full height
                  height: Adaptive.h(20),
                  width: Adaptive.w(86),
                  padding: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                    // color: white,
                    image: DecorationImage(
                      image: AssetImage('assets/bankdetails2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/pan2.png',
                      ),
                      buildVSpacer(1.h),
                      _buildText(
                          title: "Upload", color: buttonColor, size: 14.px)
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/bankdetails.png'),
                  buildHSpacer(5.w),
                  _buildText(
                      title:
                          "Upload GST copy/Khasra Copy/Electricity/Water Bill",
                      size: 9.px,
                      color: const Color(0xfff1f1f19e))
                ],
              ),
              buildVSpacer(3.h),
              CustomButton(
                text: "Save Details",
                onPressed: () {
                  Navigator.pop(context);
                },
                size: 15.px,
              )
            ],
          ),
        ),
      ),
    );
  }

  void showFixedHeightBottomSheet(BuildContext context, double height) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: Adaptive.h(30), // Fixed height for the bottom sheet
          width: double.infinity, // Take full width of the screen
          decoration: const BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(19), // Rounded corners at the top
            ),
          ),
          child: Column(
            children: [
              buildVSpacer(4.h),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Upload the documents',
                  style: GoogleFonts.lato(
                      fontSize: 17.px,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff444444)),
                ),
              ),
              buildVSpacer(3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: Adaptive.w(20),
                    padding: EdgeInsets.symmetric(
                        horizontal: 24.sp, vertical: 16.sp),
                    decoration: BoxDecoration(
                      color: const Color(0xff444444),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/panbottom1.png'),
                        buildHSpacer(3.w),
                        _buildText(
                            title: "Click",
                            size: 13.px,
                            fontWeight: FontWeight.w700,
                            color: buttonColor)
                      ],
                    ),
                  ),
                  buildHSpacer(5.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.sp, vertical: 16.sp),
                    decoration: BoxDecoration(
                      color: const Color(0xff444444),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/panbottom2.png'),
                        buildHSpacer(3.w),
                        _buildText(
                            title: "Gallery",
                            size: 13.px,
                            fontWeight: FontWeight.w700,
                            color: buttonColor)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22), // Ensure rounded corners at the top
        ),
      ),
      isScrollControlled: true, // Allows manual height control
    );
  }

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
