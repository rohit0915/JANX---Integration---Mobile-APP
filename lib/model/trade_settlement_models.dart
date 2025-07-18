class UpdateTradeDetailsRequest {
  final int weightedQuantity;
  final String grade;
  final int finalPricePerUnit;
  final int discount;

  UpdateTradeDetailsRequest({
    required this.weightedQuantity,
    required this.grade,
    required this.finalPricePerUnit,
    required this.discount,
  });

  Map<String, dynamic> toJson() => {
        'weighted_quantity': weightedQuantity,
        'grade': grade,
        'final_price_per_unit': finalPricePerUnit,
        'discount': discount,
      };
}


class TradeSettlementResponse {
  TradeSettlementResponse();
  factory TradeSettlementResponse.fromJson(Map<String, dynamic> json) {
    return TradeSettlementResponse();
  }
}
class TradeSettlementModel {
  final String adId;
  final String postedDate;
  final String cropName;
  final String varietyName;
  final String location;
  final int quantity;
  final String quantityType;
  final int minPrice;
  final int totalCost;
  final String description;
  final String orderId;
  final String orderDate;
  final String buyerName;
  final String buyerMobile;
  final String buyerAddress;
  final double buyerRating;

  TradeSettlementModel({
    required this.adId,
    required this.postedDate,
    required this.cropName,
    required this.varietyName,
    required this.location,
    required this.quantity,
    required this.quantityType,
    required this.minPrice,
    required this.totalCost,
    required this.description,
    required this.orderId,
    required this.orderDate,
    required this.buyerName,
    required this.buyerMobile,
    required this.buyerAddress,
    required this.buyerRating,
  });

  factory TradeSettlementModel.fromJson(Map<String, dynamic> json) {
    return TradeSettlementModel(
      adId: json['ad_id'] as String,
      postedDate: json['posted_date'] as String,
      cropName: json['crop_name'] as String,
      varietyName: json['variety_name'] as String,
      location: json['location'] as String,
      quantity: json['quantity'] as int,
      quantityType: json['quantity_type'] as String,
      minPrice: json['min_price'] as int,
      totalCost: json['total_cost'] as int,
      description: json['description'] as String,
      orderId: json['order_id'] as String,
      orderDate: json['order_date'] as String,
      buyerName: json['buyer_name'] as String,
      buyerMobile: json['buyer_mobile'] as String,
      buyerAddress: json['buyer_address'] as String,
      buyerRating: (json['buyer_rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'ad_id': adId,
        'posted_date': postedDate,
        'crop_name': cropName,
        'variety_name': varietyName,
        'location': location,
        'quantity': quantity,
        'quantity_type': quantityType,
        'min_price': minPrice,
        'total_cost': totalCost,
        'description': description,
        'order_id': orderId,
        'order_date': orderDate,
        'buyer_name': buyerName,
        'buyer_mobile': buyerMobile,
        'buyer_address': buyerAddress,
        'buyer_rating': buyerRating,
      };
}