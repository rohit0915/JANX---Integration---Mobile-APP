import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/home_screen/home_screen.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OtpScreen extends StatefulWidget {
  @override
  State createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with SingleTickerProviderStateMixin {
  String otps = '';
  OtpFieldController otpController = OtpFieldController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff444444),
        leading:  GestureDetector(
           onTap: () {
             Navigator.pop(context);
           },
          child: Icon(Icons.arrow_back_ios, color: const Color(0xffF4BC1C),size: 17.sp,)),
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
                padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                child: OTPTextField(
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor:  const Color(0xFFDDDDDD),
                    ),
                    controller: otpController,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 50,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 8,
                    style: const TextStyle(fontSize: 17),
                    onChanged: (pin) {
                      otps = pin;
                      print("Changed: " + otps);
                    },
                    onCompleted: (pin) {
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
            // buildVSpacer(250),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton3(text: "Verify and Create Account", size: 15.px,onPressed: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                
                  );
                }),
              ),
              buildVSpacer(50),

            ],
          ),
        ),
      ),
    );
  }
}

