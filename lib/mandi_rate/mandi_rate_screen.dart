import 'package:flutter/material.dart';

class MandiRateScreen extends StatefulWidget {
  const MandiRateScreen({super.key});

  @override
  State<MandiRateScreen> createState() => _MandiRateScreenState();
}

class _MandiRateScreenState extends State<MandiRateScreen> {
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
          title: Container(
    decoration: BoxDecoration(
    color: const Color(0xffF4BC1C),
      borderRadius: BorderRadius.circular(10)
    ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: _buildTextHeader(title: "Mandi Rates"),
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
        ));
  }
}


Widget _buildTextHeader({
  required String title,
  double? size,
  FontWeight? fontWeight,
  Color? color
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: size ?? 14,
            fontWeight: fontWeight ?? FontWeight.w500, // Use the provided fontWeight or default to FontWeight.w500
            fontFamily: 'Poppins',
            color: color?? Colors.black
        ),
      ),
    ),
  );
}