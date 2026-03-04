import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class DeliveryConfirmDialog {
  const DeliveryConfirmDialog();

  Future<String?> confirmDelivery(
    BuildContext context,
  ) {
    final codeNotifier = ValueNotifier<String?>(null);
    return BeBottomDialog.showBottomDialog<String?>(
      context: context,
      maxChildSize: 0.90,
      initialChildSize: 0.90,
      minChildSize: 0.85,
      text: 'Доставить заказ',
      builder: (BuildContext context, ScrollController controller) {
        return ValueListenableBuilder(
          valueListenable: codeNotifier,
          builder: (BuildContext context, value, Widget? child) {
            return BeDialogBody(
              controller: controller,
              text: 'Доставить заказ',
              action: Column(
                children: [
                  BeButton(
                    text: 'Подвредить',
                    onPressed: () => context.pop(codeNotifier.value),
                  ),
                  BeSpace(size: .xxl),
                  BeButton(
                    text: 'Отмена',
                    color: .gray,
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
              children: [
                _DialogCodeSelect(notifier: codeNotifier),
              ],
            );
          },
        );
      },
    );
  }
}

class _DialogCodeSelect extends StatefulWidget {
  final ValueNotifier<String?> notifier;

  const _DialogCodeSelect({required this.notifier});

  @override
  State<_DialogCodeSelect> createState() => _DialogCodeSelectState();
}

class _DialogCodeSelectState extends State<_DialogCodeSelect> {
  late final textController = TextEditingController(
    text: widget.notifier.value,
  );
  late final FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    textController.addListener(() {
      widget.notifier.value = textController.text;
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.notifier,
      builder: (BuildContext context, Widget? child) {
        return BeFormInput(
          focusNode: focusNode,
          variant: .bordered,
          label: 'Код получения',
          controller: textController,
          keyboardType: .number,
        );
      },
    );
  }
}

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
            keyboardType: .number,
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
