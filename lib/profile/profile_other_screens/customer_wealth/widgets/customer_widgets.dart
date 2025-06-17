import 'package:flutter/material.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReusableCheckboxRow extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final double? size;
  // final FontWeight fontWeight;

  ReusableCheckboxRow(
      {required this.title,
      required this.value,
      required this.onChanged,
      this.size

      // this.fontWeight =,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: white,
            fontSize:size??14.px,
            fontWeight: FontWeight.w600,
          ),
        ),
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: Colors.white, // Toggle color

          activeColor: const Color(0xFF877E7E), // Background color when checked
          side: const BorderSide(
              color: Color(0xFF877E7E), width: 2), // Border color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // Rounded corners
          ),
        ),
      ],
    );
  }
}
