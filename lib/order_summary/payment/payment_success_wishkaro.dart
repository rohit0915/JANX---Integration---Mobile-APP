import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_detils/product_order_details_screen.dart';
import 'package:jan_x/order_summary/buyer_contact_Details_Screen.dart';
import 'package:jan_x/order_summary/payment/order_success_message_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:jan_x/wish_karo_screen/wish_karo_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class paymentSuccessScreenWishkaro extends StatefulWidget {
  const paymentSuccessScreenWishkaro({super.key,});
  // final bool isFromCart;
  @override
  State<paymentSuccessScreenWishkaro> createState() => _paymentSuccessScreenWishkaroState();
}

class _paymentSuccessScreenWishkaroState extends State<paymentSuccessScreenWishkaro> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  intFunction() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OrderSuccessMessageScreen(),
        ));
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
          title: "Payment",
          color: white,
          size: 22.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildVSpacer(10.h),
          Center(
            child: SizedBox(
                width: 278.px,
                height: 278.px,
                child: Lottie.asset("assets/Animation - 1723812954253.json")),
          ),
       Text(
                  "Payment has Succesfully\nCompleted\nWishOD-ID : 12390",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w900,
                      fontSize: 20.px,
                      color: white),
                ),
          buildVSpacer(5.h),
         
               Column(
                  children: [
                   
                    buildVSpacer(3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
                      child: CustomButton(
                        text: "Back",
                        onPressed: () {
                          // Navigator.pop(context);
                          Navigator.pop(context);
                          
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WishKaroScreen(),));
                        },
                        size: 16.px,
                        weight: FontWeight.w700,
                      ),
                    )
                  ],
                )
            
        ],
      ),
    );
  }

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? align}) {
    return Text(
      title,
      textAlign: align ?? TextAlign.start,
      style: GoogleFonts.poppins(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
