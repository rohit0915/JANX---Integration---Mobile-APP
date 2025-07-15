import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../model/buy_ad_models.dart';
import 'package:flutter/material.dart';

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class PostBuyAdService extends GetxController {
  final box = GetStorage();
  var isLoading = false.obs;
  var buyAds = <BuyAdResponse>[].obs;
  var completedBuyAds = <BuyAdResponse>[].obs;
  var error = ''.obs;

  Future<http.Response> createBuyAd(
    Map<String, dynamic> data,
  ) async {
    final token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/buy-ad'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> updateBuyAd(
      String adId, Map<String, dynamic> data, String token) async {
    final response = await http.put(
      Uri.parse('$baseUrl/buy-ad/$adId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> deleteBuyAd(String adId, String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/buy-ad/$adId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<void> getMyBuyAds(String token) async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/buy-ad/my-ads'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      isLoading.value = false;
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        buyAds.value = data.map((e) => BuyAdResponse.fromJson(e)).toList();
        error.value = '';
      } else {
        error.value = 'Failed to load buy ads: \\${response.statusCode}';
        buyAds.clear();
      }
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      buyAds.clear();
    }
  }

  Future<void> getMyCompletedBuyAds(String token) async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/buy-ad/my-completed'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      isLoading.value = false;
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        completedBuyAds.value =
            data.map((e) => BuyAdResponse.fromJson(e)).toList();
        error.value = '';
      } else {
        error.value =
            'Failed to load completed buy ads: \\${response.statusCode}';
        completedBuyAds.clear();
      }
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      completedBuyAds.clear();
    }
  }

  Future<BuyAdResponse?> getSingleBuyAd(String adId, String token) async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/buy-ad/my-ads/$adId'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      isLoading.value = false;
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        error.value = '';
        return BuyAdResponse.fromJson(data);
      } else {
        error.value = 'Failed to load buy ad: \\${response.statusCode}';
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
  print('Fetching crop types with token: $token');

  final response = await http.get(
    Uri.parse('$baseUrl/crop-types/active'),
    headers: {'Authorization': 'Bearer $token'},
  );

  print('Response status code (crop types): ${response.statusCode}');
  print('Response body (crop types): ${response.body}');

  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);
    final cropTypes = decoded['crop_types'] ?? [];
    print('Decoded crop types: $cropTypes');

    return (cropTypes as List)
        .map<Map<String, String>>((e) => {
              'id': e['_id'],
              'name': e['name'],
            })
        .toList();
  } else {
    throw Exception('Failed to fetch crop types');
  }
}

Future<List<Map<String, String>>> fetchVarietiesForCrop() async {
  final token = box.read('token');
  final response = await http.get(
    Uri.parse('$baseUrl/crop-varieties/active'),
    headers: {'Authorization': 'Bearer $token'},
  );

  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);
    final cropVarieties = decoded['varieties'] ?? []; // <-- FIXED KEY
    return (cropVarieties as List)
        .map<Map<String, String>>((e) => {
              'id': e['_id'],
              'name': e['name'],
            })
        .toList();
  } else {
    throw Exception('Failed to fetch crop varieties');
  }
}
  Future<void> createBuyAdPost({
    required BuildContext context,
    required String? selectedCropId,
    required String? selectedVarietyId,
  
  }) async {
    if ((selectedCropId == null || selectedCropId.isEmpty) ||
        (selectedVarietyId == null || selectedVarietyId.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select both Crop Type and Variety.')));
      return;
    }
    final token = box.read('token');
    final data = {
      'crop_type': selectedCropId,
      'variety': selectedVarietyId,
     
    };
    try {
      final response = await createBuyAd(
        data,
      );
      print('Create Buy Ad API response: ' + response.body);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Status: ${response.statusCode}')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }
}
