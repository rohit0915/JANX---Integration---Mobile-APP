import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/model/kyc_models.dart';
import 'package:jan_x/profile/profile_other_screens/kyc/kyc_other_screens/aadhar_card_details/aadhar_card_otp_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jan_x/services/kyc_service.dart';
import 'dart:convert'; // Added for jsonDecode

class AadharCardDetailsScreen extends StatefulWidget {
  const AadharCardDetailsScreen({super.key});

  @override
  State<AadharCardDetailsScreen> createState() =>
      _AadharCardDetailsScreenState();
}

class _AadharCardDetailsScreenState extends State<AadharCardDetailsScreen> {
  final TextEditingController aadhaarController = TextEditingController();

  @override
  void dispose() {
    aadhaarController.dispose();
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
              color: buttonColor,
              size: 17.sp,
            )),
        title: _buildText(
            title: "Aadhar Card Details",
            color: buttonColor,
            size: 18.px,
            fontWeight: FontWeight.w700),
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
                  child: Image.asset('assets/Icon.png'),
                ),
              ),
            ),
            buildVSpacer(3.h),
            _buildText(
                title: "Enter your Aadhar Card number",
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
                      controller: aadhaarController,
                      decoration: InputDecoration(
                        hintText: 'Aadhar Card Number',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Image.asset('assets/kycTile1.png', scale: 0.9)
                ],
              ),
            ),
            buildVSpacer(18.h),
            _buildText(
                title:
                    "Note : OTP has been Sent to Your\nRegstered Mobile Number",
                size: 14.px,
                color: white,
                fontWeight: FontWeight.w600),
            buildVSpacer(6.h),
            CustomButton(
              text: "Next",
              onPressed: () {
                _submitAadhaarKyc(context);
              },
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

  void _submitAadhaarKyc(BuildContext context) async {
    final box = GetStorage();
    final token = box.read('token');
    if (token == null) return;
    final kycService = Get.find<KycService>();

    final data = {
      'aadhaar_number': aadhaarController.text,
    };
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Center(child: CircularProgressIndicator()));
    final response = await kycService.aadharRequest(
      data,
    );
    Navigator.pop(context);
    if (response.statusCode == 200) {
      try {
        final responseData = jsonDecode(response.body);
        final otp = responseData['data'] ?? responseData['data']?['otp'];
        if (otp != null) {
          print('Aadhaar OTP: ' + otp.toString());
        } else {
          print('Aadhaar OTP not found in response.');
        }
      } catch (e) {
        print('Error parsing OTP from response: ' + e.toString());
      }
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Aadhaar KYC submitted successfully.')));
      Get.back();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit Aadhaar KYC.')));
    }
  }
}
