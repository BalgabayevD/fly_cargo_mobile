import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_event.dart';
import 'package:go_router/go_router.dart';

void logoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(context.l10n.logoutTitle),
      content: Text(context.l10n.logoutConfirmation),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(context.l10n.cancel),
        ),
        TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(const AuthLogout());
            context.pop();
            context.pop();
          },
          child: Text(
            context.l10n.logout,
            style: TextStyle(color: AppColors.danger),
          ),
        ),
      ],
    ),
  );
}
