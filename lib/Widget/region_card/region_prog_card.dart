import 'package:flutter/material.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';

class RegionProgressCard extends StatelessWidget {
  final String regionName;
  final String repName;
  final String level;
  final String status;
  final String submissionDate;
  final VoidCallback? onPressed;
  final String buttonText;
  final VoidCallback? onTap;

  const RegionProgressCard({
    super.key,
    required this.regionName,
    required this.submissionDate,
    required this.repName,
    required this.level,
    required this.status,
    this.onPressed,
    this.buttonText = "Setuju",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF6B78B9),
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: ColorPallate.grey,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap ?? onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              spacing: 12,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// LEFT SECTION
                    Expanded(
                      child: Row(
                        children: [
                          /// USER INFO
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  regionName,
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  level,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  repName,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          /// DEADLINE SECTION
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tenggat :",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  height: 15 / 12,
                                  color: ColorPallate.grey,
                                ),
                              ),
                              Text(
                                submissionDate,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  height: 15 / 12,
                                  color: ColorPallate.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// STATUS
                    SizedBox(
                      child: Icon(
                        Icons.info,
                        size: 24,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}