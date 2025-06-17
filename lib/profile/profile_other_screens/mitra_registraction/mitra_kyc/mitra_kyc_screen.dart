import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/profile/profile_other_screens/mitra_registraction/mitra_kyc/kyc_completed_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MitraKycScreen extends StatefulWidget {
  const MitraKycScreen({super.key});

  @override
  State<MitraKycScreen> createState() => _MitraKycScreenState();
}

class _MitraKycScreenState extends State<MitraKycScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MitraKycCompletedScreen(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18.sp,
            color: buttonColor,
          ),
        ),
        title: _buildText(
          title: "Mitra KYC",
          color: buttonColor,
          size: 18.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildVSpacer(2.h),
              Center(child: Image.asset('assets/kycscreen1.png')),
              buildVSpacer(2.h),
              _buildText(
                  title: "Complete your KYC ",
                  size: 16.px,
                  fontWeight: FontWeight.w600,
                  color: buttonColor),
              buildVSpacer(1.h),
              _buildText(
                  title: "Documents required for KYC ",
                  size: 13.px,
                  fontWeight: FontWeight.w600,
                  color: buttonColor),
              buildVSpacer(2.h),
              Container(
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: buttonColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/kycscreen2.png'),
                    Image.asset('assets/mitrakyc1.png'),
                    Image.asset('assets/mitrakyc2.png')
                  ],
                ),
              ),
              buildVSpacer(3.h),
              Container(
                padding: EdgeInsets.all(14.sp),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(14.sp),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) =>
                        //           const AadharCardDetailsScreen(),
                        //     ));
                      },
                      child: kycListTileMethod(
                          index: "1",
                          title: "Aadhaar Card Details",
                          title2: "Tap here to fill the details"),
                    ),
                    // buildVSpacer(2.h),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) =>
                        //           const PanCardDetailsScreen(),
                        //     ));
                      },
                      child: kycListTileMethod(
                          index: "2",
                          title: "PAN Card Details",
                          title2: "Tap here to fill the details"),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) =>
                        //           const BusinessDetailsScreen(),
                        //     ));
                      },
                      child: kycListTileMethod(
                          index: "3",
                          title: "Business Details",
                          title2: "Tap here to fill the details"),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const BankDetailsScreen(),
                        //     ));
                      },
                      child: kycListTileMethod(
                          index: "4",
                          title: "Bank Details",
                          title2: "Tap here to fill the details"),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const SamagraScreen(),
                        //     ));
                      },
                      child: kycListTileMethod(
                          index: "5",
                          title: "Samagra ID",
                          title2: "Tap here to fill the details"),
                    )
                  ],
                ),
              ),
              buildVSpacer(7.h)
            ],
          ),
        ),
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
      // textAlign: TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }

  ListTile kycListTileMethod(
      {required String index, required String title, required String title2}) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SizedBox(
          width: Adaptive.w(8),
          child: Image.asset('assets/kycTile$index.png', scale: 0.9)),
      title: _buildText(title: title, size: 14.px, fontWeight: FontWeight.bold),
      subtitle: _buildText(
        title: title2,
        size: 10.px,
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right_outlined,
        size: 20.sp,
      ),
    );
  }
}
