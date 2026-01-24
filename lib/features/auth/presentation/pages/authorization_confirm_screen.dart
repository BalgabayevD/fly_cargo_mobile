import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/auth/data/models/user_session_model.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/components/confirm_otp_form.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_name_screen.dart';
import 'package:fly_cargo/features/create_order/presentation/pages/create_order_screen.dart';
import 'package:fly_cargo/features/home/presentation/screen/courier_home_screen.dart';
import 'package:fly_cargo/features/onboarding/presentation/screen/onboarding_screen.dart';
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
            if (state.sessionInfo.user.role == UserRole.user) {
              getIt<Configuration>().setInitialPath(
                CreateOrderScreen.location(),
              );

              if (state.sessionInfo.user.name!.isNotEmpty) {
                context.push(CreateOrderScreen.location());
              } else {
                context.push(AuthorizationNameScreen.location());
              }
            }

            if (state.sessionInfo.user.role == UserRole.courier) {
              getIt<Configuration>().setInitialPath(
                CourierHomeScreen.location(),
              );

              if (state.sessionInfo.user.name!.isNotEmpty) {
                context.push(CourierHomeScreen.location());
              } else {
                context.push(AuthorizationNameScreen.location());
              }
            }
          }

          if (state is AuthorizationOtpConfirmFailureState) {
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
