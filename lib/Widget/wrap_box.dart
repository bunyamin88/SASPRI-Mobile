import 'package:flutter/material.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';

class WrapBox extends StatelessWidget {
  final Widget child;
  const WrapBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: ColorPallate.background2,
                    border: Border.all(
                      color: ColorPallate.buttonPrimary,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: child,
    );
  }
}