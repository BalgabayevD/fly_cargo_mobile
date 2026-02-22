import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/connectivity/connectivity_cubit.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/design_system/spacing.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:heroicons/heroicons.dart';

class NoInternetBannerWidget extends StatelessWidget {
  const NoInternetBannerWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, bool>(
      builder: (context, isConnected) {
        return Column(
          children: [
            _Banner(isConnected: isConnected),
            Expanded(child: child),
          ],
        );
      },
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({required this.isConnected});

  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      height: isConnected ? 0 : topPadding + 44,
      color: AppColors.danger,
      child: isConnected
          ? const SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.only(
                top: topPadding,
                left: AppSpacing.lg,
                right: AppSpacing.lg,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeroIcon(
                    HeroIcons.signalSlash,
                    style: HeroIconStyle.solid,
                    size: AppSpacing.iconSizeMD,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    context.l10n.noInternetConnection,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
