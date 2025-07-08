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
