import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/accumulator/presentation/pages/accumulator_list_screen.dart';
import 'package:fly_cargo/features/accumulator/presentation/pages/accumulator_scan_screen.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_orders_scan_screen.dart';
import 'package:fly_cargo/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:fly_cargo/features/shift/presentation/bloc/shift_event.dart';
import 'package:fly_cargo/features/shift/presentation/widgets/shift_status_widget.dart';
import 'package:go_router/go_router.dart';

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
      title: 'Главная',
      automaticallyImplyLeading: false,
      centerTitle: true,
      isBorder: true,
      backgroundColor: BeColors.white,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          const ShiftStatusWidget(),
          const BeSpace(size: .xl),
          BeButton(
            text: 'Найти заказ',
            color: .gray,
            variant: .solid,
            onPressed: () => context.push(CourierOrdersScanScreen.location()),
          ),
          const BeSpace(size: .xl),
          BeButton(
            text: 'Принять прибывшие заказы',
            color: .gray,
            variant: .solid,
            onPressed: () => context.push(AccumulatorScanScreen.location()),
          ),
          const BeSpace(size: .xl),
          BeButton(
            text: 'Прибывшие заказы',
            color: .gray,
            variant: .solid,
            onPressed: () => context.push(AccumulatorListScreen.location()),
          ),
        ],
      ),
    );
  }
}
