class SellAdRequest {
  final String cropType;
  final String variety;
  final String startDate;
  final String endDate;
  final int approxQuantity;
  final String quantityType;
  final int minPriceApprox;
  final int totalCostApprox;
  final List<String> productImages;
  final List<String> location;
  final List<Feature> otherFeatures;
  final bool mitraVerification;

  SellAdRequest({
    required this.cropType,
    required this.variety,
    required this.startDate,
    required this.endDate,
    required this.approxQuantity,
    required this.quantityType,
    required this.minPriceApprox,
    required this.totalCostApprox,
    required this.productImages,
    required this.location,
    required this.otherFeatures,
    required this.mitraVerification,
  });

  Map<String, dynamic> toJson() => {
        'crop_type': cropType,
        'variety': variety,
        'start_date': startDate,
        'end_date': endDate,
        'approx_quantity': approxQuantity,
        'quantity_type': quantityType,
        'min_price_approx': minPriceApprox,
        'total_cost_approx': totalCostApprox,
        'product_images': productImages,
        'location': location,
        'other_features': otherFeatures.map((e) => e.toJson()).toList(),
        'mitra_verification': mitraVerification,
      };
}

class Feature {
  final String name;
  final String selectedValue;

  Feature({required this.name, required this.selectedValue});

  Map<String, dynamic> toJson() => {
        'name': name,
        'selected_value': selectedValue,
      };
}


class SellAdResponse {
  
  SellAdResponse();
  factory SellAdResponse.fromJson(Map<String, dynamic> json) {

    return SellAdResponse();
  }
}
