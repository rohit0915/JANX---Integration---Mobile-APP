import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? textColor;
  final double? size;
  final FontWeight? weight;

  CustomButton(
      {required this.text,
      required this.onPressed,
      this.width,
      this.color,
      this.textColor,
      this.size,
      this.weight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Color(0xFFEDB31B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: textColor ?? Colors.black,
              fontSize: size ?? 16.0,
              fontWeight: weight ?? FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor; // Optional background color
  final Color textColor; // Optional text color
  final double? width;
  // Constructor with default values for the optional color parameters
  CustomButton1(
      {required this.text,
      required this.onPressed,
      this.backgroundColor =
          const Color(0xFFEDB31B), // Default background color
      this.textColor = Colors.black,
      this.width // Default text color
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 130,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Use the instance's backgroundColor
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: TextStyle(
              color: textColor, // Use the instance's textColor
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton3 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? textColor;
  final double? size;
  final Color? borderColor; // New property for border color
  final double? height;
  final FontWeight? weight;

  CustomButton3(
      {required this.text,
      required this.onPressed,
      this.width,
      this.color,
      this.textColor,
      this.size,
      this.borderColor,
      this.height,
      this.weight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Color(0xFFEDB31B),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color:
                    borderColor ?? Colors.transparent, // Set the border color
                width: 1.0, // Border width
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(0)),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: textColor ?? Colors.black,
              fontSize: size ?? 16.0,
              fontWeight: weight ?? FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton_continue extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon; // Adding an icon field

  CustomButton_continue({
    required this.text,
    required this.onPressed,
    this.icon, // Making icon a required parameter
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,y
      
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFEDB31B), // Background color of the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 12.0), // Adjust padding as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the contents
            children: [
              Text(
                text,
                style:const  TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward, // Use the icon passed to the widget
                color: Colors.black, // Icon color
                size: 24.0, // Icon size
              ),
            ],
          ),
        ),
      ),
    );
  }
}
