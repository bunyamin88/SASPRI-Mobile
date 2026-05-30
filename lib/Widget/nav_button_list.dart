import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/button/nav_button.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';
import 'package:saspri_mobile/helper/enum.dart';
import 'package:saspri_mobile/models/nav_items.dart';

class NavButtonList extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChanged;
  final UserRole role;
  final List<NavItem> navItems = const [
  NavItem(
    icon: Icons.home,
    label: "Beranda",
    index: 0,
    allowedRoles: [UserRole.admin, UserRole.member, UserRole.rep, UserRole.guest],
  ),

  NavItem(
    icon: Icons.person,
    label: "Kawasan",
    index: 1,
    allowedRoles: [UserRole.member, UserRole.rep,],
  ),

  NavItem(
    icon: Icons.settings,
    label: "Sertifikat",
    index: 2,
    allowedRoles: [UserRole.member, UserRole.rep,],
  ),

  NavItem(
    icon: Icons.person,
    label: "Verifikasi",
    index: 3,
    allowedRoles: [UserRole.admin],
  ),
  
  NavItem(
    icon: Icons.person,
    label: "Sertifikasi",
    index: 4,
    allowedRoles: [UserRole.admin],
  ),

  NavItem(
    icon: Icons.person,
    label: "Profil",
    index: 5,
    allowedRoles: [UserRole.admin, UserRole.member, UserRole.rep,],
  ),

  NavItem(
    icon: Icons.person,
    label: "Login",
    index: 6,
    allowedRoles: [UserRole.guest],
  ),
  
];

  const NavButtonList({
    super.key,
    required this.currentIndex,
    required this.onChanged,
    required this.role,
  });

 @override
  Widget build(BuildContext context) {

    final filteredItems = navItems
        .where((item) => item.allowedRoles.contains(role))
        .toList();

    return Container(
      height: 79,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: ColorPallate.background2,
        borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: filteredItems.map((item) {
          return NavButton(
            icon: item.icon,
            label: item.label,
            isActive: currentIndex == item.index,
            onTap: () => onChanged(item.index),
          );
        }).toList(),
      ),
    );
  }
}