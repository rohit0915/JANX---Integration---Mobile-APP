import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/post_buy_ads/tap_on_post_buy/tap_on_post_by_screen.dart';
import 'package:jan_x/post_sell_ad/add_location/add_location_screen.dart';
import 'package:jan_x/published_add/published_buy_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewSaleRequestWidget extends StatefulWidget {
  const NewSaleRequestWidget({super.key});

  @override
  State<NewSaleRequestWidget> createState() => _NewSaleRequestWidgetState();
}

List<String> cropTypes = ['Wheat', 'Paddy', 'Moong'];

class _NewSaleRequestWidgetState extends State<NewSaleRequestWidget> {
  void _handleDropdownChange(String? newValue) {
    setState(() {
      selectedCrop = newValue;
    });
  }

  bool isOtherServiceClicked = false;
  bool isBuyRequestClicked = false;
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return isBuyRequestClicked == false
        ? Column(
            children: [
              buildVSpacer(20),
              _buildText(
                  title: "Availability of Stock",
                  color: const Color(0xffF4BC1C),
                  fontWeight: FontWeight.bold,
                  size: 16),
              buildVSpacer(20),
              _buildText(title: "Type of Crop", color: const Color(0xffF4BC1C)),
              buildCustomTextFieldWithDropdown(),
              buildVSpacer(20),
              _buildText(title: "Variety", color: const Color(0xffF4BC1C)),
              buildCustomTextFieldWithDropdown(),
              buildVSpacer(20),
              Row(
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
              buildVSpacer(20),
              _buildText(
                  title: "Min Price (approx) ", color: const Color(0xffF4BC1C)),
              buildCustomTextField3(hintText: ""),
              //
              buildVSpacer(20),
              _buildText(
                  title: "Quantity (approx) ", color: const Color(0xffF4BC1C)),
              buildCustomTextField3(hintText: "Select Quantity", prefix: "QT"),
              Row(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: _buildTextHeader(title: "QT", size: 12),
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
                    padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.w(4), vertical: Adaptive.h(1)),
                    child: _buildTextHeader(title: "Packet", size: 12),
                  ),
                ],
              ),
              buildVSpacer(20),
              _buildText(
                  title: "Total Cost (approx) ",
                  color: const Color(0xffF4BC1C)),
              buildCustomTextField3(hintText: ""),
              buildVSpacer(20),
              _buildText(
                  title: "Other Details", color: const Color(0xffF4BC1C)),
              buildCustomTextField3(hintText: "Lg,Sony", color: white),
              buildVSpacer(20),

