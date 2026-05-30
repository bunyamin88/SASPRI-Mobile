import 'package:flutter/material.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';

class RegionRepCard extends StatelessWidget {
  final String initial;
  final String name;
  final String code;
  final String submissionDate;
  final String status;
  final VoidCallback? onTap;

  const RegionRepCard({
    super.key,
    required this.initial,
    required this.name,
    required this.code,
    required this.submissionDate,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPallate.background2,
        border: Border.all(
          color: ColorPallate.buttonPrimary,
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
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// LEFT SECTION
                Expanded(
                  child: Row(
                    children: [
                      /// AVATAR
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Color(0xFF6B78B9),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            initial,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      /// USER INFO
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              code,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Pengajuan : $submissionDate",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// STATUS
                SizedBox(
                  width: 90,
                  child: Text(
                    status,
                    textAlign: TextAlign.right,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
