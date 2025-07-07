// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/post_sell_ad/call_screen/call_screen.dart';
import 'package:jan_x/post_sell_ad/chat_screen/chat_screen.dart';
import 'package:jan_x/post_sell_ad/post_sell_ad_screen.dart';
import 'package:jan_x/post_sell_ad/view_details/view_details_screen.dart';
import 'package:jan_x/post_sell_ad/widgets/post_sell_widgets_widget.dart';
import 'package:jan_x/published_add/published_buy_screen.dart';
import 'package:jan_x/report_screen/report_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyAdonTapScreen extends StatefulWidget {
  const MyAdonTapScreen({super.key});

  @override
  State<MyAdonTapScreen> createState() => _MyAdonTapScreenState();
}

class _MyAdonTapScreenState extends State<MyAdonTapScreen> {
  bool isSelected = false; // Mock definition for isSelected
  String headerTitle = "Header Title"; // Mock definition for headerTitle
  String? selectedCrop;
  List<String> cropTypes = ['Wheat', 'Paddy', 'Moong'];
  SelectedTab selectedTab = SelectedTab.myAds;
  bool saveButton = false;
  void _handleDropdownChange(String? newValue) {
    setState(() {
      selectedCrop = newValue;
    });
  }

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff444444),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xffF4BC1C),
                      size: 18.sp,
                    ),
                  ),
                  const SizedBox(width: 100),
                  _buildTextHeader(
                      title: "My AD's", color: Colors.white, size: 18),
                ],
              ),
              const SizedBox(height: 30),
              Flex(
                direction: Axis.horizontal,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child:
                          _buildTab(SelectedTab.newSale, "New Sale", "Seller")),
                  buildHSpacer(5.w),
                  Expanded(
                      flex: 1,
                      child:
                          _buildTab(SelectedTab.myAds, "My Ad's", "My AD's")),
                  buildHSpacer(5.w),
                  Expanded(
                      flex: 1,
                      child: _buildTab(
                          SelectedTab.completed, "Completed", "Completed")),
                ],
              ),
              buildVSpacer(1.h),
              SizedBox(
                // height: MediaQuery.of(context).size.height -
                //     40, // Adjust the height as needed
                child: SingleChildScrollView(
                  child: _selectedTabContent(),
                ),
              ),
              buildVSpacer(2.h)
            ],
          ),
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
          padding: const EdgeInsets.all(10.0),
          child: _buildTextHeader(
              title: title,
              color: isSelected ? Colors.black : Colors.grey,
              size: 10.px),
        ),
      ),
    );
  }

  Widget _selectedTabContent() {
    switch (selectedTab) {
      case SelectedTab.newSale:
        return _newSaleContent();
      case SelectedTab.myAds:
        return myAdMethod(context);

      case SelectedTab.completed:
        return CompletedContent();
      }
  }

  Widget _newSaleContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildVSpacer(20),
          _buildText(
              title: "Availability of Stock",
              color: const Color(0xffF4BC1C),
              fontWeight: FontWeight.bold,
              size: 16),
          buildVSpacer(20),
          _buildText(title: "Type of Crop", color: const Color(0xffF4BC1C)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: buildCustomTextFieldWithDropdown(),
          ),
          buildVSpacer(20),
          _buildText(title: "Variety", color: const Color(0xffF4BC1C)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: buildCustomTextFieldWithDropdown(),
          ),
          buildVSpacer(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'From',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Colors.amber),
                    ),
                    SizedBox(
                      width: Adaptive.w(35),
                      height: Adaptive.h(6),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            suffixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'To',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Colors.amber),
                    ),
                    SizedBox(
                      width: Adaptive.w(35),
                      height: Adaptive.h(6),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            suffixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          buildVSpacer(20),
          _buildText(
              title: "Quantity (approx) ", color: const Color(0xffF4BC1C)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            child: buildCustomTextField3(
              hintText: "Select Quantity",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF4BC1C),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildTextHeader(title: "Ton", size: 12),
                  ),
                ),
                buildHSpacer(5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildTextHeader(title: "QT", size: 12),
                  ),
                ),
                buildHSpacer(5),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF4BC1C),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildTextHeader(title: "Kg", size: 12),
                  ),
                ),
                buildHSpacer(5),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF4BC1C),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildTextHeader(title: "Packet", size: 12),
                  ),
                ),
              ],
            ),
          ),
          buildVSpacer(20),
          _buildText(
              title: "Min Price (approx) ", color: const Color(0xffF4BC1C)),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: buildCustomTextField3(hintText: ""),
          ),
          buildVSpacer(20),
          _buildText(
              title: "Total Cost (approx) ", color: const Color(0xffF4BC1C)),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: buildCustomTextField3(hintText: ""),
          ),
          buildVSpacer(20),
          _buildText(
              title: "Add Product Images", color: const Color(0xffF4BC1C)),
          buildVSpacer(10),
          Image.asset("assets/add_image.png"),
          buildVSpacer(20),
          Row(
            children: [
              _buildText(
                  title: "Other Details",
                  color: const Color(0xffF4BC1C),
                  fontWeight: FontWeight.bold,
                  size: 16),
              const Spacer(),
              const Icon(
                Icons.arrow_drop_down,
                color: Color(0xffF4BC1C),
              )
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: value,
                        onChanged: (bool? newValue) {
                          setState(() {
                            value = newValue ??
                                false; // Update the value of the checkbox
                          });
                        },
                        activeColor: const Color(0xffF4BC1C),
                      ),
                      Text(
                        "Mitra Verification",
                        style:
                            GoogleFonts.poppins(color: const Color(0xffF4BC1C)),
                      ),
                      buildHSpacer(30),
                      Text(
                        "Ad Posted Location",
                        style: GoogleFonts.poppins(
                            color: const Color(0xffF4BC1C), fontSize: 10),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (bool? newValue) {
                          setState(() {
                            value = newValue ??
                                false; // Update the value of the checkbox
                          });
                        },
                        activeColor: const Color(0xffF4BC1C),
                      ),
                      Text(
                        "Terms & Conditions",
                        style:
                            GoogleFonts.poppins(color: const Color(0xffF4BC1C)),
                      ), // Optional: Add a label next to the checkbox
                      buildHSpacer(50),
                      const Icon(
                        Icons.location_on,
                        color: Color(0xffF4BC1C),
                        size: 40,
                      )
                    ],
                  ),
                ],
              ),
              // Spacer(),
              // Image.asset("assets/locate.png")
            ],
          ),
          buildVSpacer(14.h),
          CustomButton(
            text: saveButton == false ? "Save " : "Submit",
            onPressed: () {
              // Navigator.pop(context);
              if (!saveButton) {
                setState(() {
                  saveButton = true;
                });
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PublishedBuyScreen(isFromSeller: true),
                    ));
              }
            },
            width: Adaptive.w(85),
          ),
          buildHSpacer(18.h)
        ],
      ),
    );
  }

  Widget buildCustomTextFieldWithDropdown() {
    return Container(
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

class CompletedContent extends StatefulWidget {
  @override
  _CompletedContentState createState() => _CompletedContentState();
}

class _CompletedContentState extends State<CompletedContent> {
  bool isClickedCompleted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: Adaptive.h(3),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isClickedCompleted = !isClickedCompleted;
                    });
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
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.px),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              buildVSpacer(20),
                              Row(
                                children: [
                                  Image.asset("assets/pro.png"),
                                  buildHSpacer(20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      _buildText1(title: "Wheat", size: 18),
                                      _buildText1(
                                          title: "Variety :  v1,Sharbati",
                                          size: 11),
                                      _buildText1(
                                          title: "Location : Jabalpur",
                                          size: 11),
                                    ],
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
                                    _buildText1(title: "100 QT"),
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
                                    _buildText1(title: "₹ 2,400.00"),
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
                                    _buildText1(title: "₹ 2,40,000.00"),
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
                        buildVSpacer(3.h),
                        Stack(
                          children: [
                            Container(
                              width: Adaptive.w(100),
                              padding: EdgeInsets.all(12.sp),
                              decoration: BoxDecoration(
                                  color: Color(0xffF4BC1C),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12.sp),
                                      topRight: Radius.circular(12.sp))),
                              child: Column(
                                children: [
                                  buildVSpacer(4.h),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/Mask group.png'),
                                          SizedBox(
                                            height: Adaptive.h(6),
                                            child: Row(children: [
                                              Text(
                                                '4.5',
                                                style: GoogleFonts.lato(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14.sp),
                                              ),
                                              ...List.generate(3, (index) {
                                                return SizedBox(
                                                  height: 3.h,
                                                  child: Icon(
                                                    Icons.star,
                                                    size:
                                                        12, // Adjust size as needed
                                                    color: Colors
                                                        .black, // Adjust color as needed
                                                  ),
                                                );
                                              }),
                                            ]),
                                          )
                                        ],
                                      ),
                                      buildHSpacer(3.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Rahul Tiwari',
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.px),
                                          ),
                                          buildVSpacer(2.h),
                                          Text(
                                            'Mobile   :  +91 1234567890',
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 9.px),
                                          ),
                                          buildVSpacer(2.h),
                                          Text(
                                            'Address : Mg-Road , Street No: 6 , 9th Cross, Beside\nCanara Bank , Bengaluru , Kanataka - 560001',
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 8.px),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  buildVSpacer(2.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12.sp),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14.sp),
                                            color: Colors.white),
                                        child: Center(
                                          child: Text(
                                            'Sold Out',
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.px),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  buildVSpacer(1.h)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -18,
                  left: 20,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                Positioned(
                  bottom: Adaptive.h(21),
                  left: 20,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xff5EAB04),
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
                              "Order ID: 67001",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Date : 05-April-24",
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
          ),
          isClickedCompleted
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      buildVSpacer(2.h),
                      CompletedScreenFieldWidget(
                        title: 'SELLER INFORMATION',
                        title2: 'SELLER INFORMATION',
                      ),
                      buildVSpacer(2.h),
                      CompletedScreenFieldWidget(
                        title: 'BUYER INFORMATION',
                        title2: 'BUYER INFORMATION',
                      ),
                      buildVSpacer(2.h),
                      CompletedScreenFieldWidget(
                        title: 'MITRA INFORMATION',
                        title2: 'MITRA INFORMATION',
                      ),
                      buildVSpacer(2.h),
                      CompleteInspectionWidget2(
                      title: "Inspection",
                      ),
                      buildVSpacer(2.h),
                      CompleteInspectionWidget2(title: 'Transport Status',isBlur: true),
                      buildVSpacer(2.h),
                      CompleteInspectionWidget2(
                        title: 'PACKAGING & LABELING',
                        isBlur: true,
                      ),
                      buildVSpacer(2.h),
                      CompleteInspectionWidget2(
                        title: 'PAYMENT',
                        isBlur: true,
                      )
                    ],
                  ),
                )
              : SizedBox(),
          buildVSpacer(10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: CustomButton(text: "Home", onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

class CompletedScreenFieldWidget extends StatefulWidget {
  CompletedScreenFieldWidget(
      {super.key,
      required this.title,
      this.title2 = '',
      this.isBlur = false,
      this.id = ''});
  final String title;
  String title2;
  String id;
  bool isBlur;
  @override
  State<CompletedScreenFieldWidget> createState() =>
      _CompletedScreenFieldWidgetState();
}

class _CompletedScreenFieldWidgetState
    extends State<CompletedScreenFieldWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: Container(
            height: Adaptive.h(7),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                color: white,
                border: Border.all(
                  color: buttonColor,
                ),
                borderRadius: BorderRadius.circular(14.sp)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.px,
                      color: grey),
                ),
                isClicked==false?    Icon(
                  Icons.keyboard_arrow_down,
                  color: grey,
                ): Icon(
                  Icons.keyboard_arrow_up,
                  color: grey,
                )
              ],
            ),
          ),
        ),
        buildVSpacer(3.h),
        isClicked
            ? Container(
                width: Adaptive.w(100),
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(
                    color: buttonColor,
                  ),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: widget.title2.isNotEmpty
                          ? Text(
                              widget.title2,
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.px,
                                  color: grey),
                            )
                          : Text(
                              'Seller information',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.px,
                                  color: grey),
                            ),
                    ),
                    buildVSpacer(2.h),
                    Divider(
                      thickness: 1,
                      color: buttonColor,
                    ),
                    buildVSpacer(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.id.isNotEmpty
                            ? Row(
                                children: [
                                  Text(
                                    widget.id,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.px,
                                        color: black),
                                  ),
                                  Text(
                                    "-000023",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.px,
                                        color: buttonColor),
                                  )
                                ],
                              )
                            : Text(
                                'Seller name',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.px,
                                    color: black),
                              ),
                        Text(
                          'Ajeet Kumar',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.px,
                              color: black),
                        ),
                      ],
                    ),
                    buildVSpacer(2.h),
                    Divider(
                      thickness: 1,
                      color: buttonColor,
                    ),
                    buildVSpacer(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mobile No',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.px,
                              color: black),
                        ),
                        widget.id.isNotEmpty
                            ? Text(
                                '+91 1234567890',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.px,
                                    color: black),
                              )
                            : Text(
                                '+91 12****90',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.px,
                                    color: black),
                              ),
                      ],
                    ),
                    buildVSpacer(2.h),
                    Divider(
                      thickness: 1,
                      color: buttonColor,
                    ),
                    buildVSpacer(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rating',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.px,
                              color: black),
                        ),
                        Image.asset('assets/Group 297.png')
                      ],
                    ),
                    buildVSpacer(2.h),
                    widget.isBlur
                        ? CustomButton(
                            color: buttonColor.withOpacity(0.4),
                            text: 'View Details',
                            textColor: black.withOpacity(0.5),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => ViewDetailsScreen(),
                              //     ));
                            })
                        : CustomButton(
                            text: 'View Details',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewDetailsScreen(),
                                  ));
                            }),
                    buildVSpacer(2.h),
                    widget.isBlur
                        ? Container(
                            padding: EdgeInsets.all(12.sp),
                            color: buttonColor.withOpacity(0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                    text: 'Chat',
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => ChatScreen(),
                                      //     ));
                                    },
                                    width: Adaptive.w(33),
                                    color: white.withOpacity(0.4),
                                    textColor: black.withOpacity(0.4)),
                                CustomButton3(
                                    text: 'Call',
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => CallScreen(),
                                      //     ));
                                    },
                                    width: Adaptive.w(33),
                                    color: black.withOpacity(0.4),
                                    textColor: white.withOpacity(0.4))
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(12.sp),
                            color: buttonColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                    text: 'Chat',
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ChatScreen(),
                                          ));
                                    },
                                    width: Adaptive.w(33),
                                    color: white,
                                    textColor: black),
                                CustomButton(
                                    text: 'Call',
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CallScreen(),
                                          ));
                                    },
                                    width: Adaptive.w(33),
                                    color: black,
                                    textColor: white)
                              ],
                            ),
                          )
                  ],
                ),
              )
            : SizedBox()
      ],
    );
  }
}
//============================
// completed inspection
//==============================

