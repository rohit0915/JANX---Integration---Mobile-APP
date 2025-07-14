import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../model/wishkaro_models.dart';

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class WishkaroService extends GetxController {
  final box = GetStorage();
  var isLoading = false.obs;
  var wishlist = <WishlistResponse>[].obs;
  var error = ''.obs;

  Future<void> getWishlist(String token) async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/wishlist'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      isLoading.value = false;
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        wishlist.value = data.map((e) => WishlistResponse.fromJson(e)).toList();
        error.value = '';
      } else {
        error.value = 'Failed to load wishlist: \\${response.statusCode}';
        wishlist.clear();
      }
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      wishlist.clear();
    }
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
