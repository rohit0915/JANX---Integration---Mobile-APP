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
import 'package:jan_x/services/post_sell_ad_service.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'package:jan_x/home_screen/home_screen.dart';

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
          isExpanded: true,
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
  final PostSellAdService postSellAdService = Get.find<PostSellAdService>();
  // Fetch sell ads on widget build
  WidgetsBinding.instance.addPostFrameCallback((_) {
    postSellAdService.getMyAds();
  });
  return Obx(() {
    if (postSellAdService.isLoading.value) {
      return Center(child: CircularProgressIndicator());
    }
    if (postSellAdService.error.value.isNotEmpty) {
      return Center(child: Text('Error: ' + postSellAdService.error.value));
    }
    if (postSellAdService.sellAds.isEmpty) {
      return Center(child: Text('No ads found.'));
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: postSellAdService.sellAds.length,
      itemBuilder: (context, index) {
        final ad = postSellAdService.sellAds[index];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
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
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xffF4BC1C),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(14),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.star),
                              Text(
                                'Verified',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/pro.png"),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Rice',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text('Variety :  Wheat G1',
                                      style: const TextStyle(fontSize: 11)),
                                  Text("Location : ${ad.location.join(', ')}",
                                      style: const TextStyle(fontSize: 11)),
                                ],
                              ),
                              const Spacer(),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: const Color(0xffD9D9D9),
                                child: const Center(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text("Quantity (approx.)"),
                                const Spacer(),
                                Text(
                                    "${ad.approxQuantity ?? ''} ${ad.quantityType ?? ''}"),
                              ],
                            ),
                          ),
                          Container(
                            color: const Color(0xffF4BC1C),
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text("Min-Price (approx.)"),
                                const Spacer(),
                                Text("₹ ${ad.minPriceApprox ?? ''}"),
                              ],
                            ),
                          ),
                          Container(
                            color: const Color(0xffF4BC1C),
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text("Total Cost (approx.)"),
                                const Spacer(),
                                Text("₹ ${ad.totalCostApprox ?? ''}"),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffF4BC1C),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Description : No description",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.edit, size: 16),
                                label: const Text("Edit"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffF4BC1C),
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              ElevatedButton.icon(
                                onPressed: () async {
                                  final confirm = await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Delete Ad'),
                                      content: const Text(
                                          'Are you sure you want to delete this ad?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );
                                  if (confirm == true) {
                                    try {
                                      print(
                                          'Deleting ad with ID: \'${ad.buyId ?? ''}\'');
                                      await postSellAdService
                                          .deleteSellAd(ad.buyId ?? '');
                                      await postSellAdService.getMyAds();
                                      print('Ad deleted successfully.');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Ad deleted successfully.')),
                                      );
                                    } catch (e) {
                                      print('Failed to delete ad: $e');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Failed to delete ad: $e')),
                                      );
                                    }
                                  }
                                },
                                icon: const Icon(Icons.delete, size: 16),
                                label: const Text("Delete"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side:
                                        const BorderSide(color: Colors.black12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -18,
                left: 20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                      const SizedBox(width: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Buy ID : ${ad.buyId ?? '-'}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Posted Date : " +
                                (ad.createdAt != null
                                    ? DateFormat('dd-MMMM-yy')
                                        .format(ad.createdAt!)
                                    : '-'),
                            style: const TextStyle(
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
