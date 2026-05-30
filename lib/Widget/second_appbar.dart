import 'package:flutter/material.dart';

class SecondaryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const SecondaryAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: 72,
      backgroundColor: const Color(0xFF4C4FFF),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8),
        ),
      ),

      titleSpacing: 0,

      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            /// BACK BUTTON
            IconButton(
              onPressed:
                  onBackPressed ??
                  () => Navigator.of(context).maybePop(),
              splashRadius: 22,
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),

            const SizedBox(width: 8),

            /// TITLE
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}