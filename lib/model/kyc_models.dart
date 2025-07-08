class AadharRequest {
  final String aadharNumber;
  AadharRequest({required this.aadharNumber});
  Map<String, dynamic> toJson() => {'aadhar_number': aadharNumber};
}

class AadharVerifyOtpRequest {
  final String otp;
  AadharVerifyOtpRequest({required this.otp});
  Map<String, dynamic> toJson() => {'otp': otp};
}

class PanCardRequest {
  final String documentUrl;
  PanCardRequest({required this.documentUrl});
  Map<String, dynamic> toJson() => {'document_url': documentUrl};
}

class BusinessDetailsRequest {
  final String gstNumber;
  final String tradeName;
  final String address;
  final String pincode;
  final String city;
  final String state;
  final String district;
  final String alternateMobileNumber;
  final String addressProofImageUrl;

  BusinessDetailsRequest({
    required this.gstNumber,
    required this.tradeName,
    required this.address,
    required this.pincode,
    required this.city,
    required this.state,
    required this.district,
    required this.alternateMobileNumber,
    required this.addressProofImageUrl,
  });

  Map<String, dynamic> toJson() => {
        'business_details': {
          'gst_number': gstNumber,
          'trade_name': tradeName,
          'address': address,
          'pincode': pincode,
          'city': city,
          'state': state,
          'district': district,
          'alternate_mobile_number': alternateMobileNumber,
          'address_proof_image_url': addressProofImageUrl,
        }
      };
}


class KycProfileResponse {
  KycProfileResponse();
  factory KycProfileResponse.fromJson(Map<String, dynamic> json) {
    return KycProfileResponse();
  }
}
