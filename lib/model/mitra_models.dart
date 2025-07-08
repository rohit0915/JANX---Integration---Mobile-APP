class CreateMitraProfileRequest {
  final String accountType;
  final String industry;
  final String firstName;
  final String lastName;
  final String mobile;
  final String email;
  final String companyAddress;
  final String pincode;
  final String otherDetail;
  final String emergencyContact;
  final String passportSizePhoto;

  CreateMitraProfileRequest({
    required this.accountType,
    required this.industry,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.companyAddress,
    required this.pincode,
    required this.otherDetail,
    required this.emergencyContact,
    required this.passportSizePhoto,
  });

  Map<String, dynamic> toJson() => {
        'account_type': accountType,
        'industry': industry,
        'first_name': firstName,
        'last_name': lastName,
        'mobile': mobile,
        'email': email,
        'company_address': companyAddress,
        'pincode': pincode,
        'other_detail': otherDetail,
        'emergecny_contact': emergencyContact,
        'passport_size_photo': passportSizePhoto,
      };
}

class UpdateMitraRequest {
  final String mitraId;
  UpdateMitraRequest({required this.mitraId});
  Map<String, dynamic> toJson() => {'mitra_id': mitraId};
}

class UpdateMitraAccessRequest {
  final Map<String, bool> mitraAccess;
  UpdateMitraAccessRequest({required this.mitraAccess});
  Map<String, dynamic> toJson() => {'mitra_access': mitraAccess};
}


class MitraProfileResponse {
  MitraProfileResponse();
  factory MitraProfileResponse.fromJson(Map<String, dynamic> json) {
    return MitraProfileResponse();
  }
}
