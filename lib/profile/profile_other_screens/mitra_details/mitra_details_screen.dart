import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/mitra_details/mitra_profile/mitra_profile_screen.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraDetailsScreen extends StatelessWidget {
  const MitraDetailsScreen({super.key});

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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.h(2)),
        child: Column(
          children: [
            Center(
                child: _buildText(
                    title: "Your Mitra Profile",
                    size: 18.px,
                    fontWeight: FontWeight.w700,
                    color: white)),
            buildVSpacer(2.h),
            Image.asset('assets/mitradetails.png'),
            buildVSpacer(1.h),
            _buildText(
                title: "Your mitra photo",
                size: 10.px,
                fontWeight: FontWeight.w400,
                color: white),
            buildVSpacer(2.h),
            _MitraDetailsFormWidget(
              hintText: "Mitra Id",
              suffix: const Icon(
                Icons.arrow_drop_down,
                color: white,
              ),
            ),
            buildVSpacer(2.h),
            _MitraDetailsFormWidget(hintText: "Name"),
            buildVSpacer(2.h),
            _MitraDetailsFormWidget(hintText: "Mobile Number"),
            buildVSpacer(2.h),
            _MitraDetailsFormWidget(hintText: "Email Id"),
            buildVSpacer(2.h),
            _MitraDetailsFormWidget(hintText: "Address"),
            buildVSpacer(8.h),
            CustomButton(
                text: "Save",
                onPressed: () {
                  showCustomDialogProfile(context);
                })
          ],
        ),
      ),
    );
  }

  Future<void> showCustomDialogProfile(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Set to true if you want to dismiss the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: white,
          contentPadding: const EdgeInsets.all(0), // Remove default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 16.0, right: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildVSpacer(5.h),
                    const Text(
                      "Once data has been saved\nyour are unable to edit",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: buttonColor),
                      textAlign: TextAlign.center,
                    ),
                    buildVSpacer(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          text: "Yes",
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MitraProfileDetailsScreen(),
                                ));
                          },
                          color: buttonColor,
                          width: Adaptive.w(30),
                        ),
                        buildHSpacer(8.w),
                        CustomButton(
                          text: "No",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: buttonColor,
                          width: Adaptive.w(30),
                        )
                      ],
                    ),
                    buildVSpacer(5.h)
                  ],
                ),
              ),
              Positioned(
                  top: -Adaptive.h(0.1.h),
                  right: -Adaptive.w(2),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: Adaptive.w(5),
                      backgroundColor: black,
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: white,
                        ),
                      ),
                    ),
                  )
                  // IconButton(
                  //   icon: Icon(Icons.close),
                  //   onPressed: () {
                  //     Navigator.of(context).pop(false); // Close dialog with No action
                  //   },
                  // ),
                  ),
            ],
          ),
        );
      },
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

class _MitraDetailsFormWidget extends StatelessWidget {
  _MitraDetailsFormWidget({super.key, required this.hintText, this.suffix});
  final hintText;
  Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Adaptive.h(6),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.lato(
              fontWeight: FontWeight.w400, fontSize: 13.px, color: buttonColor),
          suffixIcon: suffix != null ? suffix : const SizedBox(),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: buttonColor)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: buttonColor)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: buttonColor),
              borderRadius: BorderRadius.circular(12.sp)),
        ),
      ),
    );
  }
}
