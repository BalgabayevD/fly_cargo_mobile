import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_orders_scan_screen.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_orders_screen.dart';
import 'package:fly_cargo/features/profile/presentation/pages/courier_qr_screen.dart';
import 'package:fly_cargo/features/profile/presentation/pages/courier_settings_page.dart';
import 'package:fly_cargo/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:fly_cargo/features/shift/presentation/bloc/shift_event.dart';
import 'package:fly_cargo/features/shift/presentation/widgets/shift_status_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class CourierHomeScreen extends StatelessWidget {
  static const String path = '/courier';

  static String location() => Uri(path: path).toString();

  const CourierHomeScreen({super.key});

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<ShiftBloc>()..add(ShiftLoadStatusEvent()),
        child: const CourierHomeScreen(),
      ),
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      title: 'Sapsano Курьер',
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: BeColors.surface2,
      trailing: [
        IconButton(
          onPressed: () => context.push(CourierSettingsPage.location()),
          icon: HeroIcon(HeroIcons.cog6Tooth),
        ),
      ],
      child: ListView(
        padding: const EdgeInsets.only(top: 12, bottom: 56),
        children: [
          Container(
            height: 72,
            decoration: BoxDecoration(
              color: BeColors.white,
              borderRadius: BorderRadius.circular(48),
            ),
            child: Row(
              children: [
                BeSpace(size: .xl, direction: .vertical),
                GestureDetector(
                  onTap: () => context.push(CourierOrdersScanScreen.location()),
                  child: Row(
                    spacing: 12,
                    children: [
                      HeroIcon(
                        HeroIcons.magnifyingGlass,
                        color: BeColors.success,
                      ),
                      Text(
                        'Проверка заказа',
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          color: BeColors.success,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: HeroIcon(HeroIcons.qrCode, color: BeColors.success),
                ),
                BeSpace(size: .xl, direction: .vertical),
              ],
            ),
          ),
          BeSpace(size: .xxl),
          Text(
            'Смена',
            style: GoogleFonts.montserrat(
              fontSize: 13,
              color: BeColors.surface4,
              fontWeight: .w600,
            ),
          ),
          BeSpace(size: .sm),
          Container(
            decoration: BoxDecoration(
              color: BeColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                const ShiftStatusWidget(),
              ],
            ),
          ),
          const BeSpace(size: .xl),
          Text(
            'Основное',
            style: GoogleFonts.montserrat(
              fontSize: 13,
              color: BeColors.surface4,
              fontWeight: .w600,
            ),
          ),
          BeSpace(size: .sm),
          Container(
            decoration: BoxDecoration(
              color: BeColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                ListTile(
                  onTap: () => context.push(CourierOrdersPage.location()),
                  title: Text('Доставки'),
                  leading: CircleAvatar(child: HeroIcon(HeroIcons.truck)),
                ),
                Container(height: 2, color: BeColors.surface2),
                ListTile(
                  onTap: () => context.push(CourierQrScreen.location()),
                  title: Text('Мой QR'),
                  leading: CircleAvatar(child: HeroIcon(HeroIcons.qrCode)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
