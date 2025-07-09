import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jan_x/auth/signIn_screen.dart';
import 'package:jan_x/model/login_model.dart';
import 'package:jan_x/model/verify_model.dart';
import 'package:get_storage/get_storage.dart';

const baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';
const sentOtpUrl = '$baseUrl/auth/send-otp';
const verifyOtpUrl = '$baseUrl/auth/verify-otp';
const logoutUrl = '$baseUrl/auth/logout';

class AuthServices extends GetxController {
  final box = GetStorage();

  Future<http.Response> sendOtp({
    required String name,
    required String phoneNumber,
  }) async {
    final loginModel = LoginModel(
      name: name,
      phoneNumber: phoneNumber,
    );

    final response = await http.post(
      Uri.parse(sentOtpUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginModel.toJson()),
    );

    if (response.statusCode == 200) {
      
      print('OTP sent successfully');
      print('OTP Response: ${response.body}');
      return response;
    } else {
      print('Failed to send OTP. Response: ${response.body}');
      throw Exception('Failed to send OTP');
    }
  }

  Future<http.Response> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    final verifyModel = VerifyOtpModel(phoneNumber: phoneNumber, otp: otp);

    final response = await http.post(
      Uri.parse(verifyOtpUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(verifyModel.toJson()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token']; 
      if (token != null) {
        box.write('token', token);
      }
      print('OTP verified successfully');
      print('Verify Response: ${response.body}');
      return response;
    } else {
      print('Failed to verify OTP. Response: ${response.body}');
      throw Exception('Failed to verify OTP');
    }
  }

  Future<void> logout() async {
    final token = box.read('token');
    final response = await http.post(
      Uri.parse(logoutUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.offAll(SignInScreen());
    } else {
      print("Somthig went wrong");
    }
  }
}
