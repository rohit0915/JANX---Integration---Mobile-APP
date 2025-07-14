import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jan_x/services/kyc_service.dart';

import '../../../../../utilz/colors.dart';

class SamagraScreen extends StatefulWidget {
  const SamagraScreen({super.key});

  @override
  State<SamagraScreen> createState() => _SamagraScreenState();
}

class _SamagraScreenState extends State<SamagraScreen> {
  final TextEditingController samagraIdController = TextEditingController();

  @override
  void dispose() {
    samagraIdController.dispose();
    super.dispose();
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
          title: "Samagra ID",
          color: buttonColor,
          size: 18.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: Column(
          children: [
            buildVSpacer(2.h),
            Center(
              child: IntrinsicWidth(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Adaptive.w(7),
                    vertical: Adaptive.h(5),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.sp),
                      color: buttonColor),
                  child: Image.asset('assets/samagra1.png'),
                ),
              ),
            ),
            buildVSpacer(3.h),
            _buildText(
                title: "Enter your Samagra ID number",
                size: 17.px,
                fontWeight: FontWeight.w600,
                color: buttonColor),
            buildVSpacer(3.h),
            Container(
              height: Adaptive.h(7),
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(14.sp)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: samagraIdController,
                      decoration: InputDecoration(
                        hintText: 'Samagra ID Number',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Image.asset('assets/kycTile1.png', scale: 0.9)
                ],
              ),
            ),
            buildVSpacer(5.h),
            Stack(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      showFixedHeightBottomSheet(context, 0);
                    },
                    child: Image.asset(
                      'assets/pan.png',
                    ),
                  ),
                ),
                Positioned(
                  top: Adaptive.h(7),
                  left: Adaptive.w(42),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/pan2.png',
                      ),
                      buildVSpacer(2.h),
                      _buildText(
                          title: "Upload", color: buttonColor, size: 14.px)
                    ],
                  ),
                )
              ],
            ),
            // _buildText(
            //     title:
            //         "Note : OTP has been Sent to Your\nRegstered Mobile Number",
            //     size: 14.px,
            //     color: white,
            //     fontWeight: FontWeight.w600),
            buildVSpacer(6.h),
            ElevatedButton(
              onPressed: () => _submitSamagraKyc(context),
              child: Text('Submit'),
            ),
          ],
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
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
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

  void _submitSamagraKyc(BuildContext context) async {
    final box = GetStorage();
    final token = box.read('token');
    if (token == null) return;
    final kycService = Get.find<KycService>();

    final data = {
      'samagra_id': samagraIdController.text,
      // Add other fields as needed
    };
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Center(child: CircularProgressIndicator()));
    final response = await kycService.addSamagraDetails(data, );
    Navigator.pop(context);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Samagra KYC submitted successfully.')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit Samagra KYC.')));
    }
  }
}
