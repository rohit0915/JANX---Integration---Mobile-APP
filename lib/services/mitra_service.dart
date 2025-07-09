import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class MitraService extends GetxController {
  final box = GetStorage();
  Future<http.Response> getMitraProfile() async {
  final token = box.read('token');

    final response = await http.get(
      Uri.parse('$baseUrl/mitra'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<http.Response> createMitraProfile(
      Map<String, dynamic> data, ) async {
         final token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/mitra/create'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> updateMitra(
      Map<String, dynamic> data, ) async {
         final token = box.read('token');
    final response = await http.put(
      Uri.parse('$baseUrl/users/update-mitra'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> updateMitraAccess(
      Map<String, dynamic> data, ) async {
         final token = box.read('token');
    final response = await http.put(
      Uri.parse('$baseUrl/users/update-mitra-access'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> getMitraClients() async {
     final token = box.read('token');
    final response = await http.get(
      Uri.parse('$baseUrl/users/mitra/clients'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }
}
