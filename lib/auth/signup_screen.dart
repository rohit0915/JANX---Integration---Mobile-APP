import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'signIn_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/launch.png",
                height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                fit: BoxFit.fill,
              ),
            
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text("New Here? Create Account",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 22)),
                    ),
                    _buildText(title: 'User Name'),
                    buildCustomTextField1(hintText:'Enter Your Name',controller: nameController  ),
                    _buildText(title: 'Email ID'),
                    buildCustomTextField1(hintText:'Enter Your Email ID', controller: emailController ),
                    _buildText(title: 'Mobile Number'),
                    buildCustomTextField1(hintText:'+91  Enter Your Mobile Number', controller: phoneController ),
                    _buildText(title: 'Password'),
                    buildCustomTextField1(hintText:'Enter new strong Password', controller: passwordController ),
                    _buildText(title: 'Confirm Password'),
                    buildCustomTextField1(hintText:'Re-enter the password', controller: repasswordController ),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: (){},
                    ),
                    buildVSpacer(20),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Already Registered ? Log In Now',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
            
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildText({
    required String title,
    double? size,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: GoogleFonts.beVietnamPro(
            fontSize: size ?? 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
