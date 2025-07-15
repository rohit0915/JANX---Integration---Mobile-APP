import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:jan_x/model/sell_ad_models.dart';

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class SaleAdService extends GetxController {
  final box = GetStorage();
  var isLoading = false.obs;
  var saleAds = <SellAdResponse>[].obs;
  var error = ''.obs;

  Future<void> getSalesAds() async {
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
        print('Sale Ads API response: ' + response.body);
        final decoded = jsonDecode(response.body);
        final List<dynamic> data = decoded['ads'] is List ? decoded['ads'] : [];
        saleAds.value = data.map((e) => SellAdResponse.fromJson(e)).toList();
        error.value = '';
      } else {
        error.value = 'Failed to load sale ads: \\${response.statusCode}';
        saleAds.clear();
      }
    } catch (e) {
      isLoading.value = false;
      error.value = 'Error: $e';
      saleAds.clear();
    }
  }

  Future<http.Response> initiateOrder(
    Map<String, dynamic> data,
  ) async {
    final token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/orders/initiate-order'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> aadharVerifyOtp(Map<String, dynamic> data) async {
    final token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/kyc/verify-otp'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  }
}
