class EditProfileRequest {
  final String email;
  final String address;
  final String pincode;
  final String upiId;

  EditProfileRequest({
    required this.email,
    required this.address,
    required this.pincode,
    required this.upiId,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'address': address,
        'pincode': pincode,
        'upi_id': upiId,
      };
}

// Placeholder for ProfileResponse (structure depends on API response)
class ProfileResponse {
  ProfileResponse();
  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse();
  }
}
