import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class ProfileService extends GetxController {
  Future<http.Response> getProfile(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<http.Response> editProfile(
      Map<String, dynamic> data, String token) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/edit-profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> deactivateProfile(String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/users/deactivate'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }
}
