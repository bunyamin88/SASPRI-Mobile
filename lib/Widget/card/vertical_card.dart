import 'package:flutter/material.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';

class VerticalCard extends StatelessWidget {
  IconData icon;
  String label;
  Color backgroundColor;
  Color iconColor;
  Color textColor;
  VoidCallback? onTap;
  Widget page;

  VerticalCard({
    super.key,
    required this.icon,
    required this.label,
    this.backgroundColor = Colors.white,
    this.iconColor = ColorPallate.buttonPrimary,
    this.textColor = ColorPallate.black,
    this.onTap,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: ColorPallate.grey,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => page,
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 32,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width : 100,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
