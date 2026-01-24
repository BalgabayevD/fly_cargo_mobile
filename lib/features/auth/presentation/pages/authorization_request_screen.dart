import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/components/request_otp_form.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_confirm_screen.dart';
import 'package:fly_cargo/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class AuthorizationRequestScreen extends StatelessWidget {
  static String path = '/authorization/request';

  const AuthorizationRequestScreen({super.key});

  static String location() => Uri(path: path).toString();

  static GoRoute route() {
    return GoRoute(
      path: path,
      builder: (context, state) => const AuthorizationRequestScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      isBorder: true,
      title: 'Авторизация',
      child: BlocConsumer<AuthorizationBloc, AuthorizationState>(
        listener: (BuildContext context, AuthorizationState state) {
          if (state is AuthorizationOtpRequestedState) {
            getIt<Configuration>().setInitialPath(
              AuthorizationRequestScreen.location(),
            );
            context.push(AuthorizationConfirmScreen.location());
          }

          if (state is AuthorizationOtpRequestFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Что-то пошло не так. Попробуйте еще раз'),
              ),
            );
            context.push(OnboardingScreen.location());
          }
        },
        listenWhen: (previous, current) {
          return GoRouter.of(context).state.path ==
              AuthorizationRequestScreen.location();
        },
        builder: (BuildContext context, AuthorizationState state) {
          return RequestOtpForm(
            isLoading: state is AuthorizationOtpRequestingState,
            onSubmit: (String phone) async {
              context.read<AuthorizationBloc>().add(
                AuthorizationRequestOtpEvent(phone),
              );
            },
          );
        },
      ),
    );
  }
}
