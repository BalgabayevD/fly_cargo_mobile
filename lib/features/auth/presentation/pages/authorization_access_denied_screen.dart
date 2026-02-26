import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class AuthorizationAccessDeniedScreen extends StatelessWidget {
  static String path = '/authorization/access-denied';

  const AuthorizationAccessDeniedScreen({super.key});

  static String location() => Uri(path: path).toString();

  static GoRoute route() {
    return GoRoute(
      path: path,
      builder: (context, state) => const AuthorizationAccessDeniedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeColors.surface2,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: 96,
                height: 96,
                decoration: const BoxDecoration(
                  color: BeColors.dangerLight,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: HeroIcon(
                    HeroIcons.lockClosed,
                    style: HeroIconStyle.solid,
                    size: 48,
                    color: BeColors.danger,
                  ),
                ),
              ),
              const BeSpace(size: BeSpacingSize.xl),
              const Text(
                'Нет доступа',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: BeColors.surface5,
                ),
              ),
              const BeSpace(size: BeSpacingSize.sm),
              const Text(
                'Ваша роль не поддерживается в мобильном приложении.\nОбратитесь к администратору.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: BeColors.surface4,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: BeButton(
                  text: 'Выйти из аккаунта',
                  color: BeButtonColor.danger,
                  onPressed: () {
                    context.read<AuthorizationBloc>().add(
                      AuthorizationSignOutEvent(),
                    );
                  },
                ),
              ),
              const BeSpace(size: BeSpacingSize.xl),
            ],
          ),
        ),
      ),
    );
  }
}
