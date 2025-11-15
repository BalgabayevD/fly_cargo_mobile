import 'package:flutter/material.dart';

mixin PlaceholderItemStyling {
  static const double containerSize = 40.0;
  static const double borderRadius = 10.0;
}

class PlaceholderItemWidget extends StatelessWidget
    with PlaceholderItemStyling {
  const PlaceholderItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Настольный светильник'),
      subtitle: const Text('Атырау, просп. Абая, 94'),
      leading: Container(
        width: PlaceholderItemStyling.containerSize,
        height: PlaceholderItemStyling.containerSize,
        decoration: const BoxDecoration(
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.all(Radius.circular(PlaceholderItemStyling.borderRadius)),
        ),
      ),
    );
  }
}
