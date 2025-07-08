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
  WishlistResponse();
  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse();
  }
}
