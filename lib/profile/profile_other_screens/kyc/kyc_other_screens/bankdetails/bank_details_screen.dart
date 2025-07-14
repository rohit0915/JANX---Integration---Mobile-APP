import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jan_x/services/kyc_service.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({super.key});

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController reAccountNumberController =
      TextEditingController();
  final TextEditingController accountHolderNameController =
      TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();

  @override
  void dispose() {
    bankNameController.dispose();
    accountNumberController.dispose();
    reAccountNumberController.dispose();
    accountHolderNameController.dispose();
    ifscCodeController.dispose();
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
        title: _buildText(
          title: "Bank Details",
          color: buttonColor,
          size: 18.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
        child: Column(
          children: [
            buildVSpacer(3.h),
            Center(child: Image.asset('assets/bank.png')),
            _buildText(
                title: "Please add your Bank details",
                size: 15.px,
                fontWeight: FontWeight.w500,
                color: buttonColor),
            buildVSpacer(6.h),
            CustomTxtFormField(
                hintText: "Select Bank",
                icon: Icon(Icons.keyboard_arrow_down),
                controller: bankNameController),
            buildVSpacer(1.h),
            CustomTxtFormField(
                hintText: "Account Number",
                controller: accountNumberController),
            buildVSpacer(1.h),
            CustomTxtFormField(
                hintText: "Re-Enter Account Number",
                controller: reAccountNumberController),
            buildVSpacer(1.h),
            CustomTxtFormField(
                hintText: "Account Hoder name",
                controller: accountHolderNameController),
            buildVSpacer(1.h),
            CustomTxtFormField(
                hintText: "IFSC Code", controller: ifscCodeController),
            buildVSpacer(1.h),
            // Add a submit button if not present
            ElevatedButton(
              onPressed: () => _submitBankKyc(context),
              child: Text('Submit'),
            ),
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
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }

  void _submitBankKyc(BuildContext context) async {
    final box = GetStorage();
    final token = box.read('token');
    if (token == null) return;
    final kycService = Get.find<KycService>();
    
    final data = {
      'bank_name': bankNameController.text,
      'account_number': accountNumberController.text,
      're_account_number': reAccountNumberController.text,
      'account_holder_name': accountHolderNameController.text,
      'ifsc_code': ifscCodeController.text,
     
    };
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Center(child: CircularProgressIndicator()));
    final response = await kycService.addBankDetails(data, );
    Navigator.pop(context);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bank KYC submitted successfully.')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to submit Bank KYC.')));
    }
  }
}
