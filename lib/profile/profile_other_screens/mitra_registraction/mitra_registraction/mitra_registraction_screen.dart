import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/mitra_registraction/mitra_registraction/mitra_registrraction_subscription.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraRegistractionScreen extends StatefulWidget {
  const MitraRegistractionScreen({super.key});

  @override
  State<MitraRegistractionScreen> createState() =>
      _MitraRegistractionScreenState();
}

class _MitraRegistractionScreenState extends State<MitraRegistractionScreen> {
  bool isClicked1 = false;
  bool isClicked2 = false;
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
          title: "Mitra Registration",
          color: white,
          size: 24.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildVSpacer(3.h),
              registerMethod(),
              buildVSpacer(4.h),
              registerIndustryMethod(),
              buildVSpacer(4.h),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      flex: 1,
                      child: textFieldMethod(
                          title1: "First Name", hintText: "Sidhu")),
                  buildHSpacer(8.w),
                  Expanded(
                    flex: 1,
                    child: textFieldMethod(
                        title1: "Second Name", hintText: "Gowda"),
                  )
                ],
              ),
              buildVSpacer(4.h),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      flex: 1,
                      child: textFieldMethod(
                          title1: "Mobile", hintText: "+91 888990022")),
                  buildHSpacer(8.w),
                  Expanded(
                    flex: 1,
                    child: textFieldMethod(
                        title1: "Official Email/Personal",
                        hintText: "Sidhu@gmail.com"),
                  )
                ],
              ),
              buildVSpacer(4.h),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      flex: 1,
                      child: textFieldMethod(
                          title1: "Company Address / Home",
                          hintText: "Bangalore........")),
                  buildHSpacer(8.w),
                  Expanded(
                    flex: 1,
                    child:
                        textFieldMethod(title1: "Pincode", hintText: "57001"),
                  )
                ],
              ),
              buildVSpacer(4.h),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      flex: 1,
                      child: textFieldMethod(
                          title1: "Other Detail",
                          hintText: "Bangalore........")),
                  buildHSpacer(8.w),
                  Expanded(
                    flex: 1,
                    child: textFieldMethod(
                        title1: "Emergency Contact", hintText: "+91 1234"),
                  )
                ],
              ),
              buildVSpacer(4.h),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildText(
                    title: "Upload Your Recent Passport Size Photo",
                    size: 12.px,
                    color: white,
                    fontWeight: FontWeight.w800),
              ),
              buildVSpacer(1.h),
              Container(
                height: Adaptive.h(12),
                width: Adaptive.w(100),
                decoration: BoxDecoration(
                  border: Border.all(color: white),
                  borderRadius: BorderRadius.circular(14.sp),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/mitra_Regi2.png'),
                    buildVSpacer(2.h),
                    _buildText(
                        title: "Upload Images Only in JPG and PNG",
                        size: 8.px,
                        fontWeight: FontWeight.w500,
                        color: white)
                  ],
                ),
              ),
              buildVSpacer(3.h),
              Row(
                children: [
                  Theme(
                    data: ThemeData(
                      // Customizing the checkbox colors
                      checkboxTheme: CheckboxThemeData(
                        side: BorderSide(color: Colors.white), // Border color
                        checkColor: MaterialStateProperty.all(
                            Colors.white), // Check color
                        fillColor: MaterialStateProperty.all(
                            Colors.black26), // Checkbox color
                      ),
                    ),
                    child: Checkbox(
                      value: false,
                      onChanged: (bool? value) {
                        // Handle change
                      },
                    ),
                  ),
                  buildHSpacer(4.w),
                  _buildText(
                      title:
                          "I agree to receive important update by smd,email,\nWhatsApp or other services",
                      size: 12.px,
                      fontWeight: FontWeight.w500,color: white)
                ],
              ),
              Row(
                children: [
                  Theme(
                    data: ThemeData(
                      // Customizing the checkbox colors
                      checkboxTheme: CheckboxThemeData(
                        side: BorderSide(color: Colors.white), // Border color
                        checkColor: MaterialStateProperty.all(
                            Colors.white), // Check color
                        fillColor: MaterialStateProperty.all(
                            Colors.black26), // Checkbox color
                      ),
                    ),
                    child: Checkbox(
                      value: false,
                      onChanged: (bool? value) {
                        // Handle change
                      },
                    ),
                  ),
                  buildHSpacer(4.w),
                  _buildText(
                      title:
                          "I agree to terms & Conditions and Privacy Policy",
                      size: 12.px,
                      fontWeight: FontWeight.w500,color: white)
                ],
              ),
              buildVSpacer(3.h),
              CustomButton(text: "Submit Application", onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MitraSubscriptionScreen(),));
              },
              size: 19.px,weight: FontWeight.w400,
              ),
              buildVSpacer(3.h)
            ],
          ),
        ),
      ),
    );
  }

  Column textFieldMethod({required String title1, required String hintText}) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: _buildText(title: title1, size: 11.px, color: white)),
        SizedBox(
          height: Adaptive.h(6),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GoogleFonts.lato(
                    fontWeight: FontWeight.w400, fontSize: 11.px, color: white),
                suffixIcon: Image.asset('assets/mitra_registraction.png'),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: white)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: white)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: white))),
          ),
        )
      ],
    );
  }

  Column registerIndustryMethod() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child:
              _buildText(title: "Select Industry", size: 12.px, color: white),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isClicked2 = !isClicked2;
            });
          },
          child: Container(
            height: Adaptive.h(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.sp),
                border: Border.all(color: white)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.arrow_drop_down,
                  color: white,
                )
              ],
            ),
          ),
        ),
        isClicked2
            ? Container(
                padding: EdgeInsets.all(14.sp),
                decoration: const BoxDecoration(color: white),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        buildHSpacer(4.w),
                        _buildText(
                            title: "Agriculture",
                            size: 14.px,
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                    buildVSpacer(2.h),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        buildHSpacer(4.w),
                        _buildText(
                            title: "Pharma",
                            size: 14.px,
                            fontWeight: FontWeight.w500)
                      ],
                    )
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }

  Column registerMethod() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: _buildText(
              title: "You want to register", size: 12.px, color: white),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isClicked1 = !isClicked1;
            });
          },
          child: Container(
            height: Adaptive.h(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.sp),
                border: Border.all(color: white)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.arrow_drop_down,
                  color: white,
                )
              ],
            ),
          ),
        ),
        isClicked1
            ? Container(
                padding: EdgeInsets.all(14.sp),
                decoration: const BoxDecoration(color: white),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: Adaptive.w(3.5),
                          backgroundColor: const Color(0xff444444),
                          child: Center(
                            child: CircleAvatar(
                              radius: Adaptive.w(2),
                              backgroundColor: buttonColor,
                            ),
                          ),
                        ),
                        buildHSpacer(4.w),
                        _buildText(
                            title: "On behalf of your company",
                            size: 14.px,
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                    buildVSpacer(2.h),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: Adaptive.w(3.5),
                          backgroundColor: const Color(0xff444444),
                          child: Center(
                            child: CircleAvatar(
                              radius: Adaptive.w(2),
                              backgroundColor: white,
                            ),
                          ),
                        ),
                        buildHSpacer(4.w),
                        _buildText(
                            title: "On behalf of your company",
                            size: 14.px,
                            fontWeight: FontWeight.w500)
                      ],
                    )
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Text(
      title,
      //  textAlign: TextAlign.start,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
