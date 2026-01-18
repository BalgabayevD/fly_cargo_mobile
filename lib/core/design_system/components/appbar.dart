import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class BeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final bool? centerTitle;
  final bool automaticallyImplyLeading;
  final bool? isBorder;
  final Color appBarColor;
  final List<Widget>? actions;

  const BeAppBar({
    required this.title,
    super.key,
    this.actions,
    this.leading,
    this.centerTitle,
    this.automaticallyImplyLeading = true,
    this.isBorder = false,
    this.appBarColor = BeColors.none,
  });

  Widget? get _leading {
    if (automaticallyImplyLeading) {
      return leading ?? _Leading();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: isBorder != null && isBorder!
          ? Border(bottom: BorderSide(width: 1, color: BeColors.border))
          : null,
      leading: _leading,
      title: Text(title),
      centerTitle: centerTitle,
      systemOverlayStyle: .dark,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      backgroundColor: appBarColor,
      surfaceTintColor: BeColors.none,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}

class _Leading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: HeroIcon(HeroIcons.chevronLeft, style: HeroIconStyle.outline),
    );
  }
}
