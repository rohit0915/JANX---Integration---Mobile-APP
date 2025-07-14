// ignore_for_file: prefer_const_constructors, unused_element, must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/post_buy_ads/tap_on_post_buy/widgets/completed_screen_widget.dart';
import 'package:jan_x/post_buy_ads/tap_on_post_buy/widgets/my_add_post_buy_widget.dart';
import 'package:jan_x/post_buy_ads/widgets/new_sale_widget.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jan_x/services/post_buy_ad_service.dart';
import 'package:jan_x/model/buy_ad_models.dart';

class PostBuyAdScreen extends StatefulWidget {
  PostBuyAdScreen({super.key, this.selectedTab = SelectedTab.newSale});

  SelectedTab selectedTab;
  @override
  State<PostBuyAdScreen> createState() => _PostBuyAdScreenState();
}

class _PostBuyAdScreenState extends State<PostBuyAdScreen> {
  String? selectedCrop;
  List<String> cropTypes = ['Wheat', 'Paddy', 'Moong'];
  String headerTitle = "Buyer";

  void _handleDropdownChange(String? newValue) {
    setState(() {
      selectedCrop = newValue;
    });
  }

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff444444),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildVSpacer(30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xffF4BC1C),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: _buildTextHeader(
                        title: headerTitle, color: Colors.white, size: 18))
              ],
            ),
            buildVSpacer(30),
            Flex(
              direction: Axis.horizontal,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child:
                        _buildTab(SelectedTab.newSale, "Buy Request", "Buyer")),
                buildHSpacer(5.w),
                Expanded(
                    flex: 1,
                    child: _buildTab(SelectedTab.myAds, "My Ad's", "My AD's")),
                buildHSpacer(5.w),
                Expanded(
                    flex: 1,
                    child: _buildTab(
                        SelectedTab.completed, "Completed", "Completed")),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(child: _selectedTabContent()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(SelectedTab tab, String title, String headerText) {
    bool isSelected = widget.selectedTab == tab;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selectedTab = tab;
          headerTitle = headerText;
        });
      },
      child: Container(
        // width: Adaptive.w(36),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF4BC1C) : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: _buildTextHeader(
              title: title,
              color: isSelected ? Colors.black : Colors.grey,
              size: 10.px),
        ),
      ),
    );
  }

  Widget _selectedTabContent() {
    switch (widget.selectedTab) {
      case SelectedTab.newSale:
        // return _newSaleContent();
        return NewSaleRequestWidget();
      case SelectedTab.myAds:
        return _myAdsContent(context);
      case SelectedTab.completed:
        return CompletedContentPostBuy();
      default:
        return NewSaleRequestWidget();
    }
  }

  bool isOtherServiceClicked = false;
  bool isClickedRequest = false;

  Flex paymentWidgetMethod({required String titile}) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
            flex: 1,
            child: Text(
              '$titile',
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w500, fontSize: 12.px),
            )),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: Adaptive.h(5),
            width: Adaptive.w(30),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
        ),
        SizedBox(
          width: Adaptive.w(10),
        )
      ],
    );
  }

  Widget buildCustomTextFieldWithDropdown() {
    return Container(
      height: 6.h,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color(0xffF4BC1C),
            width: 2.0), // Yellow border around the container
        borderRadius: BorderRadius.circular(5.0), // Rounded corners
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCrop,
          isExpanded: true, // Makes the dropdown expand to fill the container
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black), // Text color
          onChanged: _handleDropdownChange,
          items: cropTypes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          dropdownColor: const Color(0xffF4BC1C),
        ),
      ),
    );
  }
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

Widget _buildText(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style: TextStyle(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontFamily: 'Poppins',
          color: color ?? Colors.black),
    ),
  );
}

enum SelectedTab { newSale, myAds, completed, defaults }

Widget _myAdsContent(BuildContext context) {
  final PostBuyAdService postBuyAdService = Get.find<PostBuyAdService>();
  final box = GetStorage();
  // Fetch ads on first build
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final token = box.read('token');
    if (token != null) postBuyAdService.getMyBuyAds(token);
  });
  return Obx(() {
    if (postBuyAdService.isLoading.value) {
      return Center(child: CircularProgressIndicator());
    }
    if (postBuyAdService.error.value.isNotEmpty) {
      return Center(child: Text('Error: ' + postBuyAdService.error.value));
    }
    if (postBuyAdService.buyAds.isEmpty) {
      return Center(child: Text('No ads found.'));
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: postBuyAdService.buyAds.length,
      itemBuilder: (context, index) {
        final ad = postBuyAdService.buyAds[index];
        return ListTile(
          title: Text(ad.variety ?? 'No Title'),
          subtitle: Text(
            'Variety: ${ad.variety}\n'
            'Quantity: ${ad.quantity}\n'
            'Location: ${ad.location}',
          ),
        );
      },
    );
  });
}

class CompletedContentPostBuy extends StatefulWidget {
  @override
  _CompletedContentPostBuyState createState() =>
      _CompletedContentPostBuyState();
}

class _CompletedContentPostBuyState extends State<CompletedContentPostBuy> {
  final PostBuyAdService postBuyAdService = Get.find<PostBuyAdService>();
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final token = box.read('token');
      if (token != null) postBuyAdService.getMyCompletedBuyAds(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (postBuyAdService.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (postBuyAdService.error.value.isNotEmpty) {
        return Center(child: Text('Error: ' + postBuyAdService.error.value));
      }
      if (postBuyAdService.completedBuyAds.isEmpty) {
        return Center(child: Text('No completed ads found.'));
      }
      return ListView.builder(
        shrinkWrap: true,
        itemCount: postBuyAdService.completedBuyAds.length,
        itemBuilder: (context, index) {
          final ad = postBuyAdService.completedBuyAds[index];
          return ListTile(
            title: Text(ad.variety ?? 'No Title'),
            subtitle: Text(
              'Variety: ${ad.variety}\n'
              'Quantity: ${ad.quantity}\n'
              'Location: ${ad.location}',
            ),
          );
        },
      );
    });
  }
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
