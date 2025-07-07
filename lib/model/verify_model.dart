class VerifyOtpModel {
  final String phoneNumber;
  final String otp;

  VerifyOtpModel({
    required this.phoneNumber,
    required this.otp,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone_number': phoneNumber,
      'otp': otp,
    };
  }
}
