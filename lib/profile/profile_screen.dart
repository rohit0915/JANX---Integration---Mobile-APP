import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/about_janx/about_janx_screen.dart';
import 'package:jan_x/about_janx/privacy_and_policy_screen.dart';
import 'package:jan_x/about_janx/terms_and_condition_screen.dart';
import 'package:jan_x/language_selection/LanguageScreen.dart';
import 'package:jan_x/notification/notifications.dart';
import 'package:jan_x/profile/profile_other_screens/customer_wealth/customer_wealth_screen.dart';
import 'package:jan_x/profile/profile_other_screens/kyc/kyc_screen.dart';
import 'package:jan_x/profile/profile_other_screens/mitra_details/mitra_details_screen.dart';
import 'package:jan_x/profile/profile_other_screens/mitra_registraction/mitrra_registraction_screen.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_screen.dart';
import 'package:jan_x/profile/profile_other_screens/my_orders/my_orders_screen.dart';
import 'package:jan_x/profile/profile_other_screens/payment_history/payment_history_screen.dart';
import 'package:jan_x/profile/profile_other_screens/wish_list/wish_list_screen.dart';
import 'package:jan_x/splash/SplashScreen_2.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/wallet/wallet_screen.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jan_x/services/kyc_service.dart';
import 'dart:convert';
import 'package:jan_x/services/mitra_service.dart';
import 'package:jan_x/profile/profile_other_screens/mitra_details/mitra_profile/mitra_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoadingMitra = true;

  @override
  void initState() {
    super.initState();
    _checkMitraStatus();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkMitraStatus();
  }

  Future<void> _checkMitraStatus() async {
    setState(() {
      isLoadingMitra = true;
    });
    final kycService = Get.find<KycService>();
    // Simulate async if needed, or remove await if not needed
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      isLoadingMitra = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingMitra) {
      return Center(child: CircularProgressIndicator());
    }
    final kycService = Get.find<KycService>();
    final isMitraRegistered = kycService.isMitraRegistered;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14.sp),
                    bottomRight: Radius.circular(14.sp),
                  )),
              child: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: black,
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color: white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildVSpacer(6.h),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MitraProfileScreen(),
                                      ));
                                },
                                child: Center(
                                    child: _buildText(
                                  title: "Sidhu Singh",
                                  size: 18.px,
                                  fontWeight: FontWeight.w400,
                                )),
                              ),
                              buildVSpacer(2.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/Group 565.png"),
                                  buildHSpacer(3.w),
                                  _buildText(
                                      title: "Gurgaon, Haryana", size: 11.px),
                                ],
                              ),
                              buildVSpacer(1.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/profile2.png'),
                                  buildHSpacer(2.w),
                                  _buildText(
                                    title: "8826688426",
                                    size: 11.px,
                                  ),
                                  buildHSpacer(8.w),
                                  Image.asset('assets/profile3.png'),
                                  buildHSpacer(2.w),
                                  _buildText(
                                    title: "SK enterprises",
                                    size: 11.px,
                                  )
                                ],
                              ),
                              buildVSpacer(1.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/profile4.png'),
                                  buildHSpacer(2.w),
                                  _buildText(
                                    title: "amitcreative2007@gmail.com",
                                    size: 11.px,
                                  )
                                ],
                              ),
                              buildVSpacer(2.h),
                              InkWell(
                                onTap: () {
                                  showFormDialog(context);
                                },
                                child: Container(
                                  height: Adaptive.h(6),
                                  padding: EdgeInsets.all(12.sp),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(14.sp),
                                      color: const Color(0xff424242)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/profile5.png'),
                                      buildHSpacer(2.w),
                                      _buildText(
                                          title: "Edit Profile",
                                          size: 11.px,
                                          fontWeight: FontWeight.w700,
                                          color: buttonColor)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                        left: Adaptive.w(35),
                        top: Adaptive.h(2),
                        child: CircleAvatar(
                          radius: Adaptive.w(12.2),
                          backgroundColor: black,
                          child: CircleAvatar(
                            radius: Adaptive.w(12),
                            backgroundColor: white,
                            child: Center(
                              child: Image.asset('assets/profile1.png'),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            buildVSpacer(4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
              child: Container(
                width: Adaptive.w(100),
                padding: EdgeInsets.all(22.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: white,
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Orders',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.px,
                              color: const Color(0xff999999)),
                        )),
                    buildVSpacer(4.h),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MyOrdersScreen(),
                                  ));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Adaptive.w(6),
                                  vertical: Adaptive.h(3)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  color: const Color(0xff424242)),
                              child: Center(
                                child: Image.asset('assets/profilescr1.png'),
                              ),
                            ),
                          ),
                        ),
                        buildHSpacer(5.w),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WishListScreen(),
                                  ));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Adaptive.w(6),
                                  vertical: Adaptive.h(3)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  color: const Color(0xff424242)),
                              child: Center(
                                child: Image.asset('assets/profilescr2.png'),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            buildVSpacer(4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
              child: Container(
                padding: EdgeInsets.all(13.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp), color: white),
                child: Column(
                  children: [
                    buildVSpacer(3.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          title: "Your options",
                          color: const Color(0xff999999),
                          size: 12.px),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KycScreen(),
                            ));
                      },
                      child: listTileMethod(
                          index: "0",
                          title: "KYC",
                          subTitle: "Complete your KYC"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CustomerWealthScreen(),
                            ));
                      },
                      child: listTileMethod(
                          index: "1",
                          title: "Customer Wealth",
                          subTitle: "Future Dreams"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WalletScreen(),
                            ));
                      },
                      child: listTileMethod(
                          index: "2",
                          title: "Jan-X  Wallet",
                          subTitle: "Add Funds"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentHistoryScreen(),
                            ));
                      },
                      child: listTileMethod(
                          index: "3",
                          title: "Payment History",
                          subTitle: "See your paymeny history"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                LanguageScreen(isFromProfile: true),
                          ),
                        );
                      },
                      child: listTileMethod(
                          index: "5",
                          title: "Language",
                          subTitle: "Select your language"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationScreen(),
                            ));
                      },
                      child: listTileMethod(
                          index: "6",
                          title: "Notifications",
                          subTitle: "Stay updated"),
                    )
                  ],
                ),
              ),
            ),
            buildVSpacer(4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
              child: Container(
                padding: EdgeInsets.all(13.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp), color: white),
                child: Column(
                  children: [
                    buildVSpacer(3.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          title: "MiTRA MANAGEMENT",
                          color: const Color(0xff999999),
                          size: 12.px),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const MitraREgistractionScreen(),
                          ),
                        );
                      },
                      child: listTileMethod(
                          index: "10",
                          title: "Mitra Registration",
                          subTitle: "Complete your KYC"),
                    ),
                    AbsorbPointer(
                      absorbing: !isMitraRegistered,
                      child: Opacity(
                        opacity: isMitraRegistered ? 1.0 : 0.4,
                        child: InkWell(
                          onTap: isMitraRegistered
                              ? () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MitraProfileDetailsScreen(),
                                    ),
                                  );
                                  _checkMitraStatus();
                                }
                              : null,
                          child: listTileMethod(
                              index: "11",
                              title: "Mitra Profile",
                              subTitle: "View mitra"),
                        ),
                      ),
                    ),
                    listTileMethod(
                        index: "12",
                        title: "Mitra Access",
                        subTitle: "Support"),
                  ],
                ),
              ),
            ),
            buildVSpacer(4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
              child: Container(
                padding: EdgeInsets.all(13.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp), color: white),
                child: Column(
                  children: [
                    buildVSpacer(3.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          title: "About JaN-X",
                          color: const Color(0xff999999),
                          size: 12.px),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutJanxScreen(),
                            ));
                      },
                      child: listTileMethod2(
                        index: "13",
                        title: "About Jan-X App ",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PrivacyPolicyScreen(),
                            ));
                      },
                      child: listTileMethod2(
                        index: "7",
                        title: "Privacy Policy",
                        // subTitle: "View mitra"
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TermsAndConditionScreen(),
                            ));
                      },
                      child: listTileMethod2(
                        index: "8",
                        title: "Terms & Conditions",
                        // subTitle: "Support"
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showCustomDialogProfile(context);
                      },
                      child: listTileMethod2(
                        index: "9",
                        title: "Logout",
                        // subTitle: "Support"
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildVSpacer(3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_buildText(title: "App Version 2.1.0", color: white)],
            ),
            buildVSpacer(3.h),
          ],
        ),
      ),
    );
  }

  ListTile listTileMethod2({
    required String index,
    required String title,
    String subTitle = '',
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.all(2),
      leading: SizedBox(
          width: Adaptive.w(12),
          child: Image.asset('assets/profiletile$index.png')),
      title:
          _buildText(title: title, size: 14.px, color: const Color(0xff444444)),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: const Color(
          0xff444444,
        ),
        size: Adaptive.w(4),
      ),
    );
  }

  void showFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: white,
          surfaceTintColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(16.sp),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildVSpacer(3.h),
                      _buildText(
                          title: "Edit Profile",
                          color: buttonColor,
                          size: 16.px,
                          fontWeight: FontWeight.w700),
                      buildVSpacer(2.h),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: textFieldMethod(
                                  title1: "First Name", hintText: "Sidhu")),
                          buildHSpacer(8.w),
                          Expanded(
                            flex: 1,
                            child: textFieldMethod(
                                title1: "Second Name", hintText: "Gowda"),
                          )
                        ],
                      ),
                      buildVSpacer(4.h),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: textFieldMethod(
                                  title1: "Mobile", hintText: "+91 888990022")),
                          buildHSpacer(8.w),
                          Expanded(
                            flex: 1,
                            child: textFieldMethod(
                                title1: "Email", hintText: "Sidhu@gmail.com"),
                          )
                        ],
                      ),
                      buildVSpacer(4.h),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: textFieldMethod(
                                  title1: "Address",
                                  hintText: "Bangalore........")),
                          buildHSpacer(8.w),
                          Expanded(
                            flex: 1,
                            child: textFieldMethod(
                                title1: "Pincode", hintText: "57001"),
                          )
                        ],
                      ),
                      buildVSpacer(4.h),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: textFieldMethod(
                                  title1: "UPI ID", hintText: "Sidhu@paytm")),
                          buildHSpacer(8.w),
                          Expanded(
                            flex: 1,
                            child: textFieldMethod(
                                title1: "Other Detail",
                                hintText: "Bangalore........"),
                          )
                        ],
                      ),
                      buildVSpacer(6.h),
                      CustomButton(
                        text: "Deactive",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        width: Adaptive.w(40),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 5,
                  right: Adaptive.w(2),
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

  Column textFieldMethod({required String title1, required String hintText}) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: _buildText(title: title1, size: 11.px, color: black)),
        SizedBox(
          height: Adaptive.h(6),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GoogleFonts.lato(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.px,
                    color: Colors.black38),
                suffixIcon: Image.asset(
                  'assets/mitra_registraction.png',
                  color: black,
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: backgroundColor)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: backgroundColor)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: backgroundColor))),
          ),
        )
      ],
    );
  }

  Future<void> showCustomDialogProfile(BuildContext context) async {
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
                      "Are You Sure You Want To Logout?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    buildVSpacer(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          text: "Yes",
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SplashScreen2(),
                                ),
                                (route) => false);
                          },
                          color: buttonColor,
                          width: Adaptive.w(30),
                        ),
                        buildHSpacer(8.w),
                        CustomButton(
                          text: "No",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: buttonColor,
                          width: Adaptive.w(30),
                        )
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

  ListTile listTileMethod({
    required String index,
    required String title,
    String subTitle = '',
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.all(2),
      leading: Image.asset('assets/profiletile$index.png'),
      title:
          _buildText(title: title, size: 14.px, color: const Color(0xff444444)),
      subtitle: subTitle.isNotEmpty
          ? _buildText(
              title: subTitle,
              color: const Color(0xff444444),
              size: 10.px,
            )
          : const SizedBox(),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: const Color(
          0xff444444,
        ),
        size: Adaptive.w(4),
      ),
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
          fontSize: size ?? 14.px,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
