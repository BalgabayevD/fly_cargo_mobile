import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:heroicons/heroicons.dart';

class CreateOrdersDelivery extends StatelessWidget {
  const CreateOrdersDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: BeButton(
        text: 'Условия доставки',
        onPressed: () {},
        size: .sm,
        variant: .light,
        color: .info,
      ),
    );
  }
}

class CreateOrdersNotifications extends StatelessWidget {
  const CreateOrdersNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 14),
      child: IconButton(
        onPressed: () {},
        icon: HeroIcon(
          HeroIcons.bell,
          color: BeColors.surface4,
        ),
      ),
    );
  }
}
