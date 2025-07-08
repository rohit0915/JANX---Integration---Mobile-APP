import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class PostBuyAdService extends GetxController{
  Future<http.Response> createBuyAd(
      Map<String, dynamic> data, String token) async {
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

  Future<http.Response> getMyBuyAds(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/buy-ad/my-ads'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<http.Response> getMyCompletedBuyAds(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/buy-ad/my-completed'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<http.Response> getSingleBuyAd(String adId, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/buy-ad/my-ads/$adId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }
}
