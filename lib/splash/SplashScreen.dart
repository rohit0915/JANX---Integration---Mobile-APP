import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jan_x/splash/SplashScreen_2.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationController.forward();

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SplashScreen2(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Color(0xffF4BC1C),
        child: Center(
          child: SizedBox(
            // height: screenHeight * 0.5, // Adjust height as needed
            child: Image.asset(
              "assets/splashjanx.png",
              fit: BoxFit.cover, // Adjust fit if necessary
            ),
          ),
        ),
      ),
    );
  }
}
