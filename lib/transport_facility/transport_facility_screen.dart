import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/post_sell_ad/add_location/add_location_screen.dart';
import 'package:jan_x/profile/profile_other_screens/mitra/mitra_product_details/mitra_product_type3.dart';
import 'package:jan_x/transport_facility/bookings_transport/booking_transport_screen.dart';
import 'package:jan_x/transport_facility/widgets/faculity_completed_widgets.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransportFacilityScreen extends StatefulWidget {
  TransportFacilityScreen({super.key, this.selectedTab});
  SelectedTab? selectedTab = SelectedTab.booking;

  @override
  State<TransportFacilityScreen> createState() =>
      _TransportFacilityScreenState();
}

class _TransportFacilityScreenState extends State<TransportFacilityScreen> {
  bool value = false;

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
            size: 18.sp,
            color: buttonColor,
          ),
        ),
        title: _buildText(
          title: "Book Transport",
          color: white,
          size: 18.px,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildVSpacer(3.h),
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child:
                          _buildTab(SelectedTab.booking, "Booking", "Seller")),
                  buildHSpacer(5.w),
                  Expanded(
                      flex: 1,
                      child: _buildTab(
                          SelectedTab.upComing, "Upcoming", "My AD's")),
                  buildHSpacer(5.w),
                  Expanded(
                      flex: 1,
                      child: _buildTab(
                          SelectedTab.completed, "Completed", "Completed")),
                ],
              ),
              buildVSpacer(3.h),
              _selectedTabContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectedTabContent() {
    switch (widget.selectedTab) {
      case SelectedTab.booking:
        return SingleChildScrollView(child: bookingMethod());
      case SelectedTab.upComing:
        return facultyUpcomingMethod();
      case SelectedTab.completed:
        return faculityCompleteMethod();
      default:
        return bookingMethod();
    }
  }

  bookingMethod() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Align(
                alignment: Alignment.centerLeft,
                child: _buildText(
                    title: "From",
                    size: 10.px,
                    fontWeight: FontWeight.w700,
                    color: buttonColor)),
          ),
          Container(
            height: Adaptive.h(6),
            width: Adaptive.w(100),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.sp), color: buttonColor),
            child: Row(
              children: [
                buildHSpacer(4.w),
                Image.asset('assets/faculity1.png'),
                buildHSpacer(4.w),
                _buildText(
                    title: "Jabalpur",
                    size: 12.px,
                    fontWeight: FontWeight.w600),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Adaptive.w(4),
                    vertical: Adaptive.h(1),
                  ),
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(18.sp),
                  ),
                  child: Center(
                    child:
                        _buildText(title: "Change", size: 9.px, color: white),
                  ),
                )
              ],
            ),
          ),
          buildVSpacer(3.h),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Align(
                alignment: Alignment.centerLeft,
                child: _buildText(
                    title: "To",
                    size: 10.px,
                    fontWeight: FontWeight.w700,
                    color: buttonColor)),
          ),
          Container(
            height: Adaptive.h(6),
            width: Adaptive.w(100),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.sp), color: buttonColor),
            child: Row(
              children: [
                buildHSpacer(4.w),
                Image.asset('assets/faculity1.png'),
                buildHSpacer(4.w),
                _buildText(
                    title: "Delhi", size: 12.px, fontWeight: FontWeight.w600),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Adaptive.w(4),
                    vertical: Adaptive.h(1),
                  ),
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(18.sp),
                  ),
                  child: Center(
                    child:
                        _buildText(title: "Change", size: 9.px, color: white),
                  ),
                )
              ],
            ),
          ),
          buildVSpacer(2.h),
          Align(
            alignment: Alignment.centerLeft,
            child: _buildText(
                title: "Select Date",
                size: 12.px,
                fontWeight: FontWeight.w800,
                color: white),
          ),
          buildVSpacer(1.h),
          sampleDropMethod(img: "sample_pickup1", title: ""),
          buildVSpacer(2.h),
          Align(
            alignment: Alignment.centerLeft,
            child: _buildText(
                title: "Select Timing",
                size: 12.px,
                fontWeight: FontWeight.w800,
                color: white),
          ),
          buildVSpacer(1.h),
          sampleDropMethod(img: "sample_pickup2", title: ""),
          buildVSpacer(2.h),
          Align(
            alignment: Alignment.centerLeft,
            child: _buildText(
                title: "Select  Fleet",
                size: 16.px,
                fontWeight: FontWeight.w700,
                color: buttonColor),
          ),
          buildVSpacer(2.h),
          SizedBox(
            height: Adaptive.h(10),
            child: ListView.separated(
              padding: const EdgeInsets.all(0),
              separatorBuilder: (context, index) => buildHSpacer(7.w),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                      border: index == 0
                          ? Border.all(color: buttonColor, width: 4)
                          : const Border(),
                      color: white,
                      borderRadius: BorderRadius.circular(12.sp)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Image.asset('assets/faculity3.png')),
                      _buildText(
                        title: "Mini Pickup\n0.75-2 Tons",
                        size: 8.px,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          buildVSpacer(2.h),
          Align(
              alignment: Alignment.centerLeft,
              child: _buildText(
                  title: "Select Vehicle Route",
                  size: 16.px,
                  fontWeight: FontWeight.w600,
                  color: white)),
          buildVSpacer(2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bookingScreenMethod(titile: "Intra City"),
              bookingScreenMethod(titile: "Inter State"),
            ],
          ),
          buildVSpacer(1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bookingScreenMethod(titile: "Intra City"),
              bookingScreenMethod(titile: "Inter State"),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddLocationScreen(),
                              ));
                        },
                        child: const Icon(
                          Icons.location_on,
                          color: Color(0xffF4BC1C),
                          size: 40,
                        ),
                      )
                    ],
                  ),
                  buildVSpacer(7.h),
                ],
              ),
              // Spacer(),
              // Image.asset("assets/locate.png")
            ],
          ),
          CustomButton(
            text: "Next ",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookingTransportScreen(),
                  ));
            },
            width: Adaptive.w(85),
          ),
          buildVSpacer(5.h)
        ],
      ),
    );
  }

  facultyUpcomingMethod() {
    return Column(
      children: [
        buildVSpacer(2.h),
        activeTransationWidget3(),
        buildVSpacer(3.h),
        Image.asset('assets/wishkaroorders.png'),
        buildVSpacer(2.h),

        _buildText(
            title:
                "Note:Backend data update by transporter\nto share (Driver/ Vehicle) Details",
            size: 16.px,
            align: TextAlign.center,
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
// buildVSpacer(7.h),
// _buildText(title: "NO MORE ORDERS",size: 14.px,fontWeight: FontWeight.w700,color: white)
        buildVSpacer(12.h),
        CustomButton3(
          text: "Back",
          onPressed: () {
            setState(() {
              widget.selectedTab = SelectedTab.booking;
            });
          },
          color: buttonColor,
          size: 18.px,
        ),
        buildVSpacer(7.h),
      ],
    );
  }

  faculityCompleteMethod() {
    return Column(
      children: [
        const FaculityCompletedWidgets(),
        buildVSpacer(12.h),
        CustomButton3(
          text: "Back",
          onPressed: () {
            setState(() {
              widget.selectedTab = SelectedTab.booking;
            });
          },
          color: buttonColor,
          size: 18.px,
        ),
        buildVSpacer(7.h),
      ],
    );
  }

  Padding activeTransationWidget3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MitraProductTypeDetails(),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(13.sp)),
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
                          topRight: Radius.circular(13.sp),
                          // bottomRight: Radius.circular(13.sp),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildVSpacer(2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          title: "Order ID : 67001",
                          size: 12.px,
                          align: TextAlign.start,
                          fontWeight: FontWeight.w800),
                    ),
                    buildVSpacer(2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText(
                          title: "Date : 05-04-24 , Timing : 5:PM",
                          size: 12.px,
                          fontWeight: FontWeight.w800),
                    ),
                    buildVSpacer(2.h),
                    _buildText(
                        title: "Jabalpur <--> Delhi",
                        size: 12.px,
                        fontWeight: FontWeight.w800),
                    buildVSpacer(2.h),
                    Stack(
                      children: [
                        Container(
                          height: Adaptive.h(9),
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: const Color(0xffEEEEEE),
                            borderRadius: BorderRadius.circular(12.sp),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/active_transation.png',
                                fit: BoxFit.cover,
                                scale: 1,
                              ),
                              _buildText(
                                  title: "LCV Open (2.5-7 )Tons\nMINI TRUCK",
                                  size: 12.px,
                                  fontWeight: FontWeight.w600)
                            ],
                          ),
                        ),
                        // Positioned(
                        //   right: 0,
                        //   bottom: 0,
                        //   child: Container(
                        //     width: Adaptive.w(23),
                        //     height: Adaptive.h(4),
                        //     decoration: const BoxDecoration(color: black),
                        //     child: Center(
                        //       child: _buildText(
                        //         title: "Cancel",
                        //         size: 9.px,
                        //         color: white,
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    buildVSpacer(3.h),
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: const BoxDecoration(
                        color: buttonColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildText(
                                  title: "Vehicle No :",
                                  size: 10.px,
                                  fontWeight: FontWeight.w500),
                              _buildText(
                                  title: "Driver : Rahul Tiwari",
                                  size: 10.px,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                          buildVSpacer(1.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildText(
                                  title: "MP20BC1234",
                                  size: 10.px,
                                  fontWeight: FontWeight.w500),
                              _buildText(
                                  title: "+91 1234567890",
                                  size: 10.px,
                                  fontWeight: FontWeight.w500)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              buildVSpacer(3.h)
            ],
          ),
        ),
      ),
    );
  }

  Row bookingScreenMethod({required String titile}) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
          checkColor:
              Colors.black, // The color of the checkmark inside the checkbox
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors
                  .white; // The color of the checkbox when it's selected
            }
            return Colors
                .white; // The color of the checkbox when it's not selected
          }),
          side: const BorderSide(
              color: Colors.white,
              width: 2), // The border color when the checkbox is not selected
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(6.sp), // Rounded corners for the checkbox
          ),
        ),
        _buildText(
            title: "Intra City",
            size: 12.px,
            fontWeight: FontWeight.w400,
            color: white),
      ],
    );
  }

  Container sampleDropMethod({
    String img = '',
    required String title,
  }) {
    return Container(
      height: Adaptive.h(6),
      width: Adaptive.w(100),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          border: Border.all(
            color: white,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _buildText(
                title: title,
                size: 14.px,
                fontWeight: FontWeight.w400,
                color: white.withOpacity(0.4)),
            const Spacer(),
            img.isNotEmpty ? Image.asset('assets/$img.png') : const SizedBox()
          ],
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
              size: 12.px),
        ),
      ),
    );
  }

  // Widget _selectedTabContent() {
  Widget _buildText(
      {required String title,
      double? size,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? align}) {
    return Text(
      title,
      textAlign: align ?? TextAlign.start,
      style: GoogleFonts.poppins(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          // fontFamily: 'Poppins',
          color: color ?? Colors.black),
    );
  }
}

enum SelectedTab { booking, upComing, completed }
