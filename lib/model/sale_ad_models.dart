class InitiateOrderRequest {
  final String sellAdId;
  final String addressId;

  InitiateOrderRequest({required this.sellAdId, required this.addressId});

  Map<String, dynamic> toJson() => {
        'sell_ad_id': sellAdId,
        'address_id': addressId,
      };
}

