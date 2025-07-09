import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class TradeSettlementService extends GetxController {
  final box = GetStorage();
  Future<http.Response> getTradeSettlement() async {
    final token = box.read('token');
    final response = await http.get(
      Uri.parse('$baseUrl/trade-settlement'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<http.Response> updateTradeDetails(
      String tradeId, Map<String, dynamic> data, ) async {
        final token = box.read('token');
    final response = await http.put(
      Uri.parse('$baseUrl/trade-settlement/$tradeId/trade-details'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> generateBill(String tradeId) async {
    final token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/trade-settlement/$tradeId/generate-bill'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }
}
