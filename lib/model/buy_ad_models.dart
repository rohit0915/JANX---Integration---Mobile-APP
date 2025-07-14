class BuyAdRequest {
  final String cropType;
  final String variety;
  final int quantity;
  final String location;

  BuyAdRequest({
    required this.cropType,
    required this.variety,
    required this.quantity,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
        'crop_type': cropType,
        'variety': variety,
        'quantity': quantity,
        'location': location,
      };
}

class BuyAdResponse {
  final String? cropType;
  final String? variety;
  final int? quantity;
  final List<String>? location;

  BuyAdResponse({
    this.cropType,
    this.variety,
    this.quantity,
    this.location,
  });

  factory BuyAdResponse.fromJson(Map<String, dynamic> json) {
    return BuyAdResponse(
      cropType: json['crop_type'] as String?,
      variety: json['variety'] as String?,
      quantity: json['quantity'] is int
          ? json['quantity']
          : int.tryParse(json['quantity']?.toString() ?? ''),
      location: (json['location'] is List)
          ? List<String>.from(json['location'].map((e) => e.toString()))
          : (json['location'] is String && json['location'].isNotEmpty)
              ? [json['location']]
              : null,
    );
  }
}
