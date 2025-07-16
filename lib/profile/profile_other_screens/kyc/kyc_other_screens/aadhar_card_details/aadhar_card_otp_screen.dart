import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/kyc/kyc_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/utilz/common_functions.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jan_x/services/kyc_service.dart';
import 'package:get/get.dart';

class OtpAadharCardScreen extends StatefulWidget {
  final String? otp;
  const OtpAadharCardScreen({super.key, this.otp});

  @override
  State<OtpAadharCardScreen> createState() => _OtpAadharCardScreenState();
}

class _OtpAadharCardScreenState extends State<OtpAadharCardScreen> {
  String otp = '';
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.otp != null && widget.otp!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showOtpPopup(context, widget.otp!);
      });
    }
  }

  @override
  void dispose() {
    otpController.dispose();
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
          ),
        ),
        title: _buildText(
          title: "Aadhar Card Details",
          color: buttonColor,
          size: 18.px,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
        child: Column(
          children: [
            buildVSpacer(16.h),
            Center(
              child: Text(
                "Enter the code",
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w800,
                    fontSize: 24.px,
                    color: buttonColor),
              ),
            ),
            buildVSpacer(2.h),
            buildText(
                title:
                    "Enter the 4 digit code that we just sent to \n670******909",
                color: buttonColor,
                size: 12.px,
                fontWeight: FontWeight.w400,
                align: false),
            buildVSpacer(4.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 40,
                style: TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: Colors.white,
                  borderColor: buttonColor,
                  enabledBorderColor: buttonColor,
                  focusBorderColor: buttonColor,
                ),
                onChanged: (val) {
                  otp = val;
                },
                onCompleted: (val) {
                  setState(() {
                    otp = val;
                  });
                },
              ),
            ),
            buildVSpacer(9.h),
            CustomButton(
              text: "Verify OTP",
              onPressed: () async {
                await _verifyOtp(context);
              },
              color: buttonColor,
              size: 15.px,
              textColor: black,
              weight: FontWeight.w600,
            ),
            buildVSpacer(8.h),
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
          color: color ?? Colors.black),
    );
  }

  Future<void> _verifyOtp(BuildContext context) async {
    final box = GetStorage();
    final token = box.read('token');
    if (token == null) return;
    final kycService = Get.find<KycService>();
  
   
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Center(child: CircularProgressIndicator()));
    final data = {
      'otp': otp,
    };
    final response = await kycService.aadharVerifyOtp(data);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aadhaar OTP verified successfully.')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => KycScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify Aadhaar OTP.')),
      );
    }
  }

  void _showOtpPopup(BuildContext context, String otp) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Your OTP'),
        content: Text('OTP: ' + otp),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
