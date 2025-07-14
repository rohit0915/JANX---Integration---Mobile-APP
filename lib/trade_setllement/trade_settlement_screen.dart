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
              title: Text('Settlement'),
              subtitle: Text('Details: ...'), // Add real fields as needed
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