Column myAdMethod(BuildContext context) {
  return Column(
    children: [
      const SizedBox(height: 20),
      Image.asset("assets/banner.png"),
      const SizedBox(height: 20),
      _buildText(
          title: "Overview", color: Colors.white, fontWeight: FontWeight.bold),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MyAdonTapScreen(),
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
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
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
                              _buildText1(title: "Wheat", size: 18),
                              _buildText1(
                                  title: "Variety :  v1,Sharbati", size: 11),
                              _buildText1(
                                  title: "Location : Jabalpur", size: 11),
                            ],
                          )
                        ],
                      ),
                      buildVSpacer(10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            _buildText1(title: "Quantity (approx.)"),
                            Spacer(),
                            _buildText1(title: "100 QT"),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffF4BC1C),
                        ),
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            _buildText1(title: "Min-Price (approx.)"),
                            Spacer(),
                            _buildText1(title: "₹ 2,400.00"),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffF4BC1C),
                        ),
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            _buildText1(title: "Total Cost (approx.)"),
                            Spacer(),
                            _buildText1(title: "₹ 2,40,000.00"),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffF4BC1C),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildText(
                              title:
                                  "Description : Turmeric, a plant in the ginger family, is native to South east Asia and is grown commercially in that region.",
                              size: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -18,
              left: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xff3985D7),
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
      ),
      const SizedBox(height: 20),
      _buildText(
          title: "Views", color: Colors.white, fontWeight: FontWeight.bold),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ReportScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF4BC1C),
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
                      builder: (context) => ReportScreen(),
                    ),
                  );
                },
                child: _buildText(
                  title: "View - 12",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      _buildText(
          title: "Your Ad Expiry",
          color: Colors.white,
          fontWeight: FontWeight.bold),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ReportScreen(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF4BC1C),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ReportScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextButton(
                  onPressed: () {
                    // Button action
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ReportScreen(),
                      ),
                    );
                  },
                  child: _buildText(
                    title: "Posted : 20-09-2023 Expires : 20-10-2023",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      _buildText(
          title: "Ad Posted Location",
          color: Colors.white,
          fontWeight: FontWeight.bold),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Image.asset('assets/map.png'),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            buildVSpacer(2.h),
            CompletedScreenFieldWidget(
              title: 'MITRA INFORMATION',
              title2: "MITRA INFORMATION",
              id: "Mitra ID",
            ),
            buildVSpacer(2.h),
            CompletedScreenFieldWidget(
              title: 'SELLER INFORMATION',
              isBlur: true,
            ),
          ],
        ),
      ),
      // const SizedBox(height: 20),

      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffF4BC1C),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    // Edit button action
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostSellAdScreen(),
                        ));
                  },
                  icon: Icon(Icons.edit, color: Colors.black),
                  label: Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    // Delete button action
                    showCustomDialogProfile(context);
                  },
                  icon: Icon(Icons.delete, color: Colors.white),
                  label: Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 10.h),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: CustomButton(
            text: "Back",
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    ],
  );
}

