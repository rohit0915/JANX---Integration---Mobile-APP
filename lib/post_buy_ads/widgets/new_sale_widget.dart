import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jan_x/home_screen/home_screen.dart';
import 'package:jan_x/post_buy_ads/tap_on_post_buy/tap_on_post_by_screen.dart';
import 'package:jan_x/post_sell_ad/add_location/add_location_screen.dart';
import 'package:jan_x/published_add/published_buy_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jan_x/services/post_buy_ad_service.dart';
import 'package:jan_x/services/post_sell_ad_service.dart';
import 'package:jan_x/model/sell_ad_models.dart';

class NewSaleRequestWidget extends StatefulWidget {
  const NewSaleRequestWidget({super.key});

  @override
  State<NewSaleRequestWidget> createState() => _NewSaleRequestWidgetState();
}

class _NewSaleRequestWidgetState extends State<NewSaleRequestWidget> {
  String? selectedCropId;
  String? selectedVarietyId;
  List<Map<String, String>> cropTypes = [];
  List<Map<String, String>> varietyTypes = [];
  bool isVarietyLoading = true;
  bool isLoading = false;
  String? error;
  final PostBuyAdService postBuyAdService = Get.find<PostBuyAdService>();
  final PostSellAdService postSellAdService = Get.find<PostSellAdService>();
  final box = GetStorage();

  // Add controllers for quantity, min price, total cost, and quantity type
  final TextEditingController approxQuantityController =
      TextEditingController();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController totalCostController = TextEditingController();
  final TextEditingController quantityTypeController =
      TextEditingController(text: "QT");

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
        // Clear 'To' date if it is before 'From' or more than one month after
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
    _fetchCropTypes();
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

  Future<void> _submitBuyAd() async {
    // Validate required fields
    if ((selectedCropId == null || selectedCropId!.isEmpty) ||
        (selectedVarietyId == null || selectedVarietyId!.isEmpty) ||
        approxQuantityController.text.isEmpty ||
        minPriceController.text.isEmpty ||
        totalCostController.text.isEmpty ||
        _fromDate == null ||
        _toDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all required fields.')),
      );
      return;
    }
    setState(() {
      isLoading = true;
    });
    try {
      final response = await postSellAdService.createSellAd(
        SellAdResponse(
          cropType: selectedCropId ?? '',
          variety: selectedVarietyId ?? '',
          startDate: _fromDate,
          endDate: _toDate,
          approxQuantity: int.tryParse(approxQuantityController.text),
          quantityType: quantityTypeController.text,
          minPriceApprox: int.tryParse(minPriceController.text) ?? 0,
          totalCostApprox: int.tryParse(totalCostController.text) ?? 0,
          productImages: [],
          location: ["Bangalore"],
          otherFeatures: [],
          mitraVerification: false,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create ad. Please try again.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
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
              // ? Center(child: CircularProgressIndicator())
              // : error != null
              //     ? Text(error!, style: TextStyle(color: Colors.red))

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
                          onTap: _fromDate == null
                              ? null
                              : () => _pickToDate(context),
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
                              controller: TextEditingController(
                                  text: _formatDate(_toDate)),
                              onTap: null, // disables keyboard
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              buildVSpacer(20),
              _buildText(
                  title: "Min Price (approx) ", color: const Color(0xffF4BC1C)),
              buildCustomTextField3(
                  hintText: "",
                  controller: minPriceController,
                  prefix: quantityTypeController.text),
              //
              buildVSpacer(20),
              _buildText(
                  title: "Quantity (approx) ", color: const Color(0xffF4BC1C)),
              buildCustomTextField3(
                hintText: "Select Quantity",
                controller: approxQuantityController,
                prefix: quantityTypeController.text,
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
                  title: "Total Cost (approx) ",
                  color: const Color(0xffF4BC1C)),
              buildCustomTextField3(
                  hintText: "",
                  controller: totalCostController,
                  prefix: quantityTypeController.text),
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
        _buildDropdown(
          value: selectedVarietyId,
          items: varietyTypes,
          onChanged: _handleVarietyChange,
          hint: 'Select Variety',
          getLabel: (item) => item['name']!,
          getValue: (item) => item['id']!,
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
                        controller:
                            TextEditingController(text: _formatDate(_fromDate)),
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
        buildVSpacer(20),
        _buildText(title: "Quantity (approx) ", color: const Color(0xffF4BC1C)),
        buildCustomTextField3(
          hintText: "Select Quantity",
          controller: approxQuantityController,
          prefix: quantityTypeController.text,
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
        buildCustomTextField3(
            hintText: "",
            controller: minPriceController,
            prefix: quantityTypeController.text),
        buildVSpacer(20),
        _buildText(
            title: "Total Cost (approx) ", color: const Color(0xffF4BC1C)),
        buildCustomTextField3(
            hintText: "",
            controller: totalCostController,
            prefix: quantityTypeController.text),
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
          child: CustomButton(text: "Submit", onPressed: _submitBuyAd),
        ),
        buildVSpacer(18.h)
      ],
    );
  }

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
