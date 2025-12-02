import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/home/presentation/home_page.dart';
import 'package:fly_cargo/features/home/presentation/orders_list_page.dart';
import 'package:fly_cargo/features/home/presentation/settings_page.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_event.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_bloc.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_event.dart';
import 'package:heroicons/heroicons.dart';

class MainScaffoldPage extends StatefulWidget {
  const MainScaffoldPage({super.key});

  @override
  State<MainScaffoldPage> createState() => _MainScaffoldPageState();
}

class _MainScaffoldPageState extends State<MainScaffoldPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _pages = const [
    HomePage(),
    OrdersListPage(),
    SettingsPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 1) {
      context.read<OrdersBloc>().add(const GetClientOrdersEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, authState) {
        if (authState is AuthAuthenticated) {
          context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
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
