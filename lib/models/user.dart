import 'package:saspri_mobile/helper/enum.dart';

class User {
  final String name;
  final UserRole role;
  String? email;
  String? phoneNumber;
  
  User({
    required this.name,
    required this.role,
    this.email,
    this.phoneNumber,
  });
}