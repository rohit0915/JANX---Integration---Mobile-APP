// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        _buildText(title: "Quantity (approx) ", color: const Color(0xffF4BC1C)),
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
        _buildText(title: "Add Product Images", color: const Color(0xffF4BC1C)),
        buildVSpacer(10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
          child: Image.asset("assets/add_image.png"),
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
                      await postSellAdService.createSellAdPost(
                        context: context,
                        selectedCropId: selectedCropId,
                        selectedVarietyId: selectedVarietyId,
                        varietyTypes: varietyTypes,
                        mitraVerification: mitraVerification,
                        userIsMitra: userIsMitra,
                      );
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

  Widget _myAdsContent(BuildContext context) {
    final PostSellAdService postSellAdService = Get.find<PostSellAdService>();
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
