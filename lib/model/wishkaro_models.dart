class WishlistAddRequest {
  final String adId;
  final String adType;

  WishlistAddRequest({required this.adId, required this.adType});

  Map<String, dynamic> toJson() => {
        'ad_id': adId,
        'ad_type': adType,
      };
}

// Placeholder for WishlistResponse (structure depends on API response)
class WishlistResponse {
  final String? adId;
  final String? adType;
  final String? cropType;
  final String? variety;
  final int? quantity;
  final List<String>? location;

  WishlistResponse({
    this.adId,
    this.adType,
    this.cropType,
    this.variety,
    this.quantity,
    this.location,
  });

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse(
      adId: json['ad_id'] as String?,
      adType: json['ad_type'] as String?,
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
