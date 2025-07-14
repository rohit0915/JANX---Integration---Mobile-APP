import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class KycService extends GetxController {
  final box = GetStorage();
  Future<http.Response> getKycProfile() async {
    final token = box.read('token');
    final response = await http.get(
      Uri.parse('$baseUrl/kyc'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<http.Response> aadharRequest(
    Map<String, dynamic> data,
  ) async {
    final token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/kyc/aadhar-request'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> aadharVerifyOtp(
    Map<String, dynamic> data,
  ) async {
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

  Future<http.Response> addPanCard(
    Map<String, dynamic> data,
  ) async {
    final token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/kyc/pan-card'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.back();
    } else {
      Get.back();
    }
    return response;
  }

  Future<http.Response> updateBusinessDetails(
    Map<String, dynamic> data,
  ) async {
    final token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/kyc/business-details'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.back();
    } else {
      Get.back();
    }
    return response;
  }

  Future<http.Response> addBankDetails(Map<String, dynamic> data) async {
    final token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/kyc/bank-details'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    print(response.body);
    return response;
  }

  Future<http.Response> addSamagraDetails(
    Map<String, dynamic> data,
  ) async {
    final token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/kyc/samagra-details'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  }
}
