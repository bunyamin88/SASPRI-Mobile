import 'package:flutter/material.dart';
import 'package:saspri_mobile/helper/enum.dart';

class NavItem {
  final IconData icon;
  final String label;
  final int index;
  final List<UserRole> allowedRoles;

  const NavItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.allowedRoles,
  });
}

