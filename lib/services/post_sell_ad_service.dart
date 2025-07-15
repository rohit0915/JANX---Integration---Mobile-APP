import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../model/sell_ad_models.dart';
import 'package:flutter/material.dart';

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class PostSellAdService extends GetxService {
  final box = GetStorage();
  var isLoading = false.obs;
  var sellAds = <SellAdResponse>[].obs;
  var error = ''.obs;

  Future<http.Response> createSellAd(
    SellAdResponse request,
  ) async {
    print("Sell Ad function has been called");
    final token = box.read('token');
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/sell-ad'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request),
      );
      isLoading.value = false;
      print(response.body);
      return response;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      rethrow;
    }
  }

  Future<http.Response> updateSellAd(
    String adId,
    SellAdResponse request,
  ) async {
    final token = box.read('token');
    isLoading.value = true;
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/sell-ad/$adId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request),
      );
      isLoading.value = false;
      return response;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      rethrow;
    }
  }

  Future<http.Response> deleteSellAd(
    String adId,
  ) async {
    final token = box.read('token');
    isLoading.value = true;
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/sell-ad/$adId'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      isLoading.value = false;
      return response;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      rethrow;
    }
  }

  Future<List<SellAdResponse>> getMyAds() async {
    final token = box.read('token');
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/sell-ad/my-ads'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      isLoading.value = false;
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List<dynamic> data = decoded is List
            ? decoded
            : (decoded['data'] is List ? decoded['data'] : []);
        sellAds.value = data.map((e) => SellAdResponse.fromJson(e)).toList();
        error.value = '';
      } else {
        error.value = 'Failed to load ads: ${response.statusCode}';
        sellAds.clear();
      }
      return sellAds;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      sellAds.clear();
      rethrow;
    }
  }

  Future<List<SellAdResponse>> getMyCompletedAds() async {
    final token = box.read('token');
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/sell-ad/my-completed'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      isLoading.value = false;
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List<dynamic> data = decoded is List
            ? decoded
            : (decoded['data'] is List ? decoded['data'] : []);
        sellAds.value = data.map((e) => SellAdResponse.fromJson(e)).toList();
        error.value = '';
      } else {
        error.value = 'Failed to load completed ads: ${response.statusCode}';
        sellAds.clear();
      }
      return sellAds;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      sellAds.clear();
      rethrow;
    }
  }

  Future<SellAdResponse?> getSingleAd(
    String adId,
  ) async {
    final token = box.read('token');
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/sell-ad/my-ads/$adId'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      isLoading.value = false;
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        error.value = '';
        return SellAdResponse.fromJson(data);
      } else {
        error.value = 'Failed to load ad: ${response.statusCode}';
        return null;
      }
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      return null;
    }
  }

  Future<List<Map<String, String>>> fetchCropTypes() async {
    final token = box.read('token');
    final response = await http.get(
      Uri.parse('$baseUrl/crop-types/active'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return (decoded is List ? decoded : (decoded['data'] ?? []))
          .map<Map<String, String>>((e) => {
                'id': e['_id'],
                'name': e['name'],
              })
          .toList();
    } else {
      throw Exception('Failed to fetch crop types');
    }
  }

  Future<List<Map<String, String>>> fetchVarietiesForCrop(String cropId) async {
    print('fetchVarietiesForCrop called with cropId: $cropId');
    final token = box.read('token');
    final response = await http.get(
      Uri.parse('$baseUrl/crop-varieties/active?crop_type_id=$cropId'),
      headers: {'Authorization': 'Bearer $token'},
    );
    print('API response status: ${response.statusCode}');
    print('API response body: ${response.body}');
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final varieties = decoded is List
          ? decoded
          : (decoded['varieties'] ?? decoded['data'] ?? []);
      print('Parsed varieties: ${varieties}');
      return (varieties as List)
          .map<Map<String, String>>((e) => {
                'id': e['_id'],
                'name': e['name'],
              })
          .toList();
    } else {
      print('Failed to fetch crop varieties');
      throw Exception('Failed to fetch crop varieties');
    }
  }

  // Add a public method to handle Sell Ad creation from the UI
  Future<void> createSellAdPost({
    required BuildContext context,
    required String? selectedCropId,
    required String? selectedVarietyId,
    required List<Map<String, String>> varietyTypes,
    required bool mitraVerification,
    required bool userIsMitra,
  }) async {
    if ((selectedCropId == null || selectedCropId.isEmpty) ||
        (selectedVarietyId == null || selectedVarietyId.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select both Crop Type and Variety.')),
      );
      return;
    }
    if (!varietyTypes.any((v) => v['id'] == selectedVarietyId)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Selected variety does not match selected crop.')),
      );
      return;
    }
    if (mitraVerification && !userIsMitra) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'You must complete Mitra registration before enabling Mitra verification.')),
      );
      return;
    }
    final ad = SellAdResponse(
      cropType: selectedCropId ?? '',
      variety: selectedVarietyId ?? '665f1e4b8b3e2c0012a4d1b1',
      minPriceApprox: 1000,
      totalCostApprox: 5000,
      location: ['Test Location'],
      mitraVerification: userIsMitra ? mitraVerification : false,
    );
    final response = await createSellAd(ad);
    print('Create Sell Ad API response: ' + response.body);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Status: ${response.statusCode}')),
    );
  }
}
