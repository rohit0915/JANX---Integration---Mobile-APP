import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jan_x/model/trade_settlement_models.dart';

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class TradeSettlementService extends GetxController {
  final box = GetStorage();
  var isLoading = false.obs;
  var settlements = <TradeSettlementResponse>[].obs;
  var error = ''.obs;

  Future<void> getTradeSettlement() async {
    final token = box.read('token');
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/trade-settlement'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print('Response body: $responseBody');
        final data = responseBody['data'];
        if (data != null && data is List) {
          settlements.value =
              data.map((e) => TradeSettlementResponse.fromJson(e)).toList();
          error.value = '';
        } else {
          error.value = 'No trade settlements found.';
          settlements.clear();
        }
      } else {
        error.value = 'Failed to load settlements: ${response.statusCode}';
        settlements.clear();
      }
    } catch (e) {
      isLoading.value = false;
      error.value = 'Error: $e';
      settlements.clear();
    }
  }

  Future<http.Response> updateTradeDetails(
    String tradeId,
    Map<String, dynamic> data,
  ) async {
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
