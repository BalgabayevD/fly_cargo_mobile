import 'package:flutter/material.dart';
import 'package:fly_cargo/shared/ui/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:heroicons/heroicons.dart';

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
    required String text,
    List<Widget> children = const <Widget>[],
  }) {
    Haptics.canVibrate().then((can) {
      if (can) {
        Haptics.vibrate(HapticsType.selection);
      }
    });
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
                  children: [
                    BeBottomTitle(text: text),
                    SizedBox(height: 12),
                    ...children,
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class BeBottomTitle extends StatelessWidget {
  final String text;
  const BeBottomTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.montserrat(fontSize: 19, fontWeight: .w700),
          ),
          IconButton(
            onPressed: () => context.pop(),
            icon: HeroIcon(HeroIcons.xMark, style: HeroIconStyle.outline),
          ),
        ],
      ),
    );
  }
}
