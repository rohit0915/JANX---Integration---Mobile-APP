// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jan_x/services/account_services.dart';
import 'package:jan_x/services/auth_services.dart';
import 'package:jan_x/services/buy_ad_service.dart';
import 'package:jan_x/services/kyc_service.dart';
import 'package:jan_x/services/mitra_service.dart';
import 'package:jan_x/services/post_buy_ad_service.dart';
import 'package:jan_x/services/post_sell_ad_service.dart';
import 'package:jan_x/services/profile_service.dart';
import 'package:jan_x/services/sale_ad_service.dart';
import 'package:jan_x/services/trade_settlement_service.dart';
import 'package:jan_x/services/wishkaro_service.dart';
import 'package:jan_x/splash/SplashScreen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put(AccountServices());
  Get.put(BuyAdService());
  Get.put(KycService());
  Get.put(PostSellAdService());
  Get.put(MitraService());
  Get.put(PostBuyAdService());
  Get.put(ProfileService());
  Get.put(SaleAdService());
  Get.put(TradeSettlementService());
  Get.put(WishkaroService());
  Get.put(AuthServices());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff444444),
          appBarTheme: AppBarTheme(backgroundColor: backgroundColor),
          // This is the theme of your application.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      );
    });
  }
}
