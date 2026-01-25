import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:heroicons/heroicons.dart';

enum BeBottomTitleVariant {
  primary,
  secondary,
}

class BeBottomDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    List<Widget> children = const <Widget>[],
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: BeColors.none,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.5,
          builder: (context, controller) {
            return ClipRRect(
              clipBehavior: .hardEdge,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Scaffold(
                body: ListView(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  controller: controller,
                  children: children,
                ),
              ),
            );
          },
        );
      },
    );
  }

  static Future<T?> showBottomDialog<T>({
    required BuildContext context,
    String text = '',
    Widget Function(BuildContext context, ScrollController controller)? builder,
    Widget? action,
    double initialChildSize = 0.5,
    double maxChildSize = 0.5,
    double minChildSize = 0.25,
    List<Widget> children = const <Widget>[],
    BeBottomTitleVariant titleVariant = .primary,
  }) {
    if (titleVariant == .primary) {
      Haptics.canVibrate().then((can) {
        if (can) {
          Haptics.vibrate(HapticsType.selection);
        }
      });
    }
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: BeColors.none,
      barrierColor: titleVariant == .secondary ? BeColors.none : null,
      builder: (context) {
        return DraggableScrollableSheet(
          minChildSize: minChildSize,
          initialChildSize: initialChildSize,
          maxChildSize: maxChildSize,
          builder: (context, controller) {
            if (builder != null) {
              return builder(context, controller);
            }
            return BeDialogBody(
              text: text,
              titleVariant: titleVariant,
              action: action,
              controller: controller,
              children: children,
            );
          },
        );
      },
    );
  }
}

class BeDialogBody extends StatelessWidget {
  final Widget? action;
  final List<Widget> children;
  final ScrollController? controller;
  final String text;
  final BeBottomTitleVariant titleVariant;
  final Widget Function(BuildContext context, ScrollController? controller)?
  builder;

  const BeDialogBody({
    this.text = '',
    this.titleVariant = .primary,
    this.children = const <Widget>[],
    this.action,
    this.controller,
    super.key,
  }) : builder = null;

  const BeDialogBody.builder({
    required this.builder,
    this.text = '',
    this.titleVariant = .primary,
    this.action,
    this.controller,
    super.key,
  }) : children = const <Widget>[];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: .hardEdge,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      child: Scaffold(
        body: Column(
          children: [
            BeBottomTitle(text: text, variant: titleVariant),
            if (builder != null) Expanded(child: builder!(context, controller)),
            if (builder == null)
              Expanded(
                child: ListView(
                  controller: controller,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  shrinkWrap: true,
                  primary: false,
                  children: children,
                ),
              ),

            if (action != null)
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 36,
                ),
                child: action!,
              ),
          ],
        ),
      ),
    );
  }
}

class BeBottomTitle extends StatelessWidget {
  final BeBottomTitleVariant variant;
  final String text;
  const BeBottomTitle({required this.text, super.key, this.variant = .primary});

  void onClose(BuildContext context) {
    if (variant == .primary) {
      Haptics.canVibrate().then((can) {
        if (can) {
          Haptics.vibrate(HapticsType.selection);
        }
      });
    }
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: variant == .secondary ? 6 : 16,
        right: 16,
      ),
      child: SizedBox(
        height: 68,
        width: double.infinity,
        child: Row(
          spacing: 12,
          children: [
            if (variant == .secondary)
              IconButton(
                onPressed: () => onClose(context),
                icon: HeroIcon(
                  HeroIcons.chevronLeft,
                  style: HeroIconStyle.outline,
                  color: BeColors.surface4,
                ),
              ),
            Text(
              text,
              style: GoogleFonts.montserrat(fontSize: 19, fontWeight: .w700),
            ),
            if (variant == .primary) Spacer(),
            if (variant == .primary)
              IconButton(
                onPressed: () => onClose(context),
                icon: HeroIcon(HeroIcons.xMark, style: HeroIconStyle.outline),
              ),
          ],
        ),
      ),
    );
  }
}
