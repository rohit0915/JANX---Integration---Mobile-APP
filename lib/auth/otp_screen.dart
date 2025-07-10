import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/home_screen/home_screen.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:jan_x/services/auth_services.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String? otp;
  OtpScreen({Key? key, required this.phoneNumber, this.otp}) : super(key: key);
  @override
  State createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>
    with SingleTickerProviderStateMixin {
  String otps = '';
  OtpFieldController otpController = OtpFieldController();
  bool isLoading = false;
  String errorMessage = '';
  late final AuthServices authServices;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<AuthServices>()) {
      Get.put(AuthServices());
    }
    authServices = Get.find<AuthServices>();
    // Show OTP popup if available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final otpToShow = widget.otp ?? '1234'; // fallback for demo
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Your OTP'),
          content: Text('Your OTP is: $otpToShow'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff444444),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: const Color(0xffF4BC1C),
              size: 17.sp,
            )),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff444444),
          image: DecorationImage(
            image: AssetImage("assets/splash3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildVSpacer(80),
              Image.asset("assets/otp.png"),
              buildVSpacer(10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: OTPTextField(
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: const Color(0xFFDDDDDD),
                    ),
                    controller: otpController,
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 50,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 8,
                    style: const TextStyle(fontSize: 17),
                    onChanged: (pin) {
                      // Do not set otps here; only set on complete
                    },
                    onCompleted: (pin) {
                      setState(() {
                        otps = pin;
                      });
                      print("Completed: " + pin);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Didn’t recieve code?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ' Request again',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (isLoading) ...[
                SizedBox(height: 16),
                CircularProgressIndicator(),
              ],
              if (errorMessage.isNotEmpty) ...[
                SizedBox(height: 16),
                Text(errorMessage, style: TextStyle(color: Colors.red)),
              ],
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton3(
                  text: "Verify and Create Account",
                  size: 15.px,
                  onPressed: () async {
                    if (otps.length != 4) {
                      setState(() {
                        errorMessage = 'Please enter the 4-digit OTP.';
                      });
                      return;
                    }
                    setState(() {
                      isLoading = true;
                      errorMessage = '';
                    });
                    try {
                      final response = await authServices.verifyOtp(
                        phoneNumber: widget.phoneNumber,
                        otp: otps,
                      );
                      if (response.statusCode == 200) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else {
                        setState(() {
                          errorMessage =
                              'Failed to verify OTP. Please try again.';
                        });
                      }
                    } catch (e) {
                      setState(() {
                        errorMessage = e.toString();
                      });
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
              ),
              buildVSpacer(50),
            ],
          ),
        ),
      ),
    );
  }
}
