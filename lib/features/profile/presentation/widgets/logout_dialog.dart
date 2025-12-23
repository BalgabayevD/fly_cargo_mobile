import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_event.dart';
import 'package:go_router/go_router.dart';

void logoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Выход'),
      content: const Text('Вы уверены, что хотите выйти?'),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Отмена'),
        ),
        TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(const AuthLogout());
            context.pop();
            context.pop();
          },
          child: Text(
            'Выйти',
            style: TextStyle(color: AppColors.danger),
          ),
        ),
      ],
    ),
  );
}
