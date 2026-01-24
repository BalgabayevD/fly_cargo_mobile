import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
        builder: (context, state) {
          if (state is! AuthorizedState) {
            return Center(
              child: Text(
                context.l10n.notAuthorized,
                style: TextStyle(color: AppColors.danger),
              ),
            );
          }

          final user = state.sessionInfo.user;

          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    BeSpace(size: .xxl),
                    FieldListTile(
                      label: context.l10n.phoneNumber,
                      value: user.phoneNumber ?? '',
                      isShowIcon: false,
                    ),
                    BeSpace(size: .xxl),
                    FieldListTile(
                      label: context.l10n.firstName,
                      value: user.name ?? '',
                      isShowIcon: false,
                    ),
                    // BeSpace(size: .xxl),
                    // FieldListTile(
                    //   label: context.l10n.lastName,
                    //   value: user.lastName ?? '',
                    //   isShowIcon: false,
                    // ),
                    // BeSpace(size: .xxl),
                    // FieldListTile(
                    //   label: context.l10n.middleName,
                    //   value: user.middleName ?? '',
                    //   isShowIcon: false,
                    // ),
                    // BeSpace(size: .xxl),
                    // FieldListTile(
                    //   label: context.l10n.birthDate,
                    //   value: user.birthDay ?? '',
                    //   isShowIcon: false,
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => _showLogoutDialog(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.warningLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusMD,
                            ),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          context.l10n.logoutFromProfile,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.warning,
                          ),
                        ),
                      ),
                    ),
                    BeSpace(size: .xxl),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              context.l10n.deleteProfileInDevelopment,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.sm,
                        ),
                        child: Text(
                          context.l10n.deleteProfileRequest,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.danger,
                            decorationColor: AppColors.danger,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
