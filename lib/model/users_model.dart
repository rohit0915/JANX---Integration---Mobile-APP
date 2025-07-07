class UsersModel {
  final String name;
  final String location;
  final String phoneNumber;
  final String email;
  final String enterprise;
  const UsersModel({
    required this.name,
    required this.location,
    required this.phoneNumber,
    required this.email,
    required this.enterprise,
  });
  Map<String, dynamic> fromJson() {
    return {
      'name':name,
      'location':location,
      'phoneNumber':phoneNumber,
      'email':email,
      'enterprise':enterprise
    };
  }
}