              _buildText(
                  title: "Add Product Images", color: const Color(0xffF4BC1C)),
              buildVSpacer(10),
              Image.asset("assets/add_image.png"),
              buildVSpacer(20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOtherServiceClicked = !isOtherServiceClicked;
                  });
                },
                child: Row(
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
              ),
              isOtherServiceClicked == true
                  ? Column(
                      children: [
                        buildVSpacer(10),
                        Padding(
                          padding: EdgeInsets.only(left: Adaptive.w(8)),
                          child: _buildText(
                              title: "Moisture",
                              color: const Color(0xffF4BC1C)),
                        ),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                        buildVSpacer(10),
                        Padding(
                          padding: EdgeInsets.only(left: Adaptive.w(8)),
                          child: _buildText(
                              title: "Color", color: const Color(0xffF4BC1C)),
                        ),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                        buildVSpacer(10),
                        Padding(
                          padding: EdgeInsets.only(left: Adaptive.w(8)),
                          child: _buildText(
                              title: "Extraneous",
                              color: const Color(0xffF4BC1C)),
                        ),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                        buildVSpacer(10),
                        Padding(
                          padding: EdgeInsets.only(left: Adaptive.w(8)),
                          child: _buildText(
                              title: "Foriegn Matter",
                              color: const Color(0xffF4BC1C)),
                        ),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                        buildVSpacer(10),
                        Padding(
                          padding: EdgeInsets.only(left: Adaptive.w(8)),
                          child: _buildText(
                              title: "Other Crop",
                              color: const Color(0xffF4BC1C)),
                        ),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                      ],
                    )
                  : const SizedBox(),
              buildVSpacer(3.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.sp),
                ),
                child: Column(
                  children: [
                    Container(
                      height: Adaptive.h(5),
                      padding: EdgeInsets.all(12.sp),
                      decoration: BoxDecoration(
                          color: const Color(0xffF4BC1C),
                          borderRadius: BorderRadius.circular(12.sp)),
                      child: Row(
                        children: [
                          Text(
                            'Payment & Delivery',
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w500, fontSize: 10.px),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Column(
                        children: [
                          paymentWidgetMethod(titile: "Payment", title2: ""),
                          buildVSpacer(3.h),
                          paymentWidgetMethod(
                              titile: "Delivery date", title2: ""),
                          buildVSpacer(3.h),
                          paymentWidgetMethod(
                              titile: "Other Charges", title2: ""),
                          buildVSpacer(3.h),
                          paymentWidgetMethod(titile: "Remarks", title2: ""),
                          buildVSpacer(3.h),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Upload Document',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.px),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: Adaptive.h(5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF4BC1C),
                                      borderRadius:
                                          BorderRadius.circular(12.sp),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/ph_upload-duotone.png'),
                                        buildHSpacer(2.w),
                                        Text(
                                          'Add document',
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.px),
                                        )
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                width: Adaptive.w(10),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
                            style: GoogleFonts.poppins(
                                color: const Color(0xffF4BC1C)),
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
                            style: GoogleFonts.poppins(
                                color: const Color(0xffF4BC1C)),
                          ), // Optional: Add a label next to the checkbox
                          buildHSpacer(50),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddLocationScreen(),
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
                    ],
                  ),
                  // Spacer(),
                  // Image.asset("assets/locate.png")
                ],
              ),
              buildVSpacer(10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton(
                    text: "Next",
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         MyAdonTapScreenPostBuy(),
                      //   ),
                      // );
                      setState(() {
                        isBuyRequestClicked = !isBuyRequestClicked;
                      });
                    }),
              ),
            ],
          )
        : _newSaleContent();
  }

  Flex paymentWidgetMethod({required String titile, required String title2}) {
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
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                hintText: title2,
                hintStyle: GoogleFonts.lato(
                    fontWeight: FontWeight.w600, fontSize: 10.px, color: black),
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

  String? selectedCrop;

  Widget _newSaleContent() {
    return Column(
      children: [
        buildVSpacer(20),
        _buildText(
            title: "Availability of Stock",
            color: const Color(0xffF4BC1C),
            fontWeight: FontWeight.bold,
            size: 16),
        buildVSpacer(20),
        _buildText(title: "Type of Crop", color: const Color(0xffF4BC1C)),
        buildCustomTextFieldWithDropdown(),
        buildVSpacer(20),
        _buildText(title: "Variety", color: const Color(0xffF4BC1C)),
        buildCustomTextFieldWithDropdown(),
        buildVSpacer(20),
        Row(
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
        buildVSpacer(20),
        _buildText(title: "Quantity (approx) ", color: const Color(0xffF4BC1C)),
        buildCustomTextField3(
          hintText: "Select Quantity",
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF4BC1C),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
              padding: EdgeInsets.symmetric(
                  horizontal: Adaptive.w(4), vertical: Adaptive.h(1)),
              child: _buildTextHeader(title: "Packet", size: 12),
            ),
          ],
        ),
        buildVSpacer(20),
        _buildText(
            title: "Min Price (approx) ", color: const Color(0xffF4BC1C)),
        buildCustomTextField3(hintText: ""),
        buildVSpacer(20),
        _buildText(
            title: "Total Cost (approx) ", color: const Color(0xffF4BC1C)),
        buildCustomTextField3(hintText: ""),
        buildVSpacer(20),
        _buildText(title: "Add Product Images", color: const Color(0xffF4BC1C)),
        buildVSpacer(10),
        Image.asset("assets/add_image.png"),
        buildVSpacer(20),
        GestureDetector(
          onTap: () {
            setState(() {
              isOtherServiceClicked = !isOtherServiceClicked;
            });
          },
          child: Row(
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
        ),
        isOtherServiceClicked == true
            ? Column(
                children: [
                  buildVSpacer(10),
                  _buildText(title: "Moisture", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText(title: "Color", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText(
                      title: "Extraneous", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText(
                      title: "Foriegn Matter", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                  buildVSpacer(10),
                  _buildText(
                      title: "Other Crop", color: const Color(0xffF4BC1C)),
                  buildCustomTextField3(
                      hintText: "Select",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xffF4BC1C))),
                ],
              )
            : const SizedBox(),
        buildVSpacer(3.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.sp),
          ),
          child: Column(
            children: [
              Container(
                height: Adaptive.h(5),
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    color: const Color(0xffF4BC1C),
                    borderRadius: BorderRadius.circular(12.sp)),
                child: Row(
                  children: [
                    Text(
                      'Payment & Delivery',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500, fontSize: 10.px),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Column(
                  children: [
                    paymentWidgetMethod(titile: "Payment", title2: "D+15 days"),
                    buildVSpacer(3.h),
                    paymentWidgetMethod(
                        titile: "Delivery date", title2: "T+12 days"),
                    buildVSpacer(3.h),
                    paymentWidgetMethod(
                        titile: "Other Charges", title2: "5/QT"),
                    buildVSpacer(3.h),
                    paymentWidgetMethod(titile: "Remarks", title2: "N/A"),
                    buildVSpacer(3.h),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              'Upload Document',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500, fontSize: 12.px),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: Adaptive.h(5),
                              decoration: BoxDecoration(
                                color: const Color(0xffF4BC1C),
                                borderRadius: BorderRadius.circular(12.sp),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/ph_upload-duotone.png'),
                                  buildHSpacer(2.w),
                                  Text(
                                    'Add document',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.px),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          width: Adaptive.w(10),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Adaptive.w(88),
                  child: Row(
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
                        style: GoogleFonts.poppins(
                            color: const Color(0xffF4BC1C), fontSize: 10.px),
                      ),
                      const Spacer(),
                      Text(
                        "Ad Posted Location",
                        style: GoogleFonts.poppins(
                            color: const Color(0xffF4BC1C), fontSize: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Adaptive.w(88),
                  child: Row(
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
                        style: GoogleFonts.poppins(
                            color: const Color(0xffF4BC1C), fontSize: 10.px),
                      ), // Optional: Add a label next to the checkbox
                      // buildHSpacer(50),
                      const Spacer(),
                      Image.asset('assets/Rectangle 409.png'),
                      // buildHSpacer(10.w)
                    ],
                  ),
                ),
              ],
            ),
            // Spacer(),
            // Image.asset("assets/locate.png")
          ],
        ),
        buildVSpacer(10.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: CustomButton(
              text: "Submit",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PublishedBuyScreen(),
                    ));
              }),
        ),
        buildVSpacer(18.h)
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
