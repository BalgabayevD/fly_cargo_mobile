import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
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
      backgroundColor: BeColors.surface2,
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
  final focusNode = FocusNode();

  @override
  void dispose() {
    _codeController.dispose();
    focusNode.dispose();
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

          BeFormInput(
            label: 'Код получения',
            variant: .flat,
            focusNode: focusNode,
            controller: _codeController,
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
            color: BeButtonColor.gray,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
