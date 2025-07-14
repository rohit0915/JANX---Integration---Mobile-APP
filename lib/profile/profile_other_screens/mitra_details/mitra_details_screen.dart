import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/mitra_details/mitra_profile/mitra_profile_screen.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:jan_x/services/mitra_service.dart';

class MitraDetailsScreen extends StatefulWidget {
  const MitraDetailsScreen({super.key});

  @override
  State<MitraDetailsScreen> createState() => _MitraDetailsScreenState();
}

class _MitraDetailsScreenState extends State<MitraDetailsScreen> {
  final TextEditingController mitraIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  bool isLoading = false;
  final MitraService mitraService = Get.find<MitraService>();

  @override
  void dispose() {
    mitraIdController.dispose();
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    addressController.dispose();
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
              controller: mitraIdController,
              suffix: const Icon(
                Icons.arrow_drop_down,
                color: white,
              ),
            ),
            buildVSpacer(2.h),
            _MitraDetailsFormWidget(
                hintText: "Name", controller: nameController),
            buildVSpacer(2.h),
            _MitraDetailsFormWidget(
                hintText: "Mobile Number", controller: mobileController),
            buildVSpacer(2.h),
            _MitraDetailsFormWidget(
                hintText: "Email Id", controller: emailController),
            buildVSpacer(2.h),
            _MitraDetailsFormWidget(
                hintText: "Address", controller: addressController),
            buildVSpacer(8.h),
            isLoading
                ? CircularProgressIndicator()
                : CustomButton(
                    text: "Save",
                    onPressed: () async {
                      if (mitraIdController.text.isEmpty ||
                          nameController.text.isEmpty ||
                          mobileController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          addressController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill all fields.')),
                        );
                        return;
                      }
                      setState(() => isLoading = true);
                      final data = {
                        'mitra_id': mitraIdController.text,
                        'name': nameController.text,
                        'mobile': mobileController.text,
                        'email': emailController.text,
                        'address': addressController.text,
                      };
                      try {
                        final response =
                            await mitraService.createMitraProfile(data);
                        print('Create Mitra Profile API response: ' +
                            response.body);
                        setState(() => isLoading = false);
                        if (response.statusCode == 200 ||
                            response.statusCode == 201) {
                          showCustomDialogProfile(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Failed to create profile.')),
                          );
                        }
                      } catch (e) {
                        setState(() => isLoading = false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: ' + e.toString())),
                        );
                      }
                    }),
          ],
        ),
      ),
    );
  }

  Future<void> showCustomDialogProfile(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: white,
          contentPadding: const EdgeInsets.all(0),
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
                  )),
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
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black),
    );
  }
}

class _MitraDetailsFormWidget extends StatelessWidget {
  _MitraDetailsFormWidget(
      {super.key, required this.hintText, this.suffix, this.controller});
  final String hintText;
  final Widget? suffix;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Adaptive.h(6),
      child: TextField(
        controller: controller,
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
