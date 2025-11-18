import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/home/presentation/widgets/address_card_widget.dart';
import 'package:fly_cargo/features/home/presentation/widgets/box_selection_section_widget.dart';
import 'package:fly_cargo/features/home/presentation/widgets/placeholder_item_widget.dart';
import 'package:fly_cargo/features/home/presentation/widgets/route_header_widget.dart';
import 'package:fly_cargo/features/home/presentation/widgets/send_package_button_widget.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';

/// Контент нижней панели главной страницы
class HomeBottomSheetContent extends StatelessWidget {
  final AddressModel? fromAddress;
  final AddressModel? toAddress;
  final VoidCallback onSendPackagePressed;
  final VoidCallback onAddressSelectionTap;
  final void Function(BuildContext, String) onBoxDetailsTap;
  final ScrollController scrollController;

  const HomeBottomSheetContent({
    required this.fromAddress,
    required this.toAddress,
    required this.onSendPackagePressed,
    required this.onAddressSelectionTap,
    required this.onBoxDetailsTap,
    required this.scrollController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXL),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: AppSpacing.shadowBlurRadius,
            color: AppColors.black.withValues(alpha: 0.26),
          ),
        ],
      ),
      child: ListView(
        controller: scrollController,
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          const _BottomSheetHandle(),
          if (fromAddress == null || toAddress == null)
            SendPackageButtonWidget(onTap: onSendPackagePressed)
          else
            _AddressesContent(
              fromAddress: fromAddress!,
              toAddress: toAddress!,
              onAddressSelectionTap: onAddressSelectionTap,
              onBoxDetailsTap: onBoxDetailsTap,
            ),
          if (fromAddress == null || toAddress == null) ...[
            const SizedBox(height: AppSpacing.lg),
            const PlaceholderItemWidget(),
            const Divider(
              color: AppColors.borderDark,
              height: AppSpacing.dividerHeight,
            ),
          ],
        ],
      ),
    );
  }
}

/// Ручка для перетаскивания нижней панели
class _BottomSheetHandle extends StatelessWidget {
  const _BottomSheetHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40.0,
        height: 4.0,
        margin: const EdgeInsets.only(bottom: AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: BorderRadius.circular(AppSpacing.radiusXS),
        ),
      ),
    );
  }
}

/// Контент с адресами и выбором коробки
class _AddressesContent extends StatelessWidget {
  final AddressModel fromAddress;
  final AddressModel toAddress;
  final VoidCallback onAddressSelectionTap;
  final void Function(BuildContext, String) onBoxDetailsTap;

  const _AddressesContent({
    required this.fromAddress,
    required this.toAddress,
    required this.onAddressSelectionTap,
    required this.onBoxDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RouteHeaderWidget(onEditTap: onAddressSelectionTap),
        const SizedBox(height: AppSpacing.lg),
        AddressCardWidget(
          address: fromAddress,
          label: 'Откуда забрать',
          gradientColors: const [AppColors.primary, AppColors.primaryDark],
          onTap: onAddressSelectionTap,
        ),
        const SizedBox(height: AppSpacing.md),
        const Divider(
          height: AppSpacing.dividerHeight,
          color: AppColors.border,
        ),
        const SizedBox(height: AppSpacing.md),
        AddressCardWidget(
          address: toAddress,
          label: 'Куда доставить',
          gradientColors: const [AppColors.secondary, AppColors.secondaryDark],
          onTap: onAddressSelectionTap,
        ),
        const SizedBox(height: AppSpacing.xxl),
        BoxSelectionSectionWidget(onBoxDetailsTap: onBoxDetailsTap),
      ],
    );
  }
}
