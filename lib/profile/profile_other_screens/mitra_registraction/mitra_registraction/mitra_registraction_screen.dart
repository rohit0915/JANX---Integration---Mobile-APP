import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/mitra_registraction/mitra_registraction/mitra_registrraction_subscription.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jan_x/services/kyc_service.dart';
import 'dart:convert';

class MitraRegistractionScreen extends StatefulWidget {
  const MitraRegistractionScreen({super.key});

  @override
  State<MitraRegistractionScreen> createState() =>
      _MitraRegistractionScreenState();
}

class _MitraRegistractionScreenState extends State<MitraRegistractionScreen> {
  String? selectedAccountType; // "Company" or "Individual"
  String? selectedIndustry; // "Agriculture" or "Pharma"

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  // Controllers for form fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController otherDetailController = TextEditingController();
  final TextEditingController emergencyContactController =
      TextEditingController();

  // Checkbox states
  bool agreeUpdates = false;
  bool agreeTerms = false;

  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';

    return null;
  }

  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) return 'Mobile is required';
    if (value.length < 10) return 'Enter a valid mobile number';
    return null;
  }

  String? _validateRequired(String? value, String field) {
    if (value == null || value.isEmpty) return '$field is required';
    return null;
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    otherDetailController.dispose();
    emergencyContactController.dispose();
    super.dispose();
  }

  Future<void> _submitMitraRegistration() async {
    if (!_formKey.currentState!.validate()) return;
    if (!agreeUpdates || !agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please agree to all terms and updates.')),
      );
      return;
    }
    final box = GetStorage();
    final token = box.read('token');
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not logged in.')),
      );
      return;
    }
    final kycService = Get.find<KycService>();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(child: CircularProgressIndicator()),
    );
    // Prepare data
    final data = {
      "account_type": selectedAccountType ?? '',
      "industry": selectedIndustry ?? '',

      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "mobile": mobileController.text,
      "email": emailController.text,
      "company_address": addressController.text,
      "pincode": pincodeController.text,
      "other_detail": otherDetailController.text,
      "emergecny_contact": emergencyContactController.text,
      // For demo, image upload is not implemented. Add image logic if needed.
      // "passport_size_photo": _selectedImage != null ? base64Encode(_selectedImage!.readAsBytesSync()) : null,
      "location": {
        "coordinates": [77.5946, 12.9716]
      },
    };
    print('Submitting Mitra Registration Data:');
    print(data);
    try {
      final response = await kycService.postMitraRegistration(data);
      print('Mitra Registration Response:');
      print('Status: ${response.statusCode}');
      print('Body: ${response.body}');
      Navigator.pop(context);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mitra registration successful!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MitraSubscriptionScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User Already Registerd.')),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      print('Mitra Registration Error: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
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
          child: Form(
            key: _formKey,
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
                            title1: "First Name",
                            hintText: "Sidhu",
                            controller: firstNameController,
                            validator: (v) =>
                                _validateRequired(v, 'First Name'))),
                    buildHSpacer(8.w),
                    Expanded(
                      flex: 1,
                      child: textFieldMethod(
                          title1: "Second Name",
                          hintText: "Gowda",
                          controller: lastNameController,
                          validator: (v) => _validateRequired(v, 'Last Name')),
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
                            title1: "Mobile",
                            hintText: "+91 888990022",
                            controller: mobileController,
                            validator: _validateMobile)),
                    buildHSpacer(8.w),
                    Expanded(
                      flex: 1,
                      child: textFieldMethod(
                          title1: "Official Email/Personal",
                          hintText: "Sidhu@gmail.com",
                          controller: emailController,
                          validator: _validateEmail),
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
                            hintText: "Bangalore........",
                            controller: addressController,
                            validator: (v) => _validateRequired(v, 'Address'))),
                    buildHSpacer(8.w),
                    Expanded(
                      flex: 1,
                      child: textFieldMethod(
                          title1: "Pincode",
                          hintText: "57001",
                          controller: pincodeController,
                          validator: (v) => _validateRequired(v, 'Pincode')),
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
                            hintText: "Bangalore........",
                            controller: otherDetailController,
                            validator: (v) =>
                                _validateRequired(v, 'Other Detail'))),
                    buildHSpacer(8.w),
                    Expanded(
                      flex: 1,
                      child: textFieldMethod(
                          title1: "Emergency Contact",
                          hintText: "+91 1234",
                          controller: emergencyContactController,
                          validator: (v) =>
                              _validateRequired(v, 'Emergency Contact')),
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
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
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
                        _selectedImage != null
                            ? Image.file(_selectedImage!, height: 60)
                            : Image.asset('assets/mitra_Regi2.png'),
                        buildVSpacer(2.h),
                        _buildText(
                            title: "Upload Images Only in JPG and PNG",
                            size: 8.px,
                            fontWeight: FontWeight.w500,
                            color: white)
                      ],
                    ),
                  ),
                ),
                buildVSpacer(3.h),
                Row(
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          side: BorderSide(color: Colors.white),
                          checkColor: MaterialStateProperty.all(Colors.white),
                          fillColor: MaterialStateProperty.all(Colors.black26),
                        ),
                      ),
                      child: Checkbox(
                        value: agreeUpdates,
                        onChanged: (bool? value) {
                          setState(() {
                            agreeUpdates = value ?? false;
                          });
                        },
                      ),
                    ),
                    buildHSpacer(4.w),
                    _buildText(
                        title:
                            "I agree to receive important update by smd,email,\nWhatsApp or other services",
                        size: 12.px,
                        fontWeight: FontWeight.w500,
                        color: white)
                  ],
                ),
                Row(
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          side: BorderSide(color: Colors.white),
                          checkColor: MaterialStateProperty.all(Colors.white),
                          fillColor: MaterialStateProperty.all(Colors.black26),
                        ),
                      ),
                      child: Checkbox(
                        value: agreeTerms,
                        onChanged: (bool? value) {
                          setState(() {
                            agreeTerms = value ?? false;
                          });
                        },
                      ),
                    ),
                    buildHSpacer(4.w),
                    _buildText(
                        title:
                            "I agree to terms & Conditions and Privacy Policy",
                        size: 12.px,
                        fontWeight: FontWeight.w500,
                        color: white)
                  ],
                ),
                buildVSpacer(3.h),
                CustomButton(
                  text: "Submit Application",
                  onPressed: _submitMitraRegistration,
                  size: 19.px,
                  weight: FontWeight.w400,
                ),
                buildVSpacer(3.h)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column textFieldMethod(
      {required String title1,
      required String hintText,
      TextEditingController? controller,
      FormFieldValidator<String>? validator}) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: _buildText(title: title1, size: 11.px, color: white)),
        SizedBox(
          height: Adaptive.h(6),
          child: TextFormField(
            controller: controller,
            validator: validator,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText(title: "Select Industry", size: 12.px, color: white),
        buildVSpacer(1.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.sp),
            border: Border.all(color: white),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              value: selectedIndustry,
              hint: _buildText(title: "Select", size: 14.px, color: white),
              isExpanded: true,
              items: ['Agriculture', 'Pharma'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: _buildText(
                      title: value, size: 14.px, fontWeight: FontWeight.w500),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedIndustry = value!;
                });
              },
              icon: Icon(Icons.arrow_drop_down, color: white),
            ),
          ),
        ),
      ],
    );
  }

  Column registerMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText(title: "You want to register", size: 12.px, color: white),
        buildVSpacer(1.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.sp),
            border: Border.all(color: white),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              value: selectedAccountType,
              hint: _buildText(title: "Select", size: 14.px, color: black),
              isExpanded: true,
              items: ['Company', 'Individual'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: _buildText(
                      title: value, size: 14.px, fontWeight: FontWeight.w500),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedAccountType = value!;
                });
              },
              icon: Icon(Icons.arrow_drop_down, color: white),
            ),
          ),
        ),
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
