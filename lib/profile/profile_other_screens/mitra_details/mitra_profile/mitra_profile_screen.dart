import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:jan_x/services/mitra_service.dart';
import 'package:jan_x/model/mitra_models.dart';

class MitraProfileDetailsScreen extends StatelessWidget {
  const MitraProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MitraService mitraService = Get.find<MitraService>();
    // Fetch mitra profile on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mitraService.getMitraProfile();
    });
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
      body: Obx(() {
        if (mitraService.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (mitraService.error.value.isNotEmpty) {
          return Center(child: Text('Error: ' + mitraService.error.value));
        }
        if (mitraService.mitraProfiles.isEmpty) {
          return Center(child: Text('No mitra profile found.'));
        }
  
        final profile = mitraService.mitraProfiles.first;
        return Padding(
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
              mitraProfileMethod(title: "Mitra ID: ..."),
              buildVSpacer(2.h),
              mitraProfileMethod(title: "Name: ..."),
              buildVSpacer(2.h),
              mitraProfileMethod(title: "Mobile: ..."),
              buildVSpacer(2.h),
              mitraProfileMethod(title: "Email: ..."),
              buildVSpacer(2.h),
              mitraProfileMethod(title: "Address: ..."),
              buildVSpacer(10.h),
              CustomButton(
                text: "Edit",
                onPressed: () {
                  _showCustomDialogProfile(context);
                },
              ),
              buildVSpacer(2.h),
              CustomButton(
                text: "Back",
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      }),
    );
  }

  Future<void> _showCustomDialogProfile(BuildContext context) async {
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
                    Text(
                      "Please Connect to customer care\nfor the any changes in mitra",
                      style: GoogleFonts.lato(
                          fontSize: 16.px,
                          fontWeight: FontWeight.w800,
                          color: buttonColor),
                      textAlign: TextAlign.center,
                    ),
                    buildVSpacer(5.h),
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

  Container mitraProfileMethod({required String title}) {
    return Container(
      height: Adaptive.h(6),
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
          border: Border.all(color: buttonColor),
          borderRadius: BorderRadius.circular(12.sp)),
      child: Row(
        children: [
          _buildText(title: title, size: 12.px, color: buttonColor),
          Spacer(),
          Icon(
            Icons.lock,
            color: buttonColor,
          )
        ],
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
      //  textAlign: TextAlign.start,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
