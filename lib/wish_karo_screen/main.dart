// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jan_x/splash/SplashScreen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xff444444),
          appBarTheme: AppBarTheme(
            backgroundColor: backgroundColor
          ),
            // This is the theme of your application.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SplashScreen(),
        );
      }
    );
  }
}
