// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jan_x/home_screen/home_screen.dart';
import 'package:jan_x/post_sell_ad/add_location/add_location_screen.dart';
import 'package:jan_x/post_sell_ad/call_screen/call_screen.dart';
import 'package:jan_x/post_sell_ad/chat_screen/chat_screen.dart';
import 'package:jan_x/post_sell_ad/my_ad_onTap_screen.dart';
import 'package:jan_x/post_sell_ad/view_details/view_details_screen.dart';
import 'package:jan_x/post_sell_ad/widgets/post_sell_widgets_widget.dart';
import 'package:jan_x/services/post_buy_ad_service.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:jan_x/services/post_sell_ad_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jan_x/model/sell_ad_models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jan_x/services/mitra_service.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:collection/collection.dart';

// Move these to the top-level (outside of any class)
enum SelectedTab { newSale, myAds, completed }

class CompletedContent extends StatefulWidget {
  @override
  _CompletedContentState createState() => _CompletedContentState();
}

class _CompletedContentState extends State<CompletedContent> {
  bool isClickedCompleted = false;

  final PostSellAdService postSellAdService = Get.find<PostSellAdService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      postSellAdService.getMyCompletedAds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (postSellAdService.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (postSellAdService.error.value.isNotEmpty) {
        return Center(child: Text('Error: ' + postSellAdService.error.value));
      }
      if (postSellAdService.sellAds.isEmpty) {
        return Center(child: Text('No completed ads found.'));
      }
      return ListView.builder(
        shrinkWrap: true,
        itemCount: postSellAdService.sellAds.length,
        itemBuilder: (context, index) {
          final ad = postSellAdService.sellAds[index];
          return ListTile(
            title: Text(ad.variety ?? 'No Title'),
            subtitle: Text(
              'Variety: ${ad.variety}\n'
              'Min Price: ₹${ad.minPriceApprox}\n'
              'Total Cost: ₹${ad.totalCostApprox}\n'
              'Location: ${ad.location.join(', ')}',
            ),
          );
        },
      );
    });
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
                isClicked == false
                    ? Icon(
                        Icons.keyboard_arrow_down,
                        color: grey,
                      )
                    : Icon(
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

class PostSellAdScreen extends StatefulWidget {
  PostSellAdScreen({super.key, this.selectedTab = SelectedTab.newSale});
  SelectedTab selectedTab;

  @override
  State<PostSellAdScreen> createState() => _PostSellAdScreenState();
}

bool isOtherServiceClicked = false;

class _PostSellAdScreenState extends State<PostSellAdScreen> {
  String? selectedCropId;
  String? selectedVarietyId;

  List<Map<String, String>> cropTypes = [];
  List<Map<String, String>> varietyTypes = [];

  String? varietyError;
  String headerTitle = "Seller";

  final PostSellAdService postSellAdService = Get.find<PostSellAdService>();
  final box = GetStorage();

  // Controllers for text fields
  final TextEditingController cropTypeController = TextEditingController();
  final TextEditingController varietyController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController approxQuantityController =
      TextEditingController();
  final TextEditingController quantityTypeController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController totalCostController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  bool mitraVerification = false;
  List<String> productImages = [];
  bool isVarietyLoading = true;
  bool isLoading = false;
  String? error;
  // List<Feature> otherFeatures = [];
  final PostBuyAdService postBuyAdService = Get.find<PostBuyAdService>();
  bool isPosting = false;
  String postError = '';
  bool userIsMitra = false;

  DateTime? _fromDate;
  DateTime? _toDate;

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
  }

  Future<void> _pickFromDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _fromDate ?? now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() {
        _fromDate = picked;
        if (_toDate != null &&
            (_toDate!.isBefore(_fromDate!) ||
                _toDate!.isAfter(_fromDate!.add(Duration(days: 31))))) {
          _toDate = null;
        }
      });
    }
  }

  Future<void> _pickToDate(BuildContext context) async {
    if (_fromDate == null) return;
    final picked = await showDatePicker(
      context: context,
      initialDate: _toDate ?? _fromDate!.add(Duration(days: 1)),
      firstDate: _fromDate!,
      lastDate: _fromDate!.add(Duration(days: 31)),
    );
    if (picked != null) {
      setState(() {
        _toDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchMyAds();
    _checkMitraStatus();
    _fetchCropTypes();
  }

  void _fetchMyAds() async {
    final token = box.read('token');
    if (token != null) {
      await postSellAdService.getMyAds();
    }
  }

  Future<void> _checkMitraStatus() async {
    try {
      final mitraService = Get.find<MitraService>();
      await mitraService.getMitraProfile();
      setState(() {
        userIsMitra = mitraService.mitraProfiles.isNotEmpty;
        if (!userIsMitra) mitraVerification = false;
      });
    } catch (_) {
      setState(() {
        userIsMitra = false;
        mitraVerification = false;
      });
    }
  }

  Future<void> _fetchCropTypes() async {
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      final types = await postBuyAdService.fetchCropTypes();
      setState(() {
        cropTypes = types;
      });
    } catch (e) {
      setState(() {
        error = 'Error loading crops.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchVarietiesForCrop(String cropId) async {
    setState(() {
      isVarietyLoading = true;
      error = null;
      varietyTypes = [];
      selectedVarietyId = null;
    });
    try {
      final varieties = await postBuyAdService.fetchVarietiesForCrop();
      print('Fetched varieties: $varieties');
      setState(() {
        varietyTypes = varieties;
      });
    } catch (e) {
      setState(() {
        error = 'Error loading varieties.';
      });
    } finally {
      setState(() {
        isVarietyLoading = false;
      });
    }
  }

  void _handleCropChange(String? val) {
    setState(() => selectedCropId = val);
    if (val != null) _fetchVarietiesForCrop(val);
    selectedVarietyId = null;
  }

  void _handleVarietyChange(String? val) {
    setState(() => selectedVarietyId = val);
  }

  bool value = true;
  bool saveButton = false;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff444444),
        ),
        padding: const EdgeInsets.all(10),
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
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xffF4BC1C),
                    size: 18.sp,
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
                        _buildTab(SelectedTab.newSale, "New Sale", "Seller")),
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
            buildVSpacer(1.h),
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
    switch (widget.selectedTab) {
      case SelectedTab.newSale:
        return _newSaleContent();
      case SelectedTab.myAds:
        return _myAdsContent(context);
      case SelectedTab.completed:
        return CompletedContent();
      default:
        return _newSaleContent();
    }
  }

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
        _buildDropdown(
          value: selectedCropId,
          items: cropTypes,
          onChanged: _handleCropChange,
          hint: 'Select Crop',
          getLabel: (item) => item['name']!,
          getValue: (item) => item['id']!,
        ),
        buildVSpacer(20),
        _buildText(title: "Variety", color: const Color(0xffF4BC1C)),
        isVarietyLoading
            ? CircularProgressIndicator()
            : _buildDropdown(
                value: selectedVarietyId,
                items: selectedCropId == null ? [] : varietyTypes,
                onChanged: _handleVarietyChange,
                hint: 'Select Variety',
                getLabel: (item) => item['name']!,
                getValue: (item) => item['id']!,
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
                    child: GestureDetector(
                      onTap: () => _pickFromDate(context),
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
                              text: _formatDate(_fromDate)),
                          onTap: null, // disables keyboard
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
                      onTap:
                          _fromDate == null ? null : () => _pickToDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          readOnly: true,
                          enableInteractiveSelection: false,
                          showCursor: false,
                          decoration: InputDecoration(
                            hintText: _fromDate == null
                                ? "Select From Date First"
                                : "Select To Date",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today,
                                color: Color(0xffF4BC1C)),
                          ),
                          controller:
                              TextEditingController(text: _formatDate(_toDate)),
                          onTap: null, // disables keyboard
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        buildVSpacer(20),
        _buildText(title: "Quantity (approx) ", color: const Color(0xffF4BC1C)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
          child: buildCustomTextField3(
              hintText: "Select Quantity",
              controller: approxQuantityController),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
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
        ),
        buildVSpacer(20),
        _buildText(
            title: "Min Price (approx) ", color: const Color(0xffF4BC1C)),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: buildCustomTextField3(
              hintText: "",
              controller: minPriceController,
              prefix: quantityTypeController.text),
        ),
        buildVSpacer(20),
        _buildText(
            title: "Total Cost (approx) ", color: const Color(0xffF4BC1C)),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: buildCustomTextField3(
              hintText: "",
              controller: totalCostController,
              prefix: quantityTypeController.text),
        ),
        buildVSpacer(20),
        _buildText(title: "Add Product Images", color: const Color(0xffF4BC1C)),
        buildVSpacer(10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                // border: Border.all(color: Color(0xffF4BC1C), width: 2),
                borderRadius: BorderRadius.circular(10),
                // color: Colors.grey[200],
              ),
              child: _selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(_selectedImage!,
                          fit: BoxFit.cover, width: double.infinity),
                    )
                  : Image.asset("assets/add_image.png", fit: BoxFit.contain),
            ),
          ),
        ),
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
                        title: "Moisture", color: const Color(0xffF4BC1C)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0),
                    child: buildCustomTextField3(
                        hintText: "Select",
                        suffixIcon: Icon(Icons.keyboard_arrow_down,
                            color: Color(0xffF4BC1C))),
                  ),
                  buildVSpacer(10),
                  Padding(
                    padding: EdgeInsets.only(left: Adaptive.w(8)),
                    child: _buildText(
                        title: "Color", color: const Color(0xffF4BC1C)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0),
                    child: buildCustomTextField3(
                        hintText: "Select",
                        suffixIcon: Icon(Icons.keyboard_arrow_down,
                            color: Color(0xffF4BC1C))),
                  ),
                  buildVSpacer(10),
                  Padding(
                    padding: EdgeInsets.only(left: Adaptive.w(8)),
                    child: _buildText(
                        title: "Extraneous", color: const Color(0xffF4BC1C)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0),
                    child: buildCustomTextField3(
                        hintText: "Select",
                        suffixIcon: Icon(Icons.keyboard_arrow_down,
                            color: Color(0xffF4BC1C))),
                  ),
                  buildVSpacer(10),
                  Padding(
                    padding: EdgeInsets.only(left: Adaptive.w(8)),
                    child: _buildText(
                        title: "Foriegn Matter",
                        color: const Color(0xffF4BC1C)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0),
                    child: buildCustomTextField3(
                        hintText: "Select",
                        suffixIcon: Icon(Icons.keyboard_arrow_down,
                            color: Color(0xffF4BC1C))),
                  ),
                  buildVSpacer(10),
                  Padding(
                    padding: EdgeInsets.only(left: Adaptive.w(8)),
                    child: _buildText(
                        title: "Other Crop", color: const Color(0xffF4BC1C)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0),
                    child: buildCustomTextField3(
                        hintText: "Select",
                        suffixIcon: Icon(Icons.keyboard_arrow_down,
                            color: Color(0xffF4BC1C))),
                  ),
                ],
              )
            : SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: mitraVerification && userIsMitra,
                        onChanged: userIsMitra
                            ? (bool? newValue) {
                                setState(() {
                                  mitraVerification = newValue ?? false;
                                });
                              }
                            : null,
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
                            value = newValue ?? false;
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
                                builder: (context) => AddLocationScreen(),
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
                  buildVSpacer(14.h),
                  CustomButton(
                    text: "Submit",
                    onPressed: () async {
                      // Gather and validate user input
                      print('Quantity: "${approxQuantityController.text}"');
                      print('Min Price: "${minPriceController.text}"');
                      print('Total Cost: "${totalCostController.text}"');
                      final cropId = selectedCropId;
                      final varietyId = selectedVarietyId;
                      final cropName = cropTypes.firstWhereOrNull(
                              (item) => item['id'] == cropId)?['name'] ??
                          '';
                      final varietyName = varietyTypes.firstWhereOrNull(
                              (item) => item['id'] == varietyId)?['name'] ??
                          '';
                      final approxQuantity =
                          int.tryParse(approxQuantityController.text);
                      final quantityType =
                          quantityTypeController.text.isNotEmpty
                              ? quantityTypeController.text
                              : null;
                      final minPrice = int.tryParse(minPriceController.text);
                      final totalCost = int.tryParse(totalCostController.text);
                      final fromDate = _fromDate;
                      final toDate = _toDate;
                      final imageFile = _selectedImage;
                      final location = <String>["Bangalore"];
                      // Example: gather other features (if you have fields for them)
                      List<OtherFeature> otherFeatures = [];
                      // TODO: Add logic to collect other features from the UI

                      // Upload image(s) and collect URLs
                      List<String> uploadedImageUrls = [];
                      if (imageFile != null) {
                        final url =
                            await postSellAdService.uploadIdPicture(imageFile);
                        if (url != null) {
                          uploadedImageUrls.add(url);
                        }
                      }

                      // Validation
                      if (cropId == null ||
                          cropId.isEmpty ||
                          varietyId == null ||
                          varietyId.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Please select both Crop Type and Variety.')),
                        );
                        return;
                      }
                      if (approxQuantity == null ||
                          minPrice == null ||
                          totalCost == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Please enter valid numbers for quantity, min price, and total cost.')),
                        );
                        return;
                      }

                      final response = await postSellAdService.createSellAdPost(
                        context: context,
                        selectedCropId: cropId,
                        selectedVarietyId: varietyId,
                        cropName: cropName,
                        varietyName: varietyName,
                        varietyTypes: varietyTypes,
                        mitraVerification: mitraVerification,
                        userIsMitra: userIsMitra,
                        startDate: fromDate,
                        endDate: toDate,
                        approxQuantity: approxQuantity,
                        quantityType: quantityType,
                        minPriceApprox: minPrice,
                        totalCostApprox: totalCost,
                        productImages: uploadedImageUrls, // <-- use URLs here
                        location: location,
                        otherFeatures: otherFeatures,
                      );
                      if (response != null &&
                          (response.statusCode == 200 ||
                              response.statusCode == 201)) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false,
                        );
                      }
                    },
                    width: Adaptive.w(85),
                  ),
                ],
              ),
              // Spacer(),
              // Image.asset("assets/locate.png")
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<Map<String, String>> items,
    required void Function(String?)? onChanged, // <-- nullable
    required String Function(Map<String, String>) getLabel,
    required String Function(Map<String, String>) getValue,
    String? hint,
  }) {
    return Container(
      height: 6.h,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffF4BC1C), width: 2.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: (value != null && value.isNotEmpty) ? value : null,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          onChanged: onChanged,
          hint: hint != null
              ? Text(hint, style: TextStyle(color: Colors.grey))
              : null,
          items: items.map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: getValue(item),
              child: Text(getLabel(item)),
            );
          }).toList(),
          dropdownColor: const Color(0xffF4BC1C),
        ),
      ),
    );
  }

  // ... existing code ...
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
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
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
                                                Navigator.of(context)
                                                    .pop(false),
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
                                      side: const BorderSide(
                                          color: Colors.black12),
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
                      color: Colors.blue,
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
                              "Sell ID : ${ad.buyId ?? '-'}",
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

