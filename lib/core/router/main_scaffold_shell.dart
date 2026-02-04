import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class MainScaffoldShell extends StatelessWidget {
  const MainScaffoldShell({
    required this.navigationShell,
    super.key,
  });

  static StatefulShellRoute route({
    required List<StatefulShellBranch> branches,
  }) {
    return StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScaffoldShell(navigationShell: navigationShell);
      },
      branches: branches,
    );
  }

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Theme(
        data: Theme.of(
          context,
        ).copyWith(splashColor: BeColors.none, highlightColor: BeColors.none),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: BeColors.border,
                width: 0.5,
              ),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: navigationShell.currentIndex,
            onTap: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: BeColors.surface1,
            enableFeedback: false,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.surface4,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
            items: [
              BottomNavigationBarItem(
                icon: const HeroIcon(
                  HeroIcons.home,
                  size: 24,
                ),
                activeIcon: const HeroIcon(
                  HeroIcons.home,
                  style: .solid,
                  size: 24,
                ),
                label: context.l10n.home,
              ),
              BottomNavigationBarItem(
                icon: const HeroIcon(
                  HeroIcons.queueList,
                  size: 24,
                ),
                activeIcon: const HeroIcon(
                  HeroIcons.queueList,
                  style: .solid,
                  size: 24,
                ),
                label: context.l10n.orders,
              ),
              BottomNavigationBarItem(
                icon: const HeroIcon(
                  HeroIcons.cog6Tooth,
                  size: 24,
                ),
                activeIcon: const HeroIcon(
                  HeroIcons.cog6Tooth,
                  style: .solid,
                  size: 24,
                ),
                label: context.l10n.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
