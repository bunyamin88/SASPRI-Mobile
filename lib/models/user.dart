import '../helper/enum.dart';

class User {
  final int id;
  final String username;
  final String email;
  final String phoneNumber;
  final int? saspriKId;
  final UserRole role;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.saspriKId,
    required this.role,
  });

  factory User.fromJson(
    Map<String, dynamic> json,
  ) {
    return User(
      id: json['id'] as int,

      username:
          json['username'] as String,

      email:
          json['email'] as String,

      phoneNumber:
          json['phone_number'] as String,

      saspriKId:
          json['saspri_k_id'] as int?,

      role: UserRoleExtension.fromString(
        json['role']['item_name']
            as String,
      ),
    );
  }
}