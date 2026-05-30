import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/card/vertical_card.dart';
import 'package:saspri_mobile/helper/enum.dart';
import 'package:saspri_mobile/models/feature_item.dart';

class FeatureGrid extends StatelessWidget {
  final UserRole role;
  final List<FeatureItem> features;

  const FeatureGrid({
    super.key,
    required this.role,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    final visibleFeatures = features.where(
      (feature) => feature.canAccess(role),
    );

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: visibleFeatures.map((feature) {
        return VerticalCard(
          icon: feature.icon,
          label: feature.label,
          page : feature.page,
        );
      }).toList(),
    );
  }
}