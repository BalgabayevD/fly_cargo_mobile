import 'package:flutter/material.dart';
import 'package:fly_cargo/features/home/presentation/widgets/address_card_widget.dart';
import 'package:fly_cargo/features/home/presentation/widgets/box_selection_section_widget.dart';
import 'package:fly_cargo/features/home/presentation/widgets/placeholder_item_widget.dart';
import 'package:fly_cargo/features/home/presentation/widgets/route_header_widget.dart';
import 'package:fly_cargo/features/home/presentation/widgets/send_package_button_widget.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
mixin HomeBottomSheetContentStyling {
  static const double handleWidth = 40.0;
  static const double handleHeight = 4.0;
  static const double handleMargin = 16.0;
  static const double handleBorderRadius = 2.0;
  static const double dividerHeight = 1.0;
  static const double spacing = 16.0;
  static const double largeSpacing = 24.0;
  static const double sectionSpacing = 12.0;
}
class HomeBottomSheetContent extends StatelessWidget
    with HomeBottomSheetContentStyling {
  final AddressModel? fromAddress;
  final AddressModel? toAddress;
  final VoidCallback onSendPackagePressed;
  final VoidCallback onAddressSelectionTap;
  final void Function(BuildContext, String) onBoxDetailsTap;
  final ScrollController scrollController;
  const HomeBottomSheetContent({
    required this.fromAddress, required this.toAddress, required this.onSendPackagePressed, required this.onAddressSelectionTap, required this.onBoxDetailsTap, required this.scrollController, super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.black26),
        ],
      ),
      child: ListView(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        children: [
          _buildHandle(),
          if (fromAddress == null || toAddress == null)
            SendPackageButtonWidget(onTap: onSendPackagePressed)
          else
            _buildAddressesContent(context),
          if (fromAddress == null || toAddress == null) ...[
            const SizedBox(height: HomeBottomSheetContentStyling.spacing),
            const PlaceholderItemWidget(),
            const Divider(
              color: Color(0xFFD0CFCE),
              height: HomeBottomSheetContentStyling.dividerHeight,
            ),
          ],
        ],
      ),
    );
  }
  Widget _buildHandle() {
    return Center(
      child: Container(
        width: HomeBottomSheetContentStyling.handleWidth,
        height: HomeBottomSheetContentStyling.handleHeight,
        margin: const EdgeInsets.only(bottom: HomeBottomSheetContentStyling.handleMargin),
        decoration: BoxDecoration(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(HomeBottomSheetContentStyling.handleBorderRadius),
        ),
      ),
    );
  }
  Widget _buildAddressesContent(BuildContext context) {
    return Column(
      children: [
        RouteHeaderWidget(onEditTap: onAddressSelectionTap),
        const SizedBox(height: HomeBottomSheetContentStyling.spacing),
        AddressCardWidget(
          address: fromAddress!,
          label: 'Откуда забрать',
          gradientColors: const [Color(0xFF007AFF), Color(0xFF0056CC)],
          onTap: onAddressSelectionTap,
        ),
        const SizedBox(height: HomeBottomSheetContentStyling.sectionSpacing),
        const Divider(
          height: HomeBottomSheetContentStyling.dividerHeight,
          color: Color(0xFFE0E0E0),
        ),
        const SizedBox(height: HomeBottomSheetContentStyling.sectionSpacing),
        AddressCardWidget(
          address: toAddress!,
          label: 'Куда доставить',
          gradientColors: const [Color(0xFF34C759), Color(0xFF2AA54A)],
          onTap: onAddressSelectionTap,
        ),
        const SizedBox(height: HomeBottomSheetContentStyling.largeSpacing),
        BoxSelectionSectionWidget(onBoxDetailsTap: onBoxDetailsTap),
      ],
    );
  }
}
