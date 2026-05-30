import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/card/vertical_card.dart';
import 'package:saspri_mobile/helper/enum.dart';

class FeatureItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final List<UserRole> allowedRoles;

  const FeatureItem({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.allowedRoles,
  });
}

class RegionChoice extends StatelessWidget {
  final UserRole role;

  const RegionChoice({
    super.key,
    this.role = UserRole.guest,
  });

  static final List<FeatureItem> features = [
    FeatureItem(
      icon: Icons.home,
      label: "Dashboard",
      onTap: () {},
      allowedRoles: [
        UserRole.guest,
        UserRole.member,
        UserRole.rep,
        UserRole.admin,
      ],
    ),

    FeatureItem(
      icon: Icons.person,
      label: "Profile",
      onTap: () {},
      allowedRoles: [
        UserRole.member,
        UserRole.rep,
        UserRole.admin,
      ],
    ),

    FeatureItem(
      icon: Icons.admin_panel_settings,
      label: "Admin Panel",
      onTap: () {},
      allowedRoles: [
        UserRole.admin,
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {

    final visibleFeatures = features.where(
      (feature) => feature.allowedRoles.contains(role),
    );

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: visibleFeatures.map((feature) {
        return VerticalCard(
          icon: feature.icon,
          label: feature.label,
          onTap: feature.onTap,
        );
      }).toList(),
    );
  }
}