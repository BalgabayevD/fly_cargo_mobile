import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/appbar.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';

class BePage extends StatelessWidget {
  final Widget child;
  final String title;
  final Widget? actions;
  final bool? centerTitle;
  final List<Widget>? trailing;
  final bool actionsPersist;
  final bool automaticallyImplyLeading;
  final EdgeInsetsGeometry? padding;
  final bool? isBorder;

  const BePage({
    super.key,
    required this.child,
    required this.title,
    this.actions,
    this.trailing,
    this.padding,
    this.centerTitle,
    this.actionsPersist = false,
    this.automaticallyImplyLeading = true,
    this.isBorder,
  });

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final isActionsShow = actions != null && actionsPersist
        ? true
        : !isKeyboardOpen && actions != null;

    return GestureDetector(
      behavior: .translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: BeColors.surface2,
        appBar: BeAppBar(
          title: title,
          actions: trailing,
          isBorder: isBorder,
          centerTitle: centerTitle,
          automaticallyImplyLeading: automaticallyImplyLeading,
        ),
        body: Stack(
          fit: .expand,
          children: [
            SafeArea(
              child: Padding(
                padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
                child: child,
              ),
            ),
            if (isActionsShow)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: BeColors.white,
                      border: Border(
                        top: BorderSide(width: 1, color: BeColors.border),
                      ),
                    ),
                    child: actions,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
