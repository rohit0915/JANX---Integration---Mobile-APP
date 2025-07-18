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

  Future<void> getWishlist() async {
    final token = box.read('token');
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/wishlist'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
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
    Map<String, dynamic> data,
  ) async {
    final token = box.read('token');
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
    String type,
    String adId,
  ) async {
    final token = box.read('token');
    final response = await http.delete(
      Uri.parse('$baseUrl/wishlist/$type/$adId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<http.Response> createWish(
    Map<String, dynamic> data,
  ) async {
    final token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/wish/create'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    print(response.body);
    return response;
  }

  Future<List<Map<String, dynamic>>> fetchWishCategories() async {
    final token = box.read('token');
    if (token == null) {
      print('fetchWishCategories: No token found');
      throw Exception('User not authenticated');
    }
    final response = await http.get(
      Uri.parse('$baseUrl/wish-category/active'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print('fetchWishCategories: statusCode=${response.statusCode}');
    print('fetchWishCategories: body=${response.body}');
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      print('fetchWishCategories: decoded=$decoded');
      if (decoded is List) {
        return decoded
            .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
            .toList();
      } else if (decoded is Map && decoded['categories'] is List) {
        return (decoded['categories'] as List)
            .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
            .toList();
      } else {
        print('fetchWishCategories: Unexpected data format');
        return [];
      }
    } else {
      print('fetchWishCategories: Failed to fetch');
      throw Exception('Failed to fetch wish categories');
    }
  }

  Future<List<Map<String, dynamic>>> fetchWishSubCategories(
      String wishCategoryId) async {
    final token = box.read('token');
    if (token == null) {
      print('fetchWishSubCategories: No token found');
      throw Exception('User not authenticated');
    }
    final response = await http.get(
      Uri.parse(
          '$baseUrl/wish-sub-category/active?wish_category_id=$wishCategoryId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print('fetchWishSubCategories: statusCode=${response.statusCode}');
    print('fetchWishSubCategories: body=${response.body}');
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      print('fetchWishSubCategories: decoded=$decoded');
      if (decoded is List) {
        return decoded
            .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
            .toList();
      } else if (decoded is Map && decoded['subcategories'] is List) {
        return (decoded['subcategories'] as List)
            .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
            .toList();
      } else {
        print('fetchWishSubCategories: Unexpected data format');
        return [];
      }
    } else {
      print('fetchWishSubCategories: Failed to fetch');
      throw Exception('Failed to fetch wish sub-categories');
    }
  }

  Future<List<Map<String, dynamic>>> fetchWishBrands(
      String subCategoryId) async {
    final token = box.read('token');
    if (token == null) {
      print('fetchWishBrands: No token found');
      throw Exception('User not authenticated');
    }
    final response = await http.get(
      Uri.parse('$baseUrl/wish-brand/all?wish_sub_category_id=$subCategoryId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print('fetchWishBrands: statusCode=${response.statusCode}');
    print('fetchWishBrands: body=${response.body}');
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      print('fetchWishBrands: decoded=$decoded');
      if (decoded is List) {
        return decoded
            .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
            .toList();
      } else if (decoded is Map && decoded['brands'] is List) {
        // If your backend returns {brands: [...]}
        return (decoded['brands'] as List)
            .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
            .toList();
      } else {
        print('fetchWishBrands: Unexpected data format');
        return [];
      }
    } else {
      print('fetchWishBrands: Failed to fetch');
      throw Exception('Failed to fetch wish brands');
    }
  }
}
