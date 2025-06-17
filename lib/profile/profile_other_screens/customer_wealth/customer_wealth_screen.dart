import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/customer_wealth/widgets/customer_widgets.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomerWealthScreen extends StatefulWidget {
  const CustomerWealthScreen({super.key});

  @override
  State<CustomerWealthScreen> createState() => _CustomerWealthScreenState();
}

class _CustomerWealthScreenState extends State<CustomerWealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: buttonColor, size: 18.sp)),
        title: _buildText(
            title: "Customer Wealth",
            color: white,
            size: 22.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(2), vertical: Adaptive.h(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              wealthMethod1(),
              buildVSpacer(2.h),
              wealthMethod2(),
              buildVSpacer(2.h),
              wealthMethod3(),
              buildVSpacer(5.h),
              CustomButton(
                text: "Save",
                onPressed: () {
                  showCustomDialogWealth(context);
                },
                color: buttonColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showCustomDialogWealth(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Set to true if you want to dismiss the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: white,
          contentPadding: const EdgeInsets.all(0), // Remove default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 16.0, right: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildVSpacer(5.h),
                    const Text(
                      "Congratulations , your data\nhas been\nsuccessfully saved",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    buildVSpacer(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: "Back",
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);

                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => SplashScreen2(),
                            //     ),
                            //     (route) => false);
                          },
                          color: buttonColor,
                          width: Adaptive.w(30),
                        ),
                      ],
                    ),
                    buildVSpacer(5.h)
                  ],
                ),
              ),
              Positioned(
                  top: -Adaptive.h(0.3.h),
                  right: -Adaptive.w(2),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: Adaptive.w(5),
                      backgroundColor: black,
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: white,
                        ),
                      ),
                    ),
                  )
                  // IconButton(
                  //   icon: Icon(Icons.close),
                  //   onPressed: () {
                  //     Navigator.of(context).pop(false); // Close dialog with No action
                  //   },
                  // ),
                  ),
            ],
          ),
        );
      },
    );
  }

  Column wealthMethod3() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomButton3(
            text: "Home Needs",
            onPressed: () {},
            height: Adaptive.h(5),
            width: Adaptive.w(42),
            color: buttonColor,
            size: 12.px,
          ),
        ),
        buildVSpacer(2.h),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: ReusableCheckboxRow(
                title: "1.Putty",
                value: false,
                onChanged: (value) {},
              ),
            ),
            Expanded(
              flex: 1,
              child: ReusableCheckboxRow(
                title: "2.Tiles",
                value: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: ReusableCheckboxRow(
                title: "3.White Wash",
                value: false,
                onChanged: (value) {},
              ),
            ),
            Expanded(
              flex: 1,
              child: ReusableCheckboxRow(
                title: "4.Water Tank",
                value: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: Adaptive.w(60),
            child: ReusableCheckboxRow(
              title: "5.Construction Materials",
              value: false,
              onChanged: (value) {},
              size: 14.px,
            ),
          ),
        ),
        buildVSpacer(2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton3(
              text: "Add More",
              onPressed: () {},
              width: Adaptive.w(35),
              height: 5.h,
              size: 14.px,
            )
          ],
        ),
        buildVSpacer(2.h),
        const Divider(
          thickness: 2,
          color: white,
        )
      ],
    );
  }

  Column wealthMethod2() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomButton3(
            text: "Transport",
            onPressed: () {},
            height: Adaptive.h(5),
            width: Adaptive.w(32),
            color: buttonColor,
            size: 12.px,
          ),
        ),
        buildVSpacer(2.h),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: ReusableCheckboxRow(
                title: "1.Bike (petrol)",
                value: false,
                onChanged: (value) {},
              ),
            ),
            Expanded(
              flex: 1,
              child: ReusableCheckboxRow(
                title: "2.Bike (EV)",
                value: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: ReusableCheckboxRow(
                title: "3.Car (Petrol)",
                value: false,
                onChanged: (value) {},
              ),
            ),
            Expanded(
              flex: 1,
              child: ReusableCheckboxRow(
                title: "4.EV- Bicycle",
                value: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: Adaptive.w(50),
            child: ReusableCheckboxRow(
              title: "5.Car (EV)",
              value: false,
              onChanged: (value) {},
            ),
          ),
        ),
        buildVSpacer(2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton3(
              text: "Add More",
              onPressed: () {},
              width: Adaptive.w(35),
              height: 5.h,
              size: 14.px,
            )
          ],
        ),
        buildVSpacer(2.h),
        const Divider(
          thickness: 2,
          color: white,
        )
      ],
    );
  }

  Column wealthMethod1() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomButton3(
            text: "Electronics",
            onPressed: () {},
            height: Adaptive.h(5),
            width: Adaptive.w(32),
            color: buttonColor,
            size: 12.px,
          ),
        ),
        buildVSpacer(2.h),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: ReusableCheckboxRow(
                title: "1.Tv",
                value: false,
                onChanged: (value) {},
              ),
            ),
            Expanded(
              flex: 1,
              child: ReusableCheckboxRow(
                title: "2.Fridge",
                value: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: ReusableCheckboxRow(
                title: "3.Mobile",
                value: false,
                onChanged: (value) {},
              ),
            ),
            Expanded(
              flex: 1,
              child: ReusableCheckboxRow(
                title: "4.Fan",
                value: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: Adaptive.w(50),
            child: ReusableCheckboxRow(
              title: "5.Washing Machine",
              value: false,
              onChanged: (value) {},
            ),
          ),
        ),
        buildVSpacer(2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton3(
              text: "Add More",
              onPressed: () {},
              width: Adaptive.w(35),
              height: 5.h,
              size: 14.px,
            )
          ],
        ),
        buildVSpacer(3.h),
        const Divider(
          thickness: 2,
          color: white,
        )
      ],
    );
  }

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Text(
      title,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
