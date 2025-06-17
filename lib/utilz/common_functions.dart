
  import 'package:flutter/material.dart';

Widget buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color,
      bool align = false}) {
    return align
        ? Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: size ?? 14,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  fontFamily: 'Poppins',
                  color: color ?? Colors.black),
            ),
          )
        : Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: size ?? 14,
                fontWeight: fontWeight ?? FontWeight.w400,
                fontFamily: 'Poppins',
                color: color ?? Colors.black),
          );
  }