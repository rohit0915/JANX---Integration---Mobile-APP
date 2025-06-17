import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/post_buy_ads/post_by_ad_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/wish_karo_screen/new_wish_karo_screen.dart';
import 'package:jan_x/wish_karo_screen/widgets/wish_karo_my_orders_screen.dart';
import 'package:jan_x/wish_karo_screen/widgets/wish_karo_my_orders_taped_screen.dart';
import 'package:jan_x/wish_karo_screen/widgets/wish_karo_order_ready_screen.dart';
import 'package:jan_x/wish_karo_screen/widgets/wish_karo_submitted.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WishKaroScreen extends StatefulWidget {
  WishKaroScreen({super.key, this.selectedTab = SelectedTab.defaults});
  SelectedTab selectedTab = SelectedTab.defaults;

  @override
  State<WishKaroScreen> createState() => _WishKaroScreenState();
}

class _WishKaroScreenState extends State<WishKaroScreen> {
  @override
  bool isMyorderClicked = false;
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: widget.selectedTab != SelectedTab.defaults
          ? AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: buttonColor,
                    size: 18.sp,
                  )),
              title: _buildText(
                  title: "My Wish",
                  fontWeight: FontWeight.w700,
                  size: 24.px,
                  color: buttonColor),
              centerTitle: true,
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              buildVSpacer(3.h),
              Flex(
                direction: Axis.horizontal,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: _buildTab(
                          SelectedTab.newSale, "Submitted", "Seller")),
                  buildHSpacer(5.w),
                  Expanded(
                      flex: 1,
                      child: _buildTab(
                          SelectedTab.myAds, "Order Ready", "My AD's")),
                  buildHSpacer(5.w),
                  Expanded(
                      flex: 1,
                      child: _buildTab(
                          SelectedTab.completed, "My Orders", "Completed")),
                ],
              ),
              buildVSpacer(3.h),
              // defaultMethodInWishKaro(),
              Expanded(
                child: SingleChildScrollView(child: _selectedTabContent()),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: widget.selectedTab == SelectedTab.defaults
          ? Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 12.sp, vertical: Adaptive.h(2)),
              decoration: const BoxDecoration(color: buttonColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/bottom1.png'),
                  Image.asset('assets/bottom2.png'),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewWishKaroScreen(),
                            ));
                      },
                      child: Image.asset('assets/bottom3.png')),
                  Image.asset('assets/bottom4.png')
                ],
              ),
            )
          : const SizedBox(),
    );
  }

  Widget _myOrders() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isMyorderClicked == false
                ? Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            log("isCliked by developer");
                            setState(() {
                              isMyorderClicked = !isMyorderClicked;
                            });
                          },
                          child: const WishKaroOrdersScreen()),
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
                              title: "Time Remaining :",
                              size: 12.px,
                              color: white)),
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
                      buildVSpacer(12.h),
                    ],
                  )
                : const WishKaroTapedMyOrdersScreen(),
          ],
        ),
      ),
    );
  }

  Widget _selectedTabContent() {
    switch (widget.selectedTab) {
      case SelectedTab.newSale:
        return const WishKaroSubmitedScreen();
      case SelectedTab.myAds:
        return const WishKaroOrderReadyScreen();
      case SelectedTab.completed:
        return _myOrders();
      default:
        return defaultMethodInWishKaro();
    }
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
            GestureDetector(
              onTap: () {
                // Show the dialog when tapped
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Image.asset('assets/settings.png'),
            ),
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
            color: white,
          ),
        )
      ],
    );
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

  Widget _buildTab(SelectedTab tab, String title, String headerText) {
    bool isSelected = widget.selectedTab == tab;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selectedTab = tab;
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
              size: 10.px),
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
