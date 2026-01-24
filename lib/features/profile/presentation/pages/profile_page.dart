import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_request_screen.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  static const String path = '/profile';

  static String location() => Uri(path: path).toString();

  const ProfilePage({super.key});

  static GoRoute route({GlobalKey<NavigatorState>? parentNavigatorKey}) {
    return GoRoute(
      path: path,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const ProfilePage(),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.l10n.logoutTitle),
        content: Text(context.l10n.logoutConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              context.read<AuthorizationBloc>().add(
                AuthorizationSignOutEvent(),
              );
              context.go(AuthorizationRequestScreen.location());
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

  @override
  Widget build(BuildContext context) {
    return BePage(
      title: context.l10n.profile,
      automaticallyImplyLeading: true,
      centerTitle: true,
      isBorder: true,
      appBarColor: BeColors.white,
      actions: Column(
        children: [
          BeButton(
            text: context.l10n.logoutFromProfile,
            variant: .flat,
            color: .warning,
            onPressed: () => _showLogoutDialog(context),
          ),
          BeSpace(size: .xxl),
          BeButton(
            text: context.l10n.deleteProfileRequest,
            variant: .light,
            color: .danger,
            size: .sm,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    context.l10n.deleteProfileInDevelopment,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
        builder: (context, state) {
          final current = (state as AuthorizedState);

          return Column(
            children: [
              BeSpace(size: .xxl),
              FieldListTile(
                label: context.l10n.phoneNumber,
                value: current.sessionInfo.user.phoneNumber,
                isShowIcon: false,
              ),
              BeSpace(size: .xxl),
              FieldListTile(
                label: context.l10n.firstName,
                value: current.sessionInfo.user.name,
                isShowIcon: false,
              ),
            ],
          );
        },
      ),
    );
  }
}
