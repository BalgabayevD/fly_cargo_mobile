import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/design_system/nothing.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/photos_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/tariffs_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_open_orders_screen.dart';
import 'package:fly_cargo/features/submit_order/presentation/bloc/courier_submit_order_bloc.dart';
import 'package:fly_cargo/features/submit_order/presentation/widgets/order_submit_is_defect.dart';
import 'package:fly_cargo/features/submit_order/presentation/widgets/order_submit_photos.dart';
import 'package:fly_cargo/features/submit_order/presentation/widgets/order_submit_select_tariffs.dart';
import 'package:fly_cargo/features/submit_order/presentation/widgets/order_submit_weight.dart';
import 'package:go_router/go_router.dart';

class CourierSubmitOrdersScreen extends StatelessWidget {
  static const String path = '/courier/orders/submit/:orderId';

  static String location(int orderId) =>
      Uri(path: path.replaceFirst(':orderId', orderId.toString())).toString();

  const CourierSubmitOrdersScreen({super.key});

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      redirect: (context, state) {
        final orderId = state.pathParameters['orderId'];

        if (orderId == null || orderId.isEmpty) {
          return CourierOpenOrdersScreen.location();
        }

        if (int.tryParse(orderId) == null) {
          return CourierOpenOrdersScreen.location();
        }

        return null;
      },
      builder: (BuildContext context, state) {
        final orderId = int.parse(state.pathParameters['orderId']!);

        return MultiBlocProvider(
          providers: [
            BlocProvider<CourierSubmitOrderBloc>(
              create: (_) =>
                  getIt<CourierSubmitOrderBloc>()
                    ..add(CourierSubmitOrderLoadEvent(orderId)),
            ),
            BlocProvider<PhotosBloc>(
              create: (BuildContext context) => getIt<PhotosBloc>(),
            ),
            BlocProvider<TariffsBloc>(
              create: (BuildContext context) =>
                  getIt<TariffsBloc>()..add(TariffsLoadEvent()),
            ),
          ],
          child: CourierSubmitOrdersScreen(),
        );
      },
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierSubmitOrderBloc, CourierSubmitOrderState>(
      builder: (BuildContext context, CourierSubmitOrderState state) {
        if (state is CourierSubmitOrderLoadingState) {
          return BePage(
            title: 'Подтверждение',
            backgroundColor: BeColors.white,
            centerTitle: true,
            isBorder: true,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is CourierSubmitOrderLoadedState) {
          return BePage(
            title: 'Подтверждение',
            centerTitle: true,
            isBorder: true,
            actions: Column(
              children: [
                BeButton(
                  text: 'Сохранить',
                  color: .primary,
                  isLoading: state.isLoading,
                  onPressed: () => context.read<CourierSubmitOrderBloc>().add(
                    CourierSubmitOrderSubmitEvent(),
                  ),
                ),
              ],
            ),
            child: ListView(
              children: [
                BeSpace(size: .md),
                OrderSubmitTariffs(
                  tariffId: state.tariffId,
                ),
                BeSpace(size: .md),
                OrderSubmitWeight(
                  weight: state.weight,
                ),
                BeSpace(size: .md),
                OrderSubmitIsDefect(
                  isDefect: state.isDefect,
                ),
                BeSpace(size: .md),
                if (state.isDefect) OrderSubmitPhotosGridSection(),
              ],
            ),
          );
        }

        return const BeNothing();
      },
    );
  }
}
