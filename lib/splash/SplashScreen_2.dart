import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/language_selection/LanguageScreen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _logoAnimation;
  late Animation<double> _imageAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Logo animation: from larger to normal size
    _logoAnimation = Tween<double>(begin: 1.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    // Positioned image animation: from smaller to normal size
    _imageAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: Adaptive.w(100),
            height: Adaptive.h(100),
            decoration: const BoxDecoration(
              color: Color(0xffF4BC1C),
            ),
          ),
          Positioned(
            bottom: -Adaptive.h(8),
            right: -Adaptive.w(5),
            child: AnimatedBuilder(
              animation: _imageAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _imageAnimation.value,
                  child: SizedBox(
                    width: Adaptive.w(90),
                    height: Adaptive.h(40),
                    child: Image.asset(
                      'assets/Jan-xSplashScreenImage01.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildVSpacer(10.h),
                // The logo at the center with animation
                AnimatedBuilder(
                  animation: _logoAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _logoAnimation.value,
                      child: Image.asset('assets/janxlogo.png'),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: Adaptive.h(15)), // Adjust the bottom spacing
                  child: Column(
                    children: [
                      Text(
                        "Jan Se, Jan Tak",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w700,
                          fontSize: 12.px,
                          color: Colors.black,
                        ),
                      ),
                      buildVSpacer(3.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  LanguageScreen(isFromProfile: false),
                            ),
                          );
                        },
                        child: Container(
                          height: Adaptive.h(6),
                          width: Adaptive.w(70),
                          padding: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                            color: const Color(0xff444444),
                            borderRadius: BorderRadius.circular(14.sp),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Continue",
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 19.px,
                                  color: buttonColor,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_outlined,
                                color: buttonColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
