import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/nothing.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CourierQrScreen extends StatelessWidget {
  static const String path = '/courier/profile/qr';

  const CourierQrScreen({super.key});

  static String location() => Uri(path: path).toString();

  static GoRoute route({
    List<RouteBase>? routes,
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) => const CourierQrScreen(),
      routes: routes ?? const <RouteBase>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      title: 'QR',
      centerTitle: true,
      isBorder: true,
      padding: EdgeInsets.zero,
      appBarColor: BeColors.white,
      child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
        builder: (context, state) {
          if (state is AuthorizedState) {
            return Column(
              mainAxisAlignment: .center,
              children: [
                SizedBox(
                  width: 320,
                  child: QrImageView(
                    data:
                        'https://sapsano.kz/hooks/users/identification/${state.sessionInfo.user.id}',
                    version: QrVersions.auto,
                    size: 320,
                    gapless: false,
                  ),
                ),
              ],
            );
          }
          return BeNothing();
        },
      ),
    );
  }
}
