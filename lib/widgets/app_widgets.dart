import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

SizedBox buildVSpacer(double height) => SizedBox(height: height);

SizedBox buildHSpacer(double width) => SizedBox(width: width);

Container buildCustomTextField1({
  TextEditingController? controller, 
  String? hintText,
  double? hMargin,
  double? vMargin,
  double? headerSize,
  Widget? suffixIcon,
  double? inputContainerHeight,
  bool? expands,
}) {
  return Container(
    margin:
        EdgeInsets.symmetric(horizontal: hMargin ?? 0, vertical: vMargin ?? 20),
    width: double.maxFinite,
    color: Colors.transparent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Container(
            padding: const EdgeInsets.only(left: 18),
            height: inputContainerHeight ?? 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: controller ??
                    TextEditingController(), // Use null coalescing operator to provide default controller
                expands: expands ?? false,
                maxLines: null,
                minLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: hintText ?? 'Enter Text',
                  hintStyle: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  suffixIcon: suffixIcon,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Container buildCustomTextField3({
  TextEditingController? controller, // Add TextEditingController parameter
  String? hintText,
  double? hMargin,
  double? vMargin,
  double? headerSize,
  Widget? suffixIcon,
  String? prefix,
  double? inputContainerHeight,
  Color?color,
  bool? expands,
}) {
  return Container(
    margin:
        EdgeInsets.symmetric(horizontal: hMargin ?? 0, vertical: vMargin ?? 10),
    width: double.maxFinite,
    color: Colors.transparent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Container(
            padding: const EdgeInsets.only(left: 5),
            height: inputContainerHeight ?? 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color:color?? const Color(0xffF4BC1C),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: controller ??
                    TextEditingController(), // Use null coalescing operator to provide default controller
                expands: expands ?? false,
                maxLines: null,
                minLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: hintText ?? 'Enter Text',
                  hintStyle: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color:color?? const Color(0xffF4BC1C),
                  ),
                 suffixIcon: Row(
      mainAxisSize: MainAxisSize.min, // Ensure the Row takes up only necessary space
      children: [
        if (suffixIcon != null) suffixIcon!, // Display the original suffix icon if provided
        Text(
          prefix??"", // Replace with your desired text
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: const Color(0xffF4BC1C),
          ),
        ),
      ],
    ),
                  prefix: suffixIcon,
                  suffixText: 'QT', // Add your fixed text here
                  suffixStyle: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: const Color(0xffF4BC1C),
                  ),
                  // suffixStyle: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 14.px,color:const Color(0xffF4BC1C))
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Container buildCustomTextField(
    {TextEditingController? controller, // Add TextEditingController parameter
    String? hintText,
    double? hMargin,
    double? vMargin,
    double? headerSize,
    Widget? suffixIcon,
    double? inputContainerHeight,
    bool? expands,
    double? size}) {
  return Container(
    margin:
        EdgeInsets.symmetric(horizontal: hMargin ?? 0, vertical: vMargin ?? 20),
    width: double.maxFinite,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            padding: const EdgeInsets.only(left: 18),
            height: inputContainerHeight ?? 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: controller ??
                    TextEditingController(), // Use null coalescing operator to provide default controller
                expands: expands ?? false,
                maxLines: null,
                minLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: hintText ?? 'Enter Text',
                  hintStyle: GoogleFonts.beVietnamPro(
                    fontSize: size ?? 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  suffixIcon: suffixIcon,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Container buildCustomTextField2({
  TextEditingController? controller, // Add TextEditingController parameter
  String? hintText,
  double? hMargin,
  double? vMargin,
  double? headerSize,
  Widget? suffixIcon,
  double? inputContainerHeight,
  bool? expands,
}) {
  return Container(
    margin:
        EdgeInsets.symmetric(horizontal: hMargin ?? 0, vertical: vMargin ?? 20),
    width: double.maxFinite,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Container(
            padding: const EdgeInsets.only(left: 18),
            height: inputContainerHeight ?? 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: const Color(0xffF4BC1C),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: controller ??
                    TextEditingController(), // Use null coalescing operator to provide default controller
                expands: expands ?? false,
                maxLines: null,
                minLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: hintText ?? 'Enter Text',
                  hintStyle: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  suffixIcon: suffixIcon,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildTextHeader({
  required String title,
  double? size,
  FontWeight? fontWeight, // Added fontWeight parameter
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: size ?? 14,
          fontWeight: fontWeight ??
              FontWeight
                  .w500, // Use the provided fontWeight or default to FontWeight.w500
          fontFamily: 'Poppins',
        ),
      ),
    ),
  );
}
