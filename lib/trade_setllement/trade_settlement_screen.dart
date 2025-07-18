import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/trade_setllement/widgets/trade_settlement_completed.dart';
import 'package:jan_x/trade_setllement/widgets/trade_settlement_widgets.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:jan_x/services/trade_settlement_service.dart';
import 'package:jan_x/model/trade_settlement_models.dart';

class TradeSettlementScreen extends StatefulWidget {
  const TradeSettlementScreen({super.key});

  @override
  State<TradeSettlementScreen> createState() => _TradeSettlementScreenState();
}

class _TradeSettlementScreenState extends State<TradeSettlementScreen> {
  SelectedTab selectedTab = SelectedTab.pending;
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
            title: "Trade Settlement",
            color: white,
            size: 22.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: Column(
          children: [
            buildVSpacer(2.h),
            Row(
              // direction: Axis.horizontal,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildTab(SelectedTab.pending, "Pending", "Active Transaction"),
                buildHSpacer(5.w),
                _buildTab(
                    SelectedTab.completed, "Completed", "Complete Transaction"),
                buildHSpacer(5.w),
                // Expanded(
                //     flex: 1,
                //     child: _buildTab(SelectedTab.income, "Income", "Income")),
              ],
            ),
            buildVSpacer(2.h),
            Expanded(
              child: SingleChildScrollView(child: _selectedTabContent()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectedTabContent() {
    switch (selectedTab) {
      case SelectedTab.pending:
        return pendingSettlement();
      case SelectedTab.completed:
        return completedSettlement();
      // case SelectedTab.income:
      //   return const IncomeMitraWidgets();
      default:
        return pendingSettlement();
    }
  }

  Widget pendingSettlement() {
    final TradeSettlementService tradeSettlementService =
        Get.find<TradeSettlementService>();
    // Fetch settlements on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tradeSettlementService.getTradeSettlement();
    });
    return Obx(() {
      if (tradeSettlementService.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (tradeSettlementService.error.value.isNotEmpty) {
        return Center(child: Text(tradeSettlementService.error.value));
      }

      // If empty, add a sample settlement for showcase
      final settlements = tradeSettlementService.settlements.isEmpty
          ? [
              TradeSettlementModel(
                adId: "250-02233",
                postedDate: "12-02-2023",
                cropName: "Wheat",
                varietyName: "Wheat G1",
                location: "Bangalore",
                quantity: 100,
                quantityType: "QT",
                minPrice: 2400,
                totalCost: 240000,
                description:
                    "Turmeric, A Plant In The Ginger Family, Is Native To South East Asia And Is Grown Commercially In That Region.",
                orderId: "67001",
                orderDate: "04-April-24",
                buyerName: "Rahul Tiwari",
                buyerMobile: "+91 1234567890",
                buyerAddress:
                    "Mg-Road, Street No : 6, 9th Cross, Beside Canara Bank, Bengaluru , Karnataka - 560001",
                buyerRating: 4.5,
              )
            ]
          : tradeSettlementService.settlements
              .toList()
              .cast<TradeSettlementModel>();

      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: settlements.length,
        itemBuilder: (context, index) {
          final settlement = settlements[index];
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // AD ID and Posted Date
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 12, left: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(0xff3A7BD5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "AD ID : ${settlement.adId}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "Posted Date : ${settlement.postedDate}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: const EdgeInsets.only(top: 12, right: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(0xffF4BC1C),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.verified,
                                    color: Colors.black, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  "Verified",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Product Info
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage("assets/pro.png"),
                            ),
                            SizedBox(width: 20),
                            // Product Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(settlement.cropName,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text('Variety :  ${settlement.varietyName}',
                                      style: TextStyle(fontSize: 11)),
                                  Text("Location : ${settlement.location}",
                                      style: TextStyle(fontSize: 11)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Color(0xffF4BC1C), thickness: 1),
                      // Quantity, Min Price, Total Cost
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Quantity (approx.)"),
                                Spacer(),
                                Text(
                                    "${settlement.quantity} ${settlement.quantityType}"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Min-Price (approx.)"),
                                Spacer(),
                                Text("₹ ${settlement.minPrice}"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Total Cost (approx.)"),
                                Spacer(),
                                Text("₹ ${settlement.totalCost}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Description
                      if (settlement.description != null &&
                          settlement.description!.isNotEmpty)
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xffF4BC1C),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "Description : ${settlement.description}",
                            style: TextStyle(fontSize: 11, color: Colors.black),
                          ),
                        ),
                      // Order/User Info
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xffF4BC1C),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.check_circle,
                                color: Colors.green, size: 20),
                            SizedBox(width: 8),
                            Text(
                              "Order ID : ${settlement.orderId}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Date : ${settlement.orderDate}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Buyer/User Info
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xffF4BC1C),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/pro.png"),
                              radius: 20,
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  settlement.buyerName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Mobile : ${settlement.buyerMobile}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "Address : ${settlement.buyerAddress}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                Text("${settlement.buyerRating}",
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget completedSettlement() {
    // For demo, use the same observable. In real use, filter for completed.
    final TradeSettlementService tradeSettlementService =
        Get.find<TradeSettlementService>();
    return Obx(() {
      if (tradeSettlementService.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (tradeSettlementService.error.value.isNotEmpty) {
        return Center(
            child: Text('Error: ' + tradeSettlementService.error.value));
      }
      if (tradeSettlementService.settlements.isEmpty) {
        return Center(child: Text('No settlements found.'));
      }
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: tradeSettlementService.settlements.length,
        itemBuilder: (context, index) {
          final settlement = tradeSettlementService.settlements[index];
          return Card(
            child: ListTile(
              title: Text('Settlement (Completed)'),
              subtitle: Text('Details: ...'), // Add real fields as needed
            ),
          );
        },
      );
    });
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
        width: Adaptive.w(35),
        height: Adaptive.h(6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF4BC1C) : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: _buildText(
                title: title,
                color: isSelected ? Colors.black : Colors.black,
                size: 11.px,
                fontWeight: FontWeight.w600),
          ),
        ),
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
      textAlign: align ?? TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}

enum SelectedTab { pending, completed }
