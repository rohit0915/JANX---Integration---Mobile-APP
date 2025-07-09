import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class SaleAdService extends GetxController {
  final box = GetStorage();
  Future<http.Response> getSalesAds() async {
    final token = box.read('token');
    final response = await http.get(
      Uri.parse('$baseUrl/sell-ad/active'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<http.Response> initiateOrder(
      Map<String, dynamic> data, ) async {
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
}