// ... existing code .
  Widget _buildQuantityTypeButton(String type) {
    final isSelected = quantityTypeController.text == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          quantityTypeController.text = type;
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
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 8.0,
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

Future<void> showCustomDialogProfile(BuildContext context) async {
  return showDialog<void>(
    context: context,

    barrierDismissible:
        false, // Set to true if you want to dismiss the dialog by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: white,
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
                        fontSize: 20.px,
                        fontWeight: FontWeight.w800,
                        color: buttonColor),
                    textAlign: TextAlign.center,
                  ),
                  buildVSpacer(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: "Yes",
                        size: 16.px,
                        weight: FontWeight.w600,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: buttonColor,
                        width: Adaptive.w(30),
                      ),
                      buildHSpacer(8.w),
                      CustomButton(
                        text: "No",
                        size: 16.px,
                        weight: FontWeight.w600,
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

class MyAdWidget extends StatefulWidget {
  const MyAdWidget({super.key});

  @override
  State<MyAdWidget> createState() => _MyAdWidgetState();
}

SelectedTab selectedTab = SelectedTab.newSale;

class _MyAdWidgetState extends State<MyAdWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MyAdonTapScreen(),
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
                            _buildText1(title: "Wheat", size: 18),
                            _buildText1(
                                title: "Variety :  v1,Sharbati", size: 11),
                            _buildText1(title: "Location : Jabalpur", size: 11),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: SizedBox(
                              height: 4.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  log("ss cliking");
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostSellAdScreen(
                                            selectedTab: SelectedTab.newSale),
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFEDB31B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Edit",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      buildHSpacer(10),
                                      Image.asset("assets/edit.png")
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 4.h,
                          child: ElevatedButton(
                            onPressed: () {
                              showCustomDialogProfile(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEDB31B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Delete",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.delete,
                                    size: 14,
                                  ),
                                  const SizedBox()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
}
