import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/photos_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/tariffs_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/create_order_delivery.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/create_orders_form.dart';
import 'package:fly_cargo/features/destination/presentation/bloc/cities_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateOrderScreen extends StatelessWidget {
  static String path = '/order/create';

  const CreateOrderScreen({super.key});

  static String location() => Uri(path: path).toString();

  static GoRoute route({List<RouteBase> routes = const <RouteBase>[]}) {
    return GoRoute(
      path: path,
      builder: (context, state) => const CreateOrderScreen(),
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CitiesBloc>(
          create: (BuildContext context) =>
              getIt<CitiesBloc>()..add(LoadInitialCitiesEvent()),
        ),
        BlocProvider<CreateOrdersBloc>(
          create: (BuildContext context) => getIt<CreateOrdersBloc>(),
        ),
        BlocProvider<PhotosBloc>(
          create: (BuildContext context) => getIt<PhotosBloc>(),
        ),
        BlocProvider<TariffsBloc>(
          create: (BuildContext context) =>
              getIt<TariffsBloc>()..add(TariffsLoadEvent()),
        ),
      ],
      child: BePage(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: context.l10n.home,
        trailing: [
          CreateOrdersDelivery(),
          CreateOrdersNotifications(),
        ],
        child: CreateOrdersForm(),
      ),
    );
  }
}
