import 'package:flutter/material.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';

class RegionAdminCard extends StatelessWidget {
  final String regionName;
  final String certBefore;
  final String certAfter;
  final String code;
  final String status;
  final String submissionDate;
  final VoidCallback? onTap;

  const RegionAdminCard({
    super.key,
    required this.regionName,
    required this.certBefore,
    required this.certAfter,
    required this.code,
    required this.status,
    required this.submissionDate,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorPallate.background2,
          border: Border.all(
            color: ColorPallate.buttonPrimary,
            width: 1,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// LEFT SECTION (Frame 158 -> Frame 154)
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Region Name (e.g. Cisarua, Bogor, Jawa Barat)
                  Text(
                    regionName,
                    softWrap: true,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      height: 17 / 14,
                      fontWeight: FontWeight.w400,
                      color: ColorPallate.black,
                    ),
                  ),
                  
                  
                  // Name Flow (e.g. Natalia -> Weania)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          certBefore,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            height: 17 / 14,
                            fontWeight: FontWeight.w400,
                            color: ColorPallate.black,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 18,
                          color: ColorPallate.black
                        ),
                      ),
                      Flexible(
                        child: Text(
                          certAfter,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            height: 17 / 14,
                            fontWeight: FontWeight.w400,
                            color: ColorPallate.black
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Code (e.g. 01.002.03)
                  Text(
                    code,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      height: 17 / 14,
                      fontWeight: FontWeight.w400,
                      color: ColorPallate.black
                    ),
                  ),
                ],
              ),
            ),

            /// RIGHT SECTION (Frame 155 -> Frame 176)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Status (e.g. Selesai - Lulus)
                Text(
                  status,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: ColorPallate.black
                  ),
                ),
                const SizedBox(height: 12),

                // Submission Date (e.g. 20-04-2027)
                Text(
                  submissionDate,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    height: 15 / 12,
                    fontWeight: FontWeight.w400,
                    color: ColorPallate.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
