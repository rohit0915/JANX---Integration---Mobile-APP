import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://ramraj-janx-backend-code.vercel.app/api';

class BuyAdService extends GetxController{
  Future<http.Response> getBuyAds(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/buy-ad/active'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

}
