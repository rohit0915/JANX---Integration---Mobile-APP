import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/buy_add/buy_add_details/buy_add_details_screen.dart';
import 'package:jan_x/buy_add/buy_add_details/buyer_wishlist/buyer_wishlist_screen.dart';
import 'package:jan_x/post_buy_ads/post_by_ad_screen.dart';
import 'package:jan_x/sale_ads/category_screen/category_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:jan_x/services/sale_ad_service.dart';
import 'package:jan_x/model/sell_ad_models.dart';
import 'package:intl/intl.dart';

class HomeBuyerAddScreen extends StatelessWidget {
  const HomeBuyerAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SaleAdService saleAdService = Get.find<SaleAdService>();
    // Fetch sale ads on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      saleAdService.getSalesAds();
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildVSpacer(2.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          color: buttonColor,
                        ),
                        child: Row(
                          children: [
                            _buildText(
                              title: "Search....",
                              size: 14.px,
                              fontWeight: FontWeight.w400,
                            ),
                            const Spacer(),
                            const Icon(Icons.search)
                          ],
                        ),
                      ),
                    ),
                    buildHSpacer(3.w),
                    Image.asset('assets/settings.png'),
                    buildHSpacer(3.w),
                  ],
                ),
                buildVSpacer(3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildText(
                        title: "Buyer Ad’s",
                        size: 14.px,
                        fontWeight: FontWeight.w700,
                        color: white),
                    Text(
                      'See All',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.px,
                          decoration: TextDecoration.underline,
                          color: white,
                          decorationColor: white),
                    )
                  ],
                ),
                buildVSpacer(3.h),
                Obx(() {
                  if (saleAdService.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (saleAdService.error.value.isNotEmpty) {
                    return Center(
                        child: Text('Error: ' + saleAdService.error.value));
                  }
                  if (saleAdService.saleAds.isEmpty) {
                    return Center(child: Text('No ads found.'));
                  }
                  return Column(
                    children: saleAdService.saleAds
                        .map((ad) => buyAddMethod(context, ad))
                        .toList(),
                  );
                }),
                buildVSpacer(3.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 12.sp, vertical: Adaptive.h(2)),
        decoration: const BoxDecoration(color: buttonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Image.asset('assets/bottom1.png')),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoryScreen(),
                      ));
                },
                child: Image.asset('assets/bottom2.png')),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostBuyAdScreen(),
                      ));
                },
                child: Image.asset('assets/bottombuy.png')),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyerWishListScreen(),
                      ));
                },
                child: Image.asset('assets/bottosell2.png')),
            // Image.asset('assets/bottom4.png')
          ],
        ),
      ),
    );
  }

  Padding buyAddMethod(BuildContext context, SellAdResponse ad) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ByAddDetailsScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: Adaptive.w(30),
                        height: Adaptive.h(5),
                        decoration: BoxDecoration(
                            color: const Color(0xffF4BC1C),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(14.sp),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star),
                            Text(
                              'Verified',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600, fontSize: 10.px),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  buildVSpacer(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/pro.png"),
                            buildHSpacer(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _buildText1(title: 'Rice', size: 18),
                                _buildText1(
                                    title: 'Variety :  Wheat G1', size: 11),
                                _buildText1(
                                    title:
                                        "Location : ${ad.location.join(', ')}",
                                    size: 11),
                              ],
                            ),
                            const Spacer(),
                            CircleAvatar(
                              radius: Adaptive.w(5),
                              backgroundColor: const Color(0xffD9D9D9),
                              child: const Center(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        buildVSpacer(10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              _buildText1(title: "Quantity (approx.)"),
                              const Spacer(),
                              _buildText1(
                                  title:
                                      "${ad.approxQuantity ?? ''} ${ad.quantityType ?? ''}"),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF4BC1C),
                          ),
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              _buildText1(title: "Min-Price (approx.)"),
                              const Spacer(),
                              _buildText1(
                                  title: "₹ ${ad.minPriceApprox ?? ''}"),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF4BC1C),
                          ),
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              _buildText1(title: "Total Cost (approx.)"),
                              const Spacer(),
                              _buildText1(
                                  title: "₹ ${ad.totalCostApprox ?? ''}"),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffF4BC1C),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildText(
                                title: "Description : No description",
                                size: 11.px),
                          ),
                        ),
                        buildVSpacer(20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -18,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xffA76012),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.black26),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/check.png",
                    scale: 0.8,
                  ),
                  buildHSpacer(5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Buy ID : ${ad.buyId ?? '-'}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Posted Date : " +
                            (ad.createdAt != null
                                ? DateFormat('dd-MMMM-yy').format(ad.createdAt!)
                                : '-'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText1(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
              fontSize: size ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
              fontFamily: 'Poppins',
              color: color ?? Colors.black),
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
      style: GoogleFonts.lato(
          fontSize: size ?? 14.px,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}
