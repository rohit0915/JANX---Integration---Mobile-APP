class LoginModel {
  final String name;
  final String phoneNumber;

  const LoginModel({
    required this.name,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone_number': phoneNumber, 
    };
  }
}
