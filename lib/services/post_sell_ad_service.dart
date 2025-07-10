import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../model/sell_ad_models.dart';

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class PostSellAdService extends GetxService {
  final box = GetStorage();
  var isLoading = false.obs;
  var sellAds = <SellAdResponse>[].obs;
  var error = ''.obs;

  Future<http.Response> createSellAd(
    SellAdResponse request,
  ) async {
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
      if (response.statusCode == 200) {}
      return sellAds;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
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
      if (response.statusCode == 200) {}
      return sellAds;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      rethrow;
    }
  }

  Future<SellAdResponse?> getSingleAd(String adId, ) async {
    final token=box.read('token');
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/sell-ad/my-ads/$adId'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      isLoading.value = false;
      if (response.statusCode == 200) {}
      return null;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      rethrow;
    }
  }
}
