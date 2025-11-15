import 'package:flutter/material.dart';

mixin MenuItemStyling {
  static const double iconSize = 20.0;
  static const double containerSize = 40.0;
  static const double borderRadius = 8.0;
  static const double trailingIconSize = 16.0;
  static const Color iconColor = Color(0xFF666666);
  static const Color trailingIconColor = Color(0xFFCCCCCC);
  static const Color containerColor = Color(0xFFF5F5F5);
}

class MenuItemWidget extends StatelessWidget with MenuItemStyling {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: MenuItemStyling.containerSize,
        height: MenuItemStyling.containerSize,
        decoration: BoxDecoration(
          color: MenuItemStyling.containerColor,
          borderRadius: BorderRadius.circular(MenuItemStyling.borderRadius),
        ),
        child: Icon(
          icon,
          color: MenuItemStyling.iconColor,
          size: MenuItemStyling.iconSize,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: MenuItemStyling.trailingIconSize,
        color: MenuItemStyling.trailingIconColor,
      ),
      onTap: onTap,
    );
  }
}
