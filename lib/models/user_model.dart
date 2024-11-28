class User {
  final String id;
  final String mobileNumber;
  final int balance;
  final bool isVerified;
  final String role;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.mobileNumber,
    required this.balance,
    required this.isVerified,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      mobileNumber: json['mobileNumber'],
      balance: json['balance'],
      isVerified: json['isVerified'],
      role: json['role'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
