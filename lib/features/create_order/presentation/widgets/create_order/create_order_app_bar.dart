import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:heroicons/heroicons.dart';

class CreateOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CreateOrderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      title: Text(
        context.l10n.home,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.surface5,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: HeroIcon(
            HeroIcons.questionMarkCircle,
            size: 24,
            color: AppColors.surface4,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Справка в разработке')),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
