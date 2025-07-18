// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_detils/product_order_details_screen.dart';
import 'package:jan_x/post_sell_ad/post_sell_ad_screen.dart';
import 'package:jan_x/profile/profile_other_screens/wish_list/wish_list_screen.dart';
import 'package:jan_x/sale_ads/category_screen/category_screen.dart';
import 'package:jan_x/sale_ads/queue_orders_detalails/queue_orders_details_screen.dart';
import 'package:jan_x/sale_ads/widgets/sale_my_orders_screen.dart';
import 'package:jan_x/trade_setllement/trade_bill_statement_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:jan_x/wish_karo_screen/new_wish_karo_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:jan_x/services/sale_ad_service.dart';
import 'package:jan_x/model/sell_ad_models.dart';
import 'package:intl/intl.dart';

class SaleAddScreen extends StatefulWidget {
  SaleAddScreen({super.key});

  @override
  State<SaleAddScreen> createState() => _SaleAddScreenState();
}

class _SaleAddScreenState extends State<SaleAddScreen> {
  @override
  SelectedTab selectedTab = SelectedTab.newSale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                buildVSpacer(3.h),
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: _buildTab(
                            SelectedTab.newSale, "Seller Ad’s", "Seller")),
                    buildHSpacer(5.w),
                    Expanded(
                        flex: 1,
                        child: _buildTab(
                            SelectedTab.myAds, "Queue Orders", "My AD's")),
                    buildHSpacer(5.w),
                    Expanded(
                        flex: 1,
                        child: _buildTab(
                            SelectedTab.completed, "My Orders", "Completed")),
                  ],
                ),
                buildVSpacer(3.h),
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
                    GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Align(
                                alignment: Alignment.topRight,
                                child: Transform.translate(
                                  offset: Offset(20.0, -14.h), //
                                  child: SizedBox(
                                    width: Adaptive.w(80),
                                    child: AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          // borderRadius: BorderRadius.circular(12.sp),
                                          ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          filterMethod('Customer Id'),
                                          filterMethod('Variety'),
                                          filterMethod('Quantity'),
                                          filterMethod('Location'),
                                          filterMethod('Seller Name'),
                                          filterMethod('Mitra Id'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset('assets/settings.png')),
                    buildHSpacer(3.w),
                  ],
                ),
                buildVSpacer(2.h),
                _selectedTabContent(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: selectedTab == SelectedTab.newSale
          ? Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 12.sp, vertical: Adaptive.h(2)),
              decoration: const BoxDecoration(color: buttonColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/bottom1.png'),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(),
                            ));
                      },
                      child: Image.asset('assets/bottom2.png')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostSellAdScreen(),
                            ));
                      },
                      child: Image.asset('assets/bottosell1.png')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WishListScreen(),
                            ));
                      },
                      child: Image.asset('assets/bottosell2.png')),
                  Image.asset('assets/bottom4.png')
                ],
              ),
            )
          : const SizedBox(),
    );
  }

  Widget _selectedTabContent() {
    switch (selectedTab) {
      case SelectedTab.newSale:
        return SingleChildScrollView(child: sellerAddMethod());
      case SelectedTab.myAds:
        return orderRedayMethod();
      case SelectedTab.completed:
        return _myOrders();
      default:
        return sellerAddMethod();
    }
  }

  Column filterMethod(String titile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            titile,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 18.px,
              color: Colors.black,
            ),
          ),
        ),
        const Divider(
          color: Colors.grey, // Divider color
          thickness: 1, // Thickness of the divider
        ),
      ],
    );
  }

  Widget _myOrders() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TradeBillStatementScreen(),
                    ));
              },
              child: const SaleMyOrder(isOrderReady: false)),
          buildVSpacer(3.h),
          buildVSpacer(12.h),
        ],
      ),
    );
  }

  Widget orderRedayMethod() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const QueueOrdersDetailsScreen(),
                  ),
                );
              },
              child: const SaleMyOrder(isOrderReady: true)),
          buildVSpacer(3.h),
          Image.asset('assets/wishkaroorders.png'),
          buildVSpacer(2.h),

          _buildText(
              title: "Note : Not able to cancel order after 24 hrs",
              size: 16.px,
              color: white),
          buildVSpacer(3.h),
          Center(
              child: _buildText(
                  title: "Time Remaining :", size: 12.px, color: white)),
          // buildVSpacer(1.h),
          Center(
              child: _buildText(
            title: "23:42 hrs",
            size: 24.px,
            fontWeight: FontWeight.w700,
            color: white,
          )),
          buildVSpacer(7.h),
          _buildText(
              title: "NO MORE ORDERS",
              size: 14.px,
              fontWeight: FontWeight.w700,
              color: white),
          buildVSpacer(3.h),
          CustomButton(
            text: "Back",
            onPressed: () {
              Navigator.pop(context);
            },
            width: Adaptive.w(30),
            color: buttonColor,
            size: 12.px,
          ),
          buildVSpacer(3.h),
          buildVSpacer(12.h),
        ],
      ),
    );
  }

  sellerAddMethod() {
    final SaleAdService saleAdService = Get.find<SaleAdService>();
    // Fetch sale ads on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      saleAdService.getSalesAds();
    });
    return Obx(() {
      if (saleAdService.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (saleAdService.error.value.isNotEmpty) {
        return Center(child: Text('Error: ' + saleAdService.error.value));
      }
      if (saleAdService.saleAds.isEmpty) {
        return Center(child: Text('No sale ads found.'));
      }
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: saleAdService.saleAds.length,
        itemBuilder: (context, index) {
          final ad = saleAdService.saleAds[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue, // Brown color
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.white, size: 18),
                          SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sell ID : ${ad.buyId ?? '-'}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'Posted Date : ${_formatPostedDate(ad.createdAt)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
                                title:
                                    "Description : ${"ad.description" ?? 'No description'}",
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
          );
        },
      );
    });
  }

  Column defaultMethodInWishKaro() {
    return Column(
      children: [
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
                title: "My Wish",
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
        buildVSpacer(16.h),
        Text(
          'No data\nPlease add New Wish',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 26.px,
            // decoration: TextDecoration.underline,
            color: white,
            // decorationColor: white
          ),
        )
      ],
    );
  }

  // Widget _myOrders() {
  //   return Center(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         const WishKaroOrdersScreen(),
  //         buildVSpacer(3.h),
  //         Image.asset('assets/wishkaroorders.png'),
  //         buildVSpacer(2.h),

  //         _buildText(
  //             title: "Note : Not able to cancel order after 24 hrs",
  //             size: 16.px,
  //             color: white),
  //         buildVSpacer(3.h),
  //         Center(
  //             child: _buildText(
  //                 title: "Time Remaining :", size: 12.px, color: white)),
  //         // buildVSpacer(1.h),
  //         Center(
  //             child: _buildText(
  //           title: "23:42 hrs",
  //           size: 24.px,
  //           fontWeight: FontWeight.w700,
  //           color: white,
  //         )),
  //         buildVSpacer(7.h),
  //         _buildText(
  //             title: "NO MORE ORDERS",
  //             size: 14.px,
  //             fontWeight: FontWeight.w700,
  //             color: white),
  //         buildVSpacer(12.h),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Align(
      // alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: GoogleFonts.lato(
            fontSize: size ?? 14,
            fontWeight: fontWeight ?? FontWeight.w400,
            // fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    );
  }

  Widget _buildText1(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Align(
      // alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: GoogleFonts.lato(
            fontSize: size ?? 14,
            fontWeight: fontWeight ?? FontWeight.w400,
            // fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    );
  }

  String _formatPostedDate(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('dd-MMMM-yy').format(date); // e.g., 05-April-24
  }

  Widget _buildTab(SelectedTab tab, String title, String headerText) {
    bool isSelected = selectedTab == tab;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = tab;
          // headerTitle = headerText;
        });
      },
      child: Container(
        // width: Adaptive.w(36),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF4BC1C) : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _buildTextHeader(
              title: title,
              color: isSelected ? Colors.black : Colors.grey,
              size: 9.px),
        ),
      ),
    );
  }

  Widget _buildTextHeader(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: size ?? 14,
              fontWeight: fontWeight ?? FontWeight.w500,
              fontFamily: 'Poppins',
              color: color ?? Colors.black),
        ),
      ),
    );
  }
}

enum SelectedTab {
  newSale,
  myAds,
  completed,
}
