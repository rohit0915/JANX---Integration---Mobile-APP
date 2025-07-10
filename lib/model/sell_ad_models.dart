class SellAdResponse {
  final String cropType;
  final String variety;
  final int minPriceApprox;
  final int totalCostApprox;
  final List<String> location;

  SellAdResponse({
    required this.cropType,
    required this.variety,
    required this.minPriceApprox,
    required this.totalCostApprox,
    required this.location,
  });

  factory SellAdResponse.fromJson(Map<String, dynamic> json) {
    return SellAdResponse(
      cropType: json['crop_type'] ?? '',
      variety: json['variety'] ?? '',
      minPriceApprox: json['min_price_approx'] ?? 0,
      totalCostApprox: json['total_cost_approx'] ?? 0,
      location: List<String>.from(json['location'] ?? []),
    );
  }
}