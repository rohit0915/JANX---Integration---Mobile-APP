import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class WishkaroService  extends GetxController{
  Future<http.Response> getWishlist(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/wishlist'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<http.Response> addToWishlist(
      Map<String, dynamic> data, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/wishlist'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> removeFromWishlist(
      String type, String adId, String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/wishlist/$type/$adId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }
}
