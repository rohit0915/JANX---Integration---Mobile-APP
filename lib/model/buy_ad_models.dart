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
 
  BuyAdResponse();
  factory BuyAdResponse.fromJson(Map<String, dynamic> json) {

    return BuyAdResponse();
  }
}
