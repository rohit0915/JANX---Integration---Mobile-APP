import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/order_summary/buyer_contact_details_screen.dart';
import 'package:jan_x/post_buy_ads/post_by_ad_screen.dart';
import 'package:jan_x/post_sell_ad/add_location/add_location_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:jan_x/services/wishkaro_service.dart';

class NewWishKaroScreen extends StatefulWidget {
  const NewWishKaroScreen({super.key});

  @override
  State<NewWishKaroScreen> createState() => _NewWishKaroScreenState();
}

bool isClicked1 = false;
bool isClicked2 = false;

class _NewWishKaroScreenState extends State<NewWishKaroScreen> {
  bool isOtherServiceClicked = false;
  bool isClickedNext = false;
  SelectedTab selectedTab = SelectedTab.defaults;
  List<dynamic> wishCategories = [];
  List<dynamic> wishSubCategories = [];
  List<dynamic> wishBrands = [];
  String? selectedCategoryId;
  String? selectedSubCategoryId;
  String? selectedBrandId;
  DateTime? fromDate;
  DateTime? toDate;
  List<File> selectedImages = [];
  bool isLoadingCategories = false;
  bool isLoadingSubCategories = false;
  bool isLoadingBrands = false;
  final WishkaroService wishkaroService = Get.find<WishkaroService>();
  String? selectedQuantityType;
  final TextEditingController productDetails = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController totalCostController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchWishCategories();
  }

  Future<void> fetchWishCategories() async {
    setState(() {
      isLoadingCategories = true;
    });
    try {
      wishCategories = await wishkaroService.fetchWishCategories();
    } catch (e) {
      wishCategories = [];
    }
    setState(() {
      isLoadingCategories = false;
    });
  }

  Future<void> fetchWishSubCategories(String categoryId) async {
    setState(() {
      isLoadingSubCategories = true;
    });
    try {
      wishSubCategories =
          await wishkaroService.fetchWishSubCategories(categoryId);
    } catch (e) {
      wishSubCategories = [];
    }
    setState(() {
      isLoadingSubCategories = false;
    });
  }

  Future<void> fetchWishBrands(String subCategoryId) async {
    setState(() {
      isLoadingBrands = true;
    });
    try {
      wishBrands = await wishkaroService.fetchWishBrands(subCategoryId);
    } catch (e) {
      wishBrands = [];
    }
    setState(() {
      isLoadingBrands = false;
    });
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImages.add(File(pickedFile.path));
      });
    }
  }

  Future<void> pickFromDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: fromDate ?? now,
      firstDate: now,
      lastDate: now.add(Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        fromDate = picked;
        // Reset toDate if it is now invalid
        if (toDate != null &&
            (toDate!.isBefore(fromDate!.add(Duration(days: 1))) ||
                toDate!.isAfter(fromDate!.add(Duration(days: 31))))) {
          toDate = null;
        }
      });
    }
  }

  Future<void> pickToDate(BuildContext context) async {
    if (fromDate == null) return;
    final picked = await showDatePicker(
      context: context,
      initialDate: toDate ?? fromDate!.add(Duration(days: 1)),
      firstDate: fromDate!.add(Duration(days: 1)),
      lastDate: fromDate!.add(Duration(days: 31)),
    );
    if (picked != null) {
      setState(() {
        toDate = picked;
      });
    }
  }

  // Add helper to show selection dialog
  Future<T?> showSelectionDialog<T>(
      BuildContext context, List<T> items, String Function(T) getLabel) async {
    return showDialog<T>(
      context: context,
      builder: (context) => SimpleDialog(
        children: items
            .map((item) => SimpleDialogOption(
                  child: Text(getLabel(item)),
                  onPressed: () => Navigator.pop(context, item),
                ))
            .toList(),
      ),
    );
  }

  Future<void> submitWish() async {
    // Validate required fields
    if (selectedCategoryId == null ||
        selectedSubCategoryId == null ||
        selectedBrandId == null ||
        fromDate == null ||
        toDate == null ||
        selectedQuantityType == null ||
        quantityController.text.isEmpty ||
        minPriceController.text.isEmpty ||
        totalCostController.text.isEmpty ||
        productDetails.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Please fill all required fields and add at least one image.')),
      );
      return;
    }

    // Convert images to base64
    List<String> productImages = [];
    for (var file in selectedImages) {
      final bytes = await file.readAsBytes();
      productImages.add(base64Encode(bytes));
    }

    final data = {
      "wish_category_id": selectedCategoryId,
      "wish_sub_category_id": selectedSubCategoryId,
      "wish_brand_id": selectedBrandId,
      "start_date": fromDate!.toIso8601String(),
      "end_date": toDate!.toIso8601String(),
      "quantity": int.tryParse(quantityController.text) ?? 0,
      "min_price": int.tryParse(minPriceController.text) ?? 0,
      "total_cost": int.tryParse(totalCostController.text) ?? 0,
      "product_detail": productDetails.text,
      "product_images": productImages,
      "quantity_type": selectedQuantityType,
    };

    print('Submitting wish data: $data');
    try {
      final response = await wishkaroService.createWish(data);
      print('Create wish response: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Show success dialog or handle success
        showCustomDialogProfile(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit wish: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

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
            title: "Wish Karo",
            color: white,
            size: 22.px,
            fontWeight: FontWeight.w700),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => UploadTutorialScreen(),
                //     ));
              },
              child: Image.asset(
                'assets/video1.png',
              )),
          buildHSpacer(3.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "New wish",
                    onPressed: () {},
                    color: buttonColor,
                    width: Adaptive.w(30),
                  )
                ],
              ),
              buildVSpacer(2.h),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildText(
                    title: "Post Your Requirement",
                    color: const Color(0xffF4BC1C),
                    fontWeight: FontWeight.bold,
                    size: 16),
              ),
              buildVSpacer(20),
              // Category selection
              DropdownButton<String>(
                isExpanded: true,
                value: selectedCategoryId,
                hint: Text('Category',
                    style: TextStyle(color: Color(0xffF4BC1C))),
                items: wishCategories.map<DropdownMenuItem<String>>((cat) {
                  return DropdownMenuItem<String>(
                    value: cat['_id'],
                    child: Text(cat['name'] ?? '',
                        style: TextStyle(color: Color(0xffF4BC1C))),
                  );
                }).toList(),
                onChanged: (value) async {
                  setState(() {
                    selectedCategoryId = value;
                    selectedSubCategoryId = null;
                    selectedBrandId = null;
                    wishSubCategories = [];
                    wishBrands = [];
                  });
                  if (value != null) await fetchWishSubCategories(value);
                },
              ),
              buildVSpacer(20),
              // Subcategory selection
              isClicked1
                  ? Container(
                      width: Adaptive.w(100),
                      padding: EdgeInsets.all(12.sp),
                      decoration: BoxDecoration(
                          border: Border.all(color: buttonColor),
                          borderRadius: BorderRadius.circular(12.sp)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildText(
                              title: "Electrionics",
                              size: 12.px,
                              fontWeight: FontWeight.w500,
                              color: buttonColor),
                          buildVSpacer(2.h),
                          _buildText(
                              title: "Automobiles",
                              size: 12.px,
                              fontWeight: FontWeight.w500,
                              color: buttonColor),
                          buildVSpacer(2.h),
                          _buildText(
                              title: "Daily Needs",
                              size: 12.px,
                              fontWeight: FontWeight.w500,
                              color: buttonColor),
                          buildVSpacer(2.h),
                          _buildText(
                              title: "Construction Material",
                              size: 10.px,
                              fontWeight: FontWeight.w500,
                              color: buttonColor),
                          buildVSpacer(2.h),
                          _buildText(
                              title: "Medicine",
                              size: 12.px,
                              fontWeight: FontWeight.w500,
                              color: buttonColor),
                        ],
                      ),
                    )
                  : const SizedBox(),
              buildVSpacer(2.h),
              // Subcategory selection
              DropdownButton<String>(
                isExpanded: true,
                value: selectedSubCategoryId,
                hint: Text('Sub-Category',
                    style: TextStyle(color: Color(0xffF4BC1C))),
                items: wishSubCategories.map<DropdownMenuItem<String>>((sub) {
                  return DropdownMenuItem<String>(
                    value: sub['_id'],
                    child: Text(sub['name'] ?? '',
                        style: TextStyle(color: Color(0xffF4BC1C))),
                  );
                }).toList(),
                onChanged: (value) async {
                  setState(() {
                    selectedSubCategoryId = value;
                    selectedBrandId = null;
                    wishBrands = [];
                  });
                  if (value != null) await fetchWishBrands(value);
                },
              ),
              buildVSpacer(20),
              isClicked2
                  ? Container(
                      width: Adaptive.w(100),
                      padding: EdgeInsets.all(12.sp),
                      decoration: BoxDecoration(
                          border: Border.all(color: buttonColor),
                          borderRadius: BorderRadius.circular(12.sp)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildText(
                              title: "Waching Mechine",
                              size: 12.px,
                              fontWeight: FontWeight.w500,
                              color: buttonColor),
                          buildVSpacer(2.h),
                          _buildText(
                              title: "Tv",
                              size: 12.px,
                              fontWeight: FontWeight.w500,
                              color: buttonColor),
                          buildVSpacer(2.h),
                          _buildText(
                              title: "Fridge",
                              size: 12.px,
                              fontWeight: FontWeight.w500,
                              color: buttonColor),
                          buildVSpacer(2.h),
                          _buildText(
                              title: "Owen",
                              size: 10.px,
                              fontWeight: FontWeight.w500,
                              color: buttonColor),
                          buildVSpacer(2.h),
                          _buildText(
                              title: "Mixer",
                              size: 12.px,
                              fontWeight: FontWeight.w500,
                              color: buttonColor),
                        ],
                      ),
                    )
                  : SizedBox(),
              buildVSpacer(2.h),
              // Brand selection
              DropdownButton<String>(
                isExpanded: true,
                value: selectedBrandId,
                hint: Text('Brand', style: TextStyle(color: Color(0xffF4BC1C))),
                items: wishBrands.map<DropdownMenuItem<String>>((brand) {
                  return DropdownMenuItem<String>(
                    value: brand['_id'],
                    child: Text(brand['name'] ?? '',
                        style: TextStyle(color: Color(0xffF4BC1C))),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedBrandId = value;
                  });
                },
              ),
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
                        child: GestureDetector(
                          onTap: () => pickFromDate(context),
                          child: AbsorbPointer(
                            child: TextFormField(
                              readOnly: true,
                              enableInteractiveSelection: false,
                              showCursor: false,
                              decoration: InputDecoration(
                                hintText: "Select From Date",
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.calendar_today,
                                    color: Color(0xffF4BC1C)),
                              ),
                              controller: TextEditingController(
                                text: fromDate != null
                                    ? fromDate!.toString().split(' ')[0]
                                    : null,
                              ),
                            ),
                          ),
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
                        child: GestureDetector(
                          onTap: () => pickToDate(context),
                          child: AbsorbPointer(
                            child: TextFormField(
                              readOnly: true,
                              enableInteractiveSelection: false,
                              showCursor: false,
                              decoration: InputDecoration(
                                hintText: "Select To Date",
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.calendar_today,
                                    color: Color(0xffF4BC1C)),
                              ),
                              controller: TextEditingController(
                                text: toDate != null
                                    ? toDate!.toString().split(' ')[0]
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              buildVSpacer(20),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildText(
                    title: "Quantity (approx) ",
                    color: const Color(0xffF4BC1C)),
              ),
              buildCustomTextField3(
                hintText: "Quantity",
                controller: quantityController,
              ),
              Row(
                children: [
                  _buildQuantityTypeButton("Ton"),
                  buildHSpacer(5),
                  _buildQuantityTypeButton("QT"),
                  buildHSpacer(5),
                  _buildQuantityTypeButton("Kg"),
                  buildHSpacer(5),
                  _buildQuantityTypeButton("Packet"),
                ],
              ),
              buildVSpacer(1.h),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildText(
                    title: "Min Price (approx) ",
                    color: const Color(0xffF4BC1C)),
              ),
              buildCustomTextField3(
                hintText: "Minimum Cost",
                controller: minPriceController,
              ),
              buildVSpacer(1.h),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildText(
                    title: "Total Cost (approx) ",
                    color: const Color(0xffF4BC1C)),
              ),
              buildCustomTextField3(
                hintText: "₹ 2400",
                controller: totalCostController,
              ),
              buildVSpacer(1.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: _buildText(
                      title: "Product Details",
                      color: const Color(0xffF4BC1C))),
              buildVSpacer(1.h),
              TextField(
                maxLines: 4,
                controller: productDetails,
                decoration: InputDecoration(
                  hintText: "Enter product details...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: buttonColor),
                  ),
                ),
              ),
              buildVSpacer(1.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: _buildText(
                      title: "Add Product Images",
                      color: const Color(0xffF4BC1C))),
              buildVSpacer(1.h),
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: Adaptive.h(12),
                  width: Adaptive.w(100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: buttonColor),
                  ),
                  child: selectedImages.isEmpty
                      ? Center(
                          child: Icon(Icons.add_a_photo, color: buttonColor))
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          children: selectedImages
                              .map((img) => Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.file(img,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover),
                                  ))
                              .toList(),
                        ),
                ),
              ),
              buildVSpacer(1.5.h),
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _buildText(
                              title: "Moisture",
                              color: const Color(0xffF4BC1C),
                              align: TextAlign.start),
                        ),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                        buildVSpacer(10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _buildText(
                              title: "Color", color: const Color(0xffF4BC1C)),
                        ),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                        buildVSpacer(10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _buildText(
                              title: "Extraneous",
                              color: const Color(0xffF4BC1C)),
                        ),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                        buildVSpacer(10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _buildText(
                              title: "Foriegn Matter",
                              color: const Color(0xffF4BC1C)),
                        ),
                        buildCustomTextField3(
                            hintText: "Select",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xffF4BC1C))),
                        buildVSpacer(10),
                        Align(
                          alignment: Alignment.centerLeft,
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
                              value: false,
                              onChanged: (bool? newValue) {
                                // setState(() {
                                //   value = newValue ??
                                //       false; // Update the value of the checkbox
                                // });
                              },
                              activeColor: const Color(0xffF4BC1C),
                            ),
                            Text(
                              "Mitra Verification",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xffF4BC1C),
                                  fontSize: 10.px),
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
                                // setState(() {
                                //   value = newValue ??
                                //       false; // Update the value of the checkbox
                                // });
                              },
                              activeColor: const Color(0xffF4BC1C),
                            ),
                            Text(
                              "Terms & Conditions",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xffF4BC1C),
                                  fontSize: 10.px),
                            ), // Optional: Add a label next to the checkbox

                            isClickedNext == true
                                ? Row(
                                    children: [
                                      buildHSpacer(30),

                                      //  const Spacer(),
                                      Image.asset('assets/Rectangle 409.png'),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      buildHSpacer(28.w),
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
                                      ),
                                    ],
                                  )
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
                child: isClickedNext == false
                    ? CustomButton(
                        text: "Save",
                        onPressed: () {
                          if (isClickedNext == false) {
                            setState(() {
                              isClickedNext = true;
                            });
                          }

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const PublishedBuyScreen(),
                          //     ));
                        })
                    : CustomButton(
                        text: "Submit",
                        onPressed: () {
                          submitWish();

                          // setState(() {
                          //   isClickedNext=true;
                          // });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const PublishedBuyScreen(),
                          //     ));
                        }),
              ),
              buildVSpacer(18.h)
            ],
          ),
        ),
      ),
    );
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
                      "Your Wish has been Successfully\nSubmitted",
                      style: GoogleFonts.lato(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    buildVSpacer(2.h),
                    Text(
                      "Wish  ID :  29066",
                      style: GoogleFonts.lato(
                          fontSize: 22.px,
                          fontWeight: FontWeight.w600,
                          color: buttonColor),
                      textAlign: TextAlign.center,
                    ),
                    buildVSpacer(5.h),
                    CustomButton(
                      text: "Wish Contact No : 29066",
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              // ignore: prefer_const_constructors
                              builder: (context) => BuyerContactDetailsScreen(
                                isFromFacilityComplete: true,
                              ),
                            ));
                      },
                      color: buttonColor,
                      // width: Adaptive.w(30),
                    ),
                    buildVSpacer(2.h),
                    CustomButton(
                      text: "Home",
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      color: buttonColor,
                      // width: Adaptive.w(30),
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

  Column wishKaroMethod1({required String title, String? title2}) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: _buildText(title: title, color: const Color(0xffF4BC1C))),
        buildVSpacer(1.h),
        Container(
          height: Adaptive.h(5),
          width: Adaptive.w(100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              border: Border.all(color: buttonColor)),
          padding: EdgeInsets.all(12.sp),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.keyboard_arrow_down,
                color: buttonColor,
              )
            ],
          ),
        ),
      ],
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

  Widget _buildQuantityTypeButton(String type) {
    final isSelected = selectedQuantityType == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedQuantityType = type;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF4BC1C) : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: const Color(0xffF4BC1C)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          type,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
