import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jan_x/auth/signIn_screen.dart';
import 'package:jan_x/language_selection/widget/custom_language.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LanguageScreen extends StatefulWidget {
  @override
  bool isFromProfile = false; // Optional boolean parameter

  // Constructor with optional parameter
  LanguageScreen({required this.isFromProfile});

  State createState() => _LanguageScreenState(isFromProfile: isFromProfile);
}

class _LanguageScreenState extends State<LanguageScreen>
    with SingleTickerProviderStateMixin {
  bool isFromProfile = false; // Optional boolean parameter

  _LanguageScreenState({required this.isFromProfile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff444444),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xffF4BC1C),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xff444444),
                image: DecorationImage(
                  image: AssetImage("assets/splash3.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/language.png",
                      // height: 70,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    buildVSpacer(20),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomLanguage(
                            title: 'हिंदी',
                            subtitle: 'HINDI',
                            text: 'आ',
                          ),
                          buildHSpacer(10),
                          CustomLanguage(
                            title: 'English',
                            subtitle: 'ENGLISH',
                            text: 'A',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomLanguage(
                            title: 'Hinglish',
                            subtitle: 'Hinglish',
                            text: 'आ-A',
                          ),
                          buildHSpacer(10),
                          CustomLanguage(
                            title: 'मराठी',
                            subtitle: 'MARATHI',
                            text: 'म',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomLanguage(
                            title: 'ਪੰਜਾਬੀ',
                            subtitle: 'PUNJABI',
                            text: 'ਪੰ',
                          ),
                          buildHSpacer(10),
                          CustomLanguage(
                            title: 'ಕನ್ನಡ',
                            subtitle: 'KANNAD',
                            text: 'ಕ',
                          ),
                        ],
                      ),
                    ),
                    buildVSpacer(40),
                    isFromProfile == false
                        ? CustomButton_continue(
                            text: 'Continue',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                              );
                            },
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: CustomButton(
                              text: 'Back',
                              size: 18.px,
                              weight: FontWeight.w700,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                    buildVSpacer(60)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
