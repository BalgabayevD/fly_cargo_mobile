import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class DeliveryConfirmBottomSheetWidget extends StatefulWidget {
  final String fromAddress;
  final bool isLoading;
  final void Function(String code) onConfirm;

  const DeliveryConfirmBottomSheetWidget({
    required this.fromAddress,
    required this.onConfirm,
    this.isLoading = false,
    super.key,
  });

  static Future<void> show({
    required BuildContext context,
    required String fromAddress,
    required void Function(String code) onConfirm,
    bool isLoading = false,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: BeColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => DeliveryConfirmBottomSheetWidget(
        fromAddress: fromAddress,
        onConfirm: onConfirm,
        isLoading: isLoading,
      ),
    );
  }

  @override
  State<DeliveryConfirmBottomSheetWidget> createState() =>
      _DeliveryConfirmBottomSheetWidgetState();
}

class _DeliveryConfirmBottomSheetWidgetState
    extends State<DeliveryConfirmBottomSheetWidget> {
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Доставить заказ',
                style: GoogleFonts.montserrat(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: BeColors.surface5,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const HeroIcon(
                  HeroIcons.xMark,
                  style: HeroIconStyle.outline,
                  size: 24,
                  color: BeColors.surface5,
                ),
              ),
            ],
          ),

          const BeSpace(size: .xl),

          FieldListTile(
            label: 'Откуда',
            value: widget.fromAddress,
            variant: FieldListTileVariant.bordered,
          ),

          const BeSpace(size: .lg),

          TextField(
            controller: _codeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Код получения',
              labelStyle: GoogleFonts.montserrat(
                fontSize: 13,
                color: BeColors.surface4,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: BeColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: BeColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: BeColors.primary),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            style: GoogleFonts.montserrat(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: BeColors.surface5,
            ),
          ),

          const BeSpace(size: .xxxl),

          BeButton(
            text: 'Подтвердить',
            variant: BeButtonVariant.solid,
            color: BeButtonColor.primary,
            isLoading: widget.isLoading,
            onPressed: () {
              final code = _codeController.text.trim();
              if (code.length >= 4) {
                widget.onConfirm(code);
              }
            },
          ),

          const BeSpace(size: .md),

          BeButton(
            text: 'Назад',
            variant: BeButtonVariant.ghost,
            color: BeButtonColor.primary,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
