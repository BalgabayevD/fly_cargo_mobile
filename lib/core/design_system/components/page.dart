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
  final Color backgroundColor;
  final Color appBarColor;

  const BePage({
    required this.child,
    required this.title,
    this.actions,
    this.trailing,
    this.padding,
    this.centerTitle,
    this.actionsPersist = false,
    this.automaticallyImplyLeading = true,
    this.isBorder,
    this.backgroundColor = BeColors.surface2,
    this.appBarColor = BeColors.none,
    super.key,
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
        backgroundColor: backgroundColor,
        appBar: BeAppBar(
          title: title,
          actions: trailing,
          isBorder: isBorder,
          centerTitle: centerTitle,
          automaticallyImplyLeading: automaticallyImplyLeading,
          appBarColor: appBarColor,
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
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      top: 8,
                    ),
                    decoration: BoxDecoration(color: BeColors.white),
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
