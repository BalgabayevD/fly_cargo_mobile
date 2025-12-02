import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/design_system/examples/widgets/buttons_section.dart';
import 'package:fly_cargo/core/design_system/examples/widgets/cards_section.dart';
import 'package:fly_cargo/core/design_system/examples/widgets/colors_section.dart';
import 'package:fly_cargo/core/design_system/examples/widgets/gradients_section.dart';
import 'package:fly_cargo/core/design_system/examples/widgets/inputs_section.dart';
import 'package:fly_cargo/core/design_system/examples/widgets/showcase_section.dart';
import 'package:fly_cargo/core/design_system/examples/widgets/switches_section.dart';
import 'package:fly_cargo/core/design_system/examples/widgets/typography_section.dart';

class DesignSystemShowcase extends StatefulWidget {
  const DesignSystemShowcase({super.key});

  @override
  State<DesignSystemShowcase> createState() => _DesignSystemShowcaseState();
}

class _DesignSystemShowcaseState extends State<DesignSystemShowcase> {
  bool _isSelected = false;
  bool _switchValue = false;
  bool _checkboxValue = false;
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Дизайн-система Fly Cargo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        children: [
          ShowcaseSection(
            title: 'Цветовая палитра',
            child: const ColorsSection(),
          ),
          ShowcaseSection(
            title: 'Типография',
            child: const TypographySection(),
          ),
          ShowcaseSection(
            title: 'Кнопки',
            child: const ButtonsSection(),
          ),
          ShowcaseSection(
            title: 'Карточки',
            child: CardsSection(
              isSelected: _isSelected,
              onSelectionChanged: (value) =>
                  setState(() => _isSelected = value),
            ),
          ),
          ShowcaseSection(
            title: 'Поля ввода',
            child: const InputsSection(),
          ),
          ShowcaseSection(
            title: 'Переключатели',
            child: SwitchesSection(
              switchValue: _switchValue,
              checkboxValue: _checkboxValue,
              sliderValue: _sliderValue,
              onSwitchChanged: (value) => setState(() => _switchValue = value),
              onCheckboxChanged: (value) =>
                  setState(() => _checkboxValue = value),
              onSliderChanged: (value) => setState(() => _sliderValue = value),
            ),
          ),
          ShowcaseSection(
            title: 'Градиенты',
            child: const GradientsSection(),
          ),
        ],
      ),
    );
  }
}
