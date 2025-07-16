class SellAdResponse {
  final String cropType;
  final String? cropName;
  final String variety;
  final String? varietyName;
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
  final DateTime? createdAt;
  final String? buyId;

  SellAdResponse({
    required this.cropType,
    this.cropName,
    required this.variety,
    this.varietyName,
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
    this.createdAt,
    this.buyId,
  });

  factory SellAdResponse.fromJson(Map<String, dynamic> json) {
    return SellAdResponse(
      cropType: json['crop_type'] ?? '',
      cropName: json['crop_name'] ?? json['cropTypeName'] ?? null,
      variety: json['variety'] ?? '',
      varietyName: json['variety_name'] ?? null,
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
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      buyId: json['buyId'] ?? json['_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'crop_type': cropType,
        'crop_name': cropName,
        'variety': variety,
        'variety_name': varietyName,
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
        'createdAt': createdAt?.toUtc().toIso8601String(),
        'buyId': buyId,
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
