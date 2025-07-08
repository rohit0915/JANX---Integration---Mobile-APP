import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/sell_ad_models.dart';

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class PostSellAdService extends GetxService {
  var isLoading = false.obs;
  var sellAds = <SellAdResponse>[].obs;
  var error = ''.obs;

  Future<http.Response> createSellAd(
      SellAdRequest request, String token) async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/sell-ad'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request.toJson()),
      );
      isLoading.value = false;
      return response;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      rethrow;
    }
  }

  Future<http.Response> updateSellAd(
      String adId, SellAdRequest request, String token) async {
    isLoading.value = true;
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/sell-ad/$adId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request.toJson()),
      );
      isLoading.value = false;
      return response;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      rethrow;
    }
  }

  Future<http.Response> deleteSellAd(String adId, String token) async {
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

  Future<List<SellAdResponse>> getMyAds(String token) async {
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
     
      }
      return sellAds;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      rethrow;
    }
  }

  Future<List<SellAdResponse>> getMyCompletedAds(String token) async {
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
     
      }
      return sellAds;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      rethrow;
    }
  }

  Future<SellAdResponse?> getSingleAd(String adId, String token) async {
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
       
      }
      return null;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      rethrow;
    }
  }
}
