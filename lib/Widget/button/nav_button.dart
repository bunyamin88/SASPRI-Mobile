import 'package:flutter/material.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';

class NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const NavButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    // warna normal
    const normalBackground = ColorPallate.background2;
    const normalForeground = ColorPallate.buttonPrimary;

    // warna saat aktif (ditukar)
    final backgroundColor =
        isActive ? normalForeground : normalBackground;

    final foregroundColor =
        isActive ? normalBackground : normalForeground;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 20),


          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),

          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(
                icon,
                size: 22,
                color: foregroundColor,
              ),

              const SizedBox(height: 1),

              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,

                style: TextStyle(
                  fontSize: 11,
                  height: 1,
                  fontWeight: FontWeight.w700,
                  color: foregroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}