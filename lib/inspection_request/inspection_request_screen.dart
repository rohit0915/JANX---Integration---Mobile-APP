import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/inspection_request/inspection_request_details/inspection_request_details_screen.dart';
import 'package:jan_x/inspection_request/new_request/new_request_screen.dart';
import 'package:jan_x/inspection_request/widgets/complete_inspection_widgets.dart';
import 'package:jan_x/report_screen/report_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InspectionRequestScreen extends StatefulWidget {
   InspectionRequestScreen({super.key,this.selectedTab=SelectedTab.defaults});

SelectedTab selectedTab ;
  @override
  State<InspectionRequestScreen> createState() =>
      _InspectionRequestScreenState();
}


class _InspectionRequestScreenState extends State<InspectionRequestScreen> {
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
              color: buttonColor,
              size: 18.sp,
            )),
        title: _buildText(
            title: "Inspection Request",
            fontWeight: FontWeight.w700,
            size: 24.px,
            color: white),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: Column(
          children: [
            buildVSpacer(2.h),
            Flex(
              direction: Axis.horizontal,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: _buildTab(
                        SelectedTab.newRequest, "New Request", "Seller")),
                buildHSpacer(5.w),
                Expanded(
                    flex: 1,
                    child: _buildTab(
                        SelectedTab.inProgress, "InProgress ", "My AD's")),
                buildHSpacer(5.w),
                Expanded(
                    flex: 1,
                    child: _buildTab(
                        SelectedTab.completed, "Completed", "Completed")),
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
    );
  }

  Widget _selectedTabContent() {
    switch (widget.selectedTab) {
      case SelectedTab.newRequest:
        return defaultMethodInInspection();
      case SelectedTab.inProgress:
        return inProgressMethod();
      case SelectedTab.completed:
        return completeMethod();
      default:
        return defaultMethodInInspection();
    }
  }

  completeMethod() {
    return Column(
      children: [
        const CompleteInspectionWidget(),
        buildVSpacer(7.h),
        CustomButton(
          text: "Home",
          onPressed: () {
            setState(() {
            widget.selectedTab = SelectedTab.defaults;
            });
          },
          size: 18.px,
          color: buttonColor,
        ),
        buildVSpacer(7.h),
      ],
    );
  }

  inProgressMethod() {
    return Column(
      children: [
        saleProducMethod(context),
        buildVSpacer(3.h),
        Align(
            alignment: Alignment.centerLeft,
            child: _buildText(
                title: "Inspection Status",
                size: 14.px,
                fontWeight: FontWeight.w800,
                color: white)),
        buildVSpacer(1.h),
        Container(
          width: Adaptive.w(100),
          decoration: BoxDecoration(
            color: const Color(0xffF4BC1C),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const ReportScreen(),
                  ),
                );
              },
              child: _buildText(
                title: "Under Process",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        buildVSpacer(3.h),
        Align(
            alignment: Alignment.centerLeft,
            child: _buildText(
                title: "Inspection Report",
                size: 14.px,
                fontWeight: FontWeight.w800,
                color: white)),
        buildVSpacer(1.h),
        Container(
          width: Adaptive.w(100),
          decoration: BoxDecoration(
            color: const Color(0xffF4BC1C),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ReportScreen(),
                  ),
                );
              },
              child: _buildText(
                title: "In Process",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        buildVSpacer(2.h),
        Align(
            alignment: Alignment.centerLeft,
            child: _buildText(
                title: "Inspection Grade%",
                size: 14.px,
                fontWeight: FontWeight.w800,
                color: white)),
        buildVSpacer(2.h),
        Container(
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp), color: white),
          child: Column(
            children: [
              buildVSpacer(2.h),
              Row(
                children: [
                  _buildText(
                      title: "Grade (%)",
                      size: 10.px,
                      fontWeight: FontWeight.w500),
                  buildHSpacer(17.w),
                  Container(
                    height: Adaptive.h(5),
                    width: Adaptive.w(45),
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        borderRadius: BorderRadius.circular(12.sp)),
                  )
                ],
              ),
              buildVSpacer(2.h),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomButton3(
                      height: 5.h,
                      size: 10.px,
                      weight: FontWeight.w700,
                      text: "Discount",
                      onPressed: () {},
                      width: Adaptive.w(35),
                      borderColor: black,
                      color: white,
                    ),
                  ),
                  buildHSpacer(5.w),
                  Expanded(
                    flex: 1,
                    child: CustomButton3(
                      height: 5.h,
                      size: 10.px,
                      weight: FontWeight.w700,
                      text: "Premium",
                      onPressed: () {},
                      width: Adaptive.w(35),
                      borderColor: black,
                      color: white,
                    ),
                  ),
                  buildHSpacer(5.w),
                  Expanded(
                    flex: 1,
                    child: CustomButton3(
                      height: 5.h,
                      size: 10.px,
                      weight: FontWeight.w700,
                      text: "Market Rate",
                      onPressed: () {},
                      width: Adaptive.w(35),
                      borderColor: black,
                      color: white,
                    ),
                  )
                ],
              ),
              buildVSpacer(2.h),
              _buildText(
                  title:
                      "data will be fetched automatically from backend/not manual",
                  size: 10.px,
                  fontWeight: FontWeight.w600)
            ],
          ),
        ),
        buildVSpacer(7.h),
        CustomButton(
          text: "Home",
          onPressed: () {
            setState(() {
            widget.  selectedTab = SelectedTab.defaults;
            });
          },
          size: 18.px,
          color: buttonColor,
        ),
        buildVSpacer(7.h),
      ],
    );
  }

  Widget saleProducMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      const InspectionRequestDetailsScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
                child: Column(
                  children: [
                    buildVSpacer(20),
                    Row(
                      children: [
                        Image.asset("assets/pro.png"),
                        buildHSpacer(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildText(title: "Wheat", size: 18),
                            _buildText(
                                title: "Variety :  v1,Sharbati", size: 11),
                            _buildText(title: "Location : Jabalpur", size: 11),
                          ],
                        ),
                        // const Spacer(),
                        // CircleAvatar(
                        //   radius: Adaptive.w(5),
                        //   backgroundColor: const Color(0xffD9D9D9),
                        //   child: const Center(
                        //     child: Icon(
                        //       Icons.favorite,
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    buildVSpacer(10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          _buildText(title: "Quantity (approx.)"),
                          const Spacer(),
                          _buildText(title: "100 QT"),
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
                          _buildText(title: "Min-Price (approx.)"),
                          const Spacer(),
                          _buildText(title: "₹ 2,400.00"),
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
                          _buildText(title: "Total Cost (approx.)"),
                          const Spacer(),
                          _buildText(title: "₹ 2,40,000.00"),
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
                                "Description : Turmeric, a plant in the ginger family, is native to South east Asia and is grown commercially in that region.",
                            size: 11.px),
                      ),
                    ),
                    buildVSpacer(20),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -18,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xff3985D7),
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
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "AD ID: 4545454454",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Posted Date : 05-April-24",
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

  defaultMethodInInspection() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: Adaptive.w(75),
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(18.sp)),
              child: _buildText(
                  title:
                      "Search with Ad-ID, Crop ,Price, phone number etc.........",
                  size: 8.px),
            ),
            Spacer(),
            Image.asset('assets/inspectionimg1.png')
          ],
        ),
        buildVSpacer(4.h),
        Align(
            alignment: Alignment.centerLeft,
            child: _buildText(
                title: "Search Your Ad",
                size: 10.px,
                fontWeight: FontWeight.w700,
                color: white)),
        // Spacer(),
        buildVSpacer(15.h),
        Container(
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(12.sp)),
          child: Column(
            children: [
              _buildText(
                  title:
                      "Note : If Sample drop has been selected\nthen inprogress & Completed will show the\ninformation about the JANX center",
                  color: Colors.red,
                  size: 16.px,
                  fontWeight: FontWeight.w600),
              buildVSpacer(3.h),
              _buildText(
                  title:
                      "Note : If Sample pick has been selected \nthen inprogress & Completed will show the\ninformation about the Inspector Information",
                  color: Colors.red,
                  size: 16.px,
                  fontWeight: FontWeight.w600)
            ],
          ),
        ),
        buildVSpacer(20.h),
        CustomButton3(
          text: "Next",
          onPressed: () {},
          size: 19.px,
          weight: FontWeight.w500,
        )
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
    bool isSelected =widget.selectedTab == tab;
    return GestureDetector(
      onTap: () {
        setState(() {
         widget.selectedTab = tab;
          // headerTitle = headerText;
        });
        if (widget. selectedTab == SelectedTab.newRequest) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewRequestScreen(),
              ));
        }
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

enum SelectedTab { newRequest, inProgress, completed, defaults }
