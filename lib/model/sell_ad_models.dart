class SellAdResponse {
  final String cropType;
  final String variety;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? approxQuantity;
  final String? quantityType;
  final int minPriceApprox;
  final int totalCostApprox;
  final List<String> productImages;
  final List<String> location;
  final List<OtherFeature>? otherFeatures;
  final bool? mitraVerification;

  SellAdResponse({
    required this.cropType,
    required this.variety,
    this.startDate,
    this.endDate,
    this.approxQuantity,
    this.quantityType,
    required this.minPriceApprox,
    required this.totalCostApprox,
    this.productImages = const [],
    required this.location,
    this.otherFeatures,
    this.mitraVerification,
  });

  factory SellAdResponse.fromJson(Map<String, dynamic> json) {
    return SellAdResponse(
      cropType: json['crop_type'] ?? '',
      variety: json['variety'] ?? '',
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'])
          : null,
      endDate:
          json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      approxQuantity: json['approx_quantity'],
      quantityType: json['quantity_type'],
      minPriceApprox: json['min_price_approx'] ?? 0,
      totalCostApprox: json['total_cost_approx'] ?? 0,
      productImages: List<String>.from(json['product_images'] ?? []),
      location: List<String>.from(json['location'] ?? []),
      otherFeatures: json['other_features'] != null
          ? (json['other_features'] as List)
              .map((e) => OtherFeature.fromJson(e))
              .toList()
          : null,
      mitraVerification: json['mitra_verification'],
    );
  }

  Map<String, dynamic> toJson() => {
        'crop_type': cropType,
        'variety': variety,
        'start_date': startDate?.toUtc().toIso8601String(),
        'end_date': endDate?.toUtc().toIso8601String(),
        'approx_quantity': approxQuantity,
        'quantity_type': quantityType,
        'min_price_approx': minPriceApprox,
        'total_cost_approx': totalCostApprox,
        'product_images': productImages,
        'location': location,
        'other_features': otherFeatures?.map((e) => e.toJson()).toList(),
        'mitra_verification': mitraVerification,
      };
}

class OtherFeature {
  final String name;
  final String selectedValue;

  OtherFeature({required this.name, required this.selectedValue});

  factory OtherFeature.fromJson(Map<String, dynamic> json) {
    return OtherFeature(
      name: json['name'] ?? '',
      selectedValue: json['selected_value'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'selected_value': selectedValue,
      };
}
