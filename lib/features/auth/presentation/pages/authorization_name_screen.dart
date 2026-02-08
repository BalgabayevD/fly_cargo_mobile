import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/features/auth/data/models/user_session_model.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/components/authorization_set_name_form.dart';
import 'package:fly_cargo/features/create_order/presentation/pages/create_order_screen.dart';
import 'package:fly_cargo/features/home/presentation/screen/courier_home_screen.dart';
import 'package:go_router/go_router.dart';

class AuthorizationNameScreen extends StatelessWidget {
  static String path = '/authorization/name';

  const AuthorizationNameScreen({super.key});

  static String location() => Uri(path: path).toString();

  static GoRoute route() {
    return GoRoute(
      path: path,
      builder: (context, state) => const AuthorizationNameScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      isBorder: true,
      title: 'Авторизация',
      child: BlocConsumer<AuthorizationBloc, AuthorizationState>(
        listener: (BuildContext context, AuthorizationState state) {},
        listenWhen: (previous, current) {
          return GoRouter.of(context).state.path ==
              AuthorizationNameScreen.location();
        },
        builder: (BuildContext context, AuthorizationState state) {
          if (state is AuthorizedState) {
            return AuthorizationSetNameForm(
              isLoading: false,
              onSubmit: (String name) {
                context.read<AuthorizationBloc>().add(
                  AuthorizationUpdateProfileEvent(name),
                );

                if (state.sessionInfo.user.role == UserRole.user) {
                  context.go(CreateOrderScreen.location());
                }

                if (state.sessionInfo.user.role == UserRole.courier) {
                  context.go(CourierHomeScreen.location());
                }
              },
            );
          }

          return Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
