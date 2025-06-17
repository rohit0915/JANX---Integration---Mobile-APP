import 'package:flutter/material.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryItem extends StatefulWidget {
  final bool isSelectedScreen;
  const CategoryItem({Key? key, required this.isSelectedScreen})
      : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: Adaptive.w(8),
                  backgroundColor: white,
                  child: Center(
                    child: widget.isSelectedScreen == false
                        ? Image.asset('assets/category1.png')
                        : Image.asset('assets/category2.png')
                  ),
                ),
                buildVSpacer(1.h),
                _buildText(
                  title: "Turmeric",
                  size: 14.px,
                  color: white,
                ),
              ],
            ),
          ),
          Positioned(
            right: Adaptive.w(7),
            child: isClicked
                ? Image.asset('assets/selected.png')
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildText({
    required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Colors.black,
      ),
    );
  }
}
