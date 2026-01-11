import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/components/confirm_otp_form.dart';
import 'package:fly_cargo/features/onboarding/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class AuthorizationConfirmScreen extends StatelessWidget {
  static String path = '/authorization/confirm';

  const AuthorizationConfirmScreen({super.key});

  static String location() => Uri(path: path).toString();

  static GoRoute route() {
    return GoRoute(
      path: path,
      builder: (context, state) => const AuthorizationConfirmScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      isBorder: true,
      title: 'Подвердить',
      child: BlocConsumer<AuthorizationBloc, AuthorizationState>(
        listener: (BuildContext context, AuthorizationState state) {
          if (state is AuthorizationOtpConfirmedState) {
            context.read<AuthorizationBloc>().add(
              AuthorizationGetSessionEvent(),
            );
          }

          if (state is AuthorizedState) {
            // context.router.replaceAll([HomeRoute()]);
          }

          if (state is AuthorizationOtpConfirmFailureState) {
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
              AuthorizationConfirmScreen.location();
        },
        builder: (BuildContext context, AuthorizationState state) {
          if (state is AuthorizationOtpRequestedState) {
            return ConfirmOtpForm(
              isLoading: false,
              phone: state.phoneNumber,
              onSubmit: (String code) => context.read<AuthorizationBloc>().add(
                AuthorizationConfirmOtpEvent(state.phoneNumber, code),
              ),
              resend: () {},
            );
          }

          if (state is AuthorizationOtpConfirmingState) {
            return ConfirmOtpForm(
              isLoading: true,
              phone: state.phoneNumber,
              onSubmit: (String code) async {},
              resend: () {},
            );
          }

          return Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
