import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_state.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_event.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class MainScaffoldShell extends StatelessWidget {
  const MainScaffoldShell({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  void _onTabTapped(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
    if (index == 1) {
      context.read<OrdersListBloc>().add(const GetClientOrdersListEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, authState) {
        if (authState is AuthAuthenticated) {
          context.read<AuthBloc>().add(const AuthLoadProfile());
        }
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => _onTabTapped(context, index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
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
          items: const [
            BottomNavigationBarItem(
              icon: HeroIcon(
                HeroIcons.home,
                size: 24,
              ),
              activeIcon: HeroIcon(
                HeroIcons.home,
                size: 24,
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: HeroIcon(
                HeroIcons.queueList,
                size: 24,
              ),
              activeIcon: HeroIcon(
                HeroIcons.queueList,
                size: 24,
              ),
              label: 'Заказы',
            ),
            BottomNavigationBarItem(
              icon: HeroIcon(
                HeroIcons.cog6Tooth,
                size: 24,
              ),
              activeIcon: HeroIcon(
                HeroIcons.cog6Tooth,
                size: 24,
              ),
              label: 'Настройки',
            ),
          ],
        ),
      ),
    );
  }
}
