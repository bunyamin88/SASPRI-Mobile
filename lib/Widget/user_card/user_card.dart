import 'package:flutter/material.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';
import 'package:saspri_mobile/helper/enum.dart';

class UserCard extends StatelessWidget {
  final String? labelLeft;
  final String textLeft1;
  final String textLeft2;
  final String? textLeft3;

  final String? textRight1;
  final String? textRight2;

  final IconData? iconright;
  final ApprovalStatus? status;

  final VoidCallback? onTap;

  const UserCard({
    super.key,
    this.labelLeft,
    required this.textLeft1,
    required this.textLeft2,
    this.textLeft3,
    this.textRight1,
    this.textRight2,
    this.iconright,
    this.status,
    this.onTap,
  });

  Widget statusBadge({
  required String text,
  required Color color,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 6,
    ),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          minHeight: 70,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFF6B78B9),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// LEFT SECTION
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// AVATAR
                  if (labelLeft != null) ...[
                    Container(
                      width: 45,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFF6B78B9),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        labelLeft!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 24,
                          height: 29 / 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),
                  ],

                  /// TEXT INFO
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// TITLE
                        Text(
                          textLeft1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            height: 22 / 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 2),

                        /// REGION
                        Text(
                          textLeft2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            height: 15 / 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),

                        /// SUBMISSION DATE
                        if (textLeft3 != null) ...[
                          const SizedBox(height: 2),

                          Text(
                            '$textLeft3',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              height: 15 / 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// RIGHT SECTION TEXT
            if (textRight1 != null || textRight2 != null) ...[
              const SizedBox(width: 12),

              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// RIGHT TITLE
                  if (textRight1 != null)
                    Text(
                      textRight1!,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        height: 22 / 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),

                  /// SPACE
                  if (textRight1 != null && textRight2 != null)
                    const SizedBox(height: 4),

                  /// STATUS
                  if (textRight2 != null)
                    SizedBox(
                      width: 80,
                      child: Text(
                        textRight2!,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          height: 15 / 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                ],
              ),
            ],
            // RIGHT SECTION ICON
            if (iconright != null) ...[
              
              Icon(iconright, color: ColorPallate.buttonPrimary,)
                
              
            ],
            if (status != null)
            
              switch (status) {
                ApprovalStatus.pending => statusBadge(
                  text: "Menunggu",
                  color: ColorPallate.warning,
                ),

                ApprovalStatus.approved => statusBadge(
                  text: "Disetujui",
                  color: ColorPallate.primary,
                ),

                ApprovalStatus.rejected => statusBadge(
                  text: "Ditolak",
                  color: ColorPallate.danger,
                ),

                _ => const SizedBox(),
              },
          ],
        ),
      ),
    );
  }
}