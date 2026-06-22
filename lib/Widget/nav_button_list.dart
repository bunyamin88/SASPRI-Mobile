import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/button/nav_button.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';
import 'package:saspri_mobile/helper/enum.dart';
import 'package:saspri_mobile/models/nav_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saspri_mobile/providers/auth_provider.dart';



class NavButtonList
    extends ConsumerWidget {

  final int currentIndex;
  final Function(int) onChanged;
  final List<NavItem> navItems = const [
  NavItem(
    icon: Icons.home,
    label: "Beranda",
    index: 0,
    allowedRoles: [UserRole.admin, UserRole.member, UserRole.coor, UserRole.guest],
  ),

  NavItem(
    icon: Icons.person,
    label: "Kawasan",
    index: 1,
    allowedRoles: [UserRole.member, UserRole.coor,],
    requiresRegion: true,
  ),

  NavItem(
    icon: Icons.settings,
    label: "Sertifikat",
    index: 2,
    allowedRoles: [UserRole.member, UserRole.coor,],
    requiresRegion: true,
  ),
  
  NavItem(
    icon: Icons.person,
    label: "Aktivitas",
    index: 3,
    allowedRoles: [UserRole.admin],
  ),

  NavItem(
    icon: Icons.person,
    label: "Profil",
    index: 4,
    allowedRoles: [UserRole.admin, UserRole.member, UserRole.coor,],
  ),

  NavItem(
    icon: Icons.person,
    label: "Login",
    index: 5,
    allowedRoles: [UserRole.guest],
  ),
  
];

  const NavButtonList({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {

    final auth =
        ref.watch(authProvider);

    final user = auth.user;

    final role =
        user?.role ??
        UserRole.guest;

    final filteredItems =
        navItems.where((item) {

      if (
        !item.allowedRoles.contains(
          role,
        )
      ) {
        return false;
      }

      if (
        item.requiresRegion &&
        user?.saspriKId == null
      ) {
        return false;
      }

      return true;

    }).toList();

    return Container(
      height: 79,
      padding:
          const EdgeInsets.all(8),
      decoration:
          const BoxDecoration(
        color:
            ColorPallate.background2,
        borderRadius:
            BorderRadius.vertical(
          top: Radius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment
                .spaceEvenly,
        children:
            filteredItems.map(
          (item) {
            return NavButton(
              icon: item.icon,
              label: item.label,
              isActive:
                  currentIndex ==
                      item.index,
              onTap: () =>
                  onChanged(
                item.index,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}