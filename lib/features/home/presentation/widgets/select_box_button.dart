import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
class SelectBoxButton extends StatelessWidget {
  final VoidCallback onTap;
  const SelectBoxButton({required this.onTap, super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Выбрать', style: AppTypography.buttonLarge),
          ),
        ),
      ),
    );
  }
}
