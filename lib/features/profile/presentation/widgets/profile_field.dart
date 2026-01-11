import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class ProfileField extends StatelessWidget {
  final String label;
  final String value;
  final bool isEditable;

  const ProfileField({
    required this.label,
    required this.value,
    super.key,
    this.isEditable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: TextField(
        controller: TextEditingController(text: value),
        style: TextStyle(
          fontSize: 16,
          color: AppColors.surface5,
          fontWeight: FontWeight.w500,
        ),
        enabled: isEditable,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
