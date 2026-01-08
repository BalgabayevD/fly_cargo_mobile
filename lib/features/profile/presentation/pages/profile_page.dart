import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_state.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/logout_dialog.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/profile_field.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.surface5),
          onPressed: () => context.pop(),
        ),
        title: Text(
          context.l10n.profile,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.surface5,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is! AuthAuthenticated) {
            return Center(
              child: Text(
                context.l10n.notAuthorized,
                style: TextStyle(color: AppColors.danger),
              ),
            );
          }

          final profile = state.profile;
          if (profile == null) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ProfileField(
                      label: context.l10n.phoneNumber,
                      value: profile.phoneNumber,
                      isEditable: false,
                    ),
                    ProfileField(
                      label: context.l10n.name,
                      value: profile.name,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.cardPadding),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => logoutDialog(context),
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
                    const SizedBox(height: AppSpacing.md),
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
                        padding: EdgeInsets.symmetric(
                          vertical: AppSpacing.sm,
                        ),
                        child: Text(
                          context.l10n.deleteProfileRequest,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.danger,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.danger,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSpacing.buttonHeightXXL),
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
