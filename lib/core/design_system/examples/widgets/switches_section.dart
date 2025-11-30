import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

/// Секция демонстрации переключателей
class SwitchesSection extends StatelessWidget {
  final bool switchValue;
  final bool checkboxValue;
  final double sliderValue;
  final ValueChanged<bool> onSwitchChanged;
  final ValueChanged<bool> onCheckboxChanged;
  final ValueChanged<double> onSliderChanged;

  const SwitchesSection({
    required this.switchValue,
    required this.checkboxValue,
    required this.sliderValue,
    required this.onSwitchChanged,
    required this.onCheckboxChanged,
    required this.onSliderChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Switch'),
            Switch(
              value: switchValue,
              onChanged: onSwitchChanged,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            Checkbox(
              value: checkboxValue,
              onChanged: (value) => onCheckboxChanged(value ?? false),
            ),
            const Text('Checkbox'),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Slider: ${sliderValue.round()}'),
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              onChanged: onSliderChanged,
            ),
          ],
        ),
      ],
    );
  }
}

