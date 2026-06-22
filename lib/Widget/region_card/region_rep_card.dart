import 'package:flutter/material.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';

class RegionRepCard extends StatelessWidget {
  final String initial;
  final String name;
  final String code;
  final String submissionDate;
  final String status;
  final bool isRejected;
  final VoidCallback? onTap;

  const RegionRepCard({
    super.key,
    required this.initial,
    required this.name,
    required this.code,
    required this.submissionDate,
    required this.status,
    required this.isRejected,
    this.onTap,
  });

  Color _getGradeColor() {
    if (isRejected) {
      return ColorPallate.danger;
    }

    final grade = initial.trim().toLowerCase();

    if (grade.isEmpty || grade == "-") {
      return ColorPallate.buttonPrimary;
    }

    switch (grade) {
      case "a":
      case "ab":
      case "b":
        return ColorPallate.green;

      case "bc":
      case "c":
        return ColorPallate.warning;

      default:
        return ColorPallate.buttonPrimary;
    }
  }

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
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: _getGradeColor(),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            initial.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          mainAxisSize:
                              MainAxisSize.min,
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              name.toUpperCase(),
                              softWrap: true,
                              overflow:
                                  TextOverflow.visible,
                              style:
                                  const TextStyle(
                                fontSize: 16,
                              ),
                            ),

                            Text(
                              code,
                              style:
                                  const TextStyle(
                                fontSize: 14,
                              ),
                            ),

                            Text(
                              "Pengajuan : $submissionDate",
                              style:
                                  const TextStyle(
                                fontSize: 12,
                                color:
                                    Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 100,
                  child: Text(
                    status,
                    textAlign: TextAlign.right,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 14,
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