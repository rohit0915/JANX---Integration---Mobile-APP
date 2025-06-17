import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff444444),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: const Color(0xffF4BC1C),
                        size: 18.sp,
                        
                      )),
                  const SizedBox(width: 100),
                  _buildTextHeader(
                      title: "Report", color: Colors.white, size: 22.px),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  SizedBox(height: 8.h),
                  _buildReportRow("Name of the Product", "Turmeric"),
                  const SizedBox(height: 20),
                  _buildReportRow("Quality", "Good"),
                  const SizedBox(height: 20),
                  _buildReportRow("Quantity", "Same as mentioned"),
                  const SizedBox(height: 20),
                  _buildReportRow("Color", "Yellow"),
                  const SizedBox(height: 20),
                  _buildReportRow("Price", "40000/-"),
                  const SizedBox(height: 20),
                  _buildReportRow("Rating", "4.9/5.0"),
                  const SizedBox(height: 20),
                  _buildReportRow("Proccedings", "Yes"),
                  const SizedBox(height: 20),
                  _buildReportRow("Remarks", "Yes"),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            _buildTextHeader(
                title: "Note : You can buy Product without\nany issues",
                color: const Color(0xffF4BC1C)),
            const SizedBox(height: 50),
            Image.asset("assets/share.png"),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomButton(text: "Back", onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportRow(String label, String value) {
    return Row(
      children: [
        Expanded(child: _buildText(title: label, color: Colors.white)),
        const SizedBox(width: 10),
        _buildText(title: ":", color: Colors.white),
        const SizedBox(width: 10),
        Expanded(child: _buildText(title: value, color: Colors.white)),
      ],
    );
  }

  Widget _buildTextHeader(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size ?? 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: 'Poppins',
        color: color ?? Colors.black,
      ),
    );
  }

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
              fontSize: size ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
              fontFamily: 'Poppins',
              color: color ?? Colors.black),
        ),
      ),
    );
  }
}
