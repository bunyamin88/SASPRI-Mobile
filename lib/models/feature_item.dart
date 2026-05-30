import 'package:flutter/material.dart';
import 'package:saspri_mobile/helper/enum.dart';

class FeatureItem {
  final IconData icon;
  final String label;
  final List<UserRole> allowedRoles;
  final Widget page;

  const FeatureItem({
    required this.icon,
    required this.label,
    required this.page,
    required this.allowedRoles,
  });

  bool canAccess(UserRole role) {
    return allowedRoles.contains(role);
  }
}