import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

/// Секция демонстрации полей ввода
class InputsSection extends StatelessWidget {
  const InputsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'Обычное поле',
            hintText: 'Введите текст',
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        const TextField(
          decoration: InputDecoration(
            labelText: 'С префиксной иконкой',
            hintText: 'Введите email',
            prefixIcon: Icon(Icons.email),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        const TextField(
          decoration: InputDecoration(
            labelText: 'С суффиксной иконкой',
            hintText: 'Введите пароль',
            suffixIcon: Icon(Icons.visibility),
          ),
          obscureText: true,
        ),
        const SizedBox(height: AppSpacing.md),
        const TextField(
          decoration: InputDecoration(
            labelText: 'С ошибкой',
            hintText: 'Введите текст',
            errorText: 'Это поле обязательно',
          ),
        ),
      ],
    );
  }
}

