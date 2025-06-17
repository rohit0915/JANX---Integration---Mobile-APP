import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jan_x/auth/otp_screen.dart';
import 'package:jan_x/auth/reset_password_screen.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  State createState() => _SignInScreenState();
  final bool isMitra;
  SignInScreen({this.isMitra = false});
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff444444),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xffF4BC1C),
          ),
        ),
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
          children: [
            _buildTextHeader(
                title: "Jan-X",
                size: 40,
                fontWeight: FontWeight.bold,
                color: const Color(0xffF4BC1C)),
            buildVSpacer(20),
            _buildTextHeader(
                title: "Enter your personal details", color: Colors.white),
            buildVSpacer(20),
            Image.asset("assets/upload_pic.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField(
                hintText: "Enter your Name",
                suffixIcon: const Icon(Icons.person),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField(
                hintText: "Enter your phone Number",
                suffixIcon: const Icon(Icons.phone_android),
              ),
            ),
            Image.asset('assets/log in.png'),
            buildVSpacer(2.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen(),
                        ));
                  },
                  child: _buildText(
                      title: "Reset/forgot password",
                      color: buttonColor,
                      size: 12.px,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const Spacer(),
            widget.isMitra == false
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton1(
                        text: "Login",
                        onPressed: () {
                          log(" widget.isMitra:${ widget.isMitra}");
                          if (widget.isMitra) {

                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(),
                              ),
                            );
                          }
                        },
                        width: Adaptive.w(42),
                      ),
                      buildHSpacer(30),
                      CustomButton3(
                        width: Adaptive.w(42),
                        text: "Skip",
                        textColor: const Color(0xffF4BC1C),
                        onPressed: () {},
                        color: const Color(0xff444444),
                      borderColor: buttonColor,
                      )
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton1(
                        text: "Login",
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => MitraProfileScreen(),
                            ),
                          );
                        },
                        width: Adaptive.w(42),
                      ),
                      // buildHSpacer(30),
                      // CustomButton1(width: Adaptive.w(42),text: "Skip",textColor: const Color(0xffF4BC1C), onPressed: (){}, backgroundColor: const Color(0xff444444),)
                    ],
                  ),
            buildVSpacer(50)
          ],
        )),
      ),
    );
  }
}

Widget _buildTextHeader(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: size ?? 14,
            fontWeight: fontWeight ??
                FontWeight
                    .w500, // Use the provided fontWeight or default to FontWeight.w500
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
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 18.0,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: GoogleFonts.lato(
            fontSize: size ?? 14,
            fontWeight: fontWeight ??
                FontWeight
                    .w400, // Use the provided fontWeight or default to FontWeight.w500
            // fontFamily: 'Poppins',
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
            fontWeight: fontWeight ??
                FontWeight
                    .w400, // Use the provided fontWeight or default to FontWeight.w500
            fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    ),
  );
}
