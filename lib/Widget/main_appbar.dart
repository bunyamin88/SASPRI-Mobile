import 'package:flutter/material.dart';
import 'package:saspri_mobile/pages/feature/notification.dart';

class MainAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? name;
  final String role;
  final VoidCallback? onNotificationTap;

  const MainAppBar({
    super.key,
    this.name,
    required this.role,
    this.onNotificationTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: 75,

      backgroundColor: const Color(0xFF4C4FFF),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8),
        ),
      ),

      titleSpacing: 16,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LEFT CONTENT
          Expanded(
            child: Row(
              children: [
                /// PROFILE ICON
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 20,
                  ),
                ),

                const SizedBox(width: 12),

                /// TEXT
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (name != null)
                      Text(
                        name!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        role,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: name == null ? 16 : 12,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// NOTIFICATION BUTTON
          IconButton(
            splashRadius: 22,
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NotificationList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}