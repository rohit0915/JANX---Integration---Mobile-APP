import 'package:flutter/material.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomLanguage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String text;

  CustomLanguage({
    required this.title,
    required this.subtitle,
    required this.text,
  });

  @override
  _CustomLanguageState createState() => _CustomLanguageState();
}

class _CustomLanguageState extends State<CustomLanguage> {
  bool isSelected = false; // State to manage if card is selected

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected; // Toggle selection state on tap
        });
      },
      child: Card(
        elevation: 4,
        child: Container(
          width: Adaptive.w(38),
          height: 14.h,
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffF4BC1C) : Colors.white, // Change color based on selection
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                 isSelected?  Image.asset('assets/lang.png'):const SizedBox(),
                  buildHSpacer(1.w)
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.subtitle,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black26, // Change text color based on selection
                  fontSize: 14.0,
                ),
              ),
              const Spacer(), // Using Spacer to push the last text to the bottom
              Text(
                widget.text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black26, // Change text color based on selection
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