Future<void> showCustomDialogProfile(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible:
        false, // Set to true if you want to dismiss the dialog by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: white,
        contentPadding: const EdgeInsets.all(0), // Remove default padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 16.0, right: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildVSpacer(5.h),
                  Text(
                    "Are You Sure You Want\nTo Delete?",
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: buttonColor),
                    textAlign: TextAlign.center,
                  ),
                  buildVSpacer(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: "Yes",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: buttonColor,
                        width: Adaptive.w(30),
                      ),
                      buildHSpacer(8.w),
                      CustomButton(
                        text: "No",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: buttonColor,
                        width: Adaptive.w(30),
                      )
                    ],
                  ),
                  buildVSpacer(5.h)
                ],
              ),
            ),
            Positioned(
                top: -Adaptive.h(0.3.h),
                right: -Adaptive.w(2),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: Adaptive.w(5),
                    backgroundColor: black,
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        color: white,
                      ),
                    ),
                  ),
                )
                // IconButton(
                //   icon: Icon(Icons.close),
                //   onPressed: () {
                //     Navigator.of(context).pop(false); // Close dialog with No action
                //   },
                // ),
                ),
          ],
        ),
      );
    },
  );
}

Widget _buildTextHeader(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Text(
    title,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: size ?? 14,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontFamily: 'Poppins',
      color: color ?? Colors.black,
    ),
  );
}

enum SelectedTab { newSale, myAds, completed }

Widget _buildText(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 18.0,
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
