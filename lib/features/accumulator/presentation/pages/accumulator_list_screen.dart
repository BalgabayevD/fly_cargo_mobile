import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/accumulator/domain/entities/accumulator_entity.dart';
import 'package:fly_cargo/features/accumulator/presentation/bloc/accumulator_list_bloc.dart';
import 'package:fly_cargo/features/accumulator/presentation/bloc/accumulator_list_event.dart';
import 'package:fly_cargo/features/accumulator/presentation/bloc/accumulator_list_state.dart';
import 'package:fly_cargo/features/accumulator/presentation/pages/accumulator_orders_screen.dart';
import 'package:fly_cargo/features/accumulator/presentation/widgets/accumulator_card_widget.dart';
import 'package:go_router/go_router.dart';

class AccumulatorListScreen extends StatelessWidget {
  static const String path = '/courier/accumulators';

  static String location() => Uri(path: path).toString();

  const AccumulatorListScreen({super.key});

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) => BlocProvider(
        create: (_) =>
            getIt<AccumulatorListBloc>()..add(AccumulatorListLoadEvent()),
        child: const AccumulatorListScreen(),
      ),
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      title: 'Прибывшие заказы',
      backgroundColor: BeColors.white,
      centerTitle: true,
      isBorder: true,
      child: BlocBuilder<AccumulatorListBloc, AccumulatorListState>(
        builder: (context, state) {
          if (state is AccumulatorListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AccumulatorListErrorState) {
            return _ErrorWidget(
              message: state.message,
              onRetry: () => context.read<AccumulatorListBloc>().add(
                AccumulatorListLoadEvent(),
              ),
            );
          }

          if (state is AccumulatorListEmptyState) {
            return const _EmptyWidget();
          }

          if (state is AccumulatorListLoadedState) {
            return _AccumulatorListWidget(accumulators: state.accumulators);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _AccumulatorListWidget extends StatelessWidget {
  final List<AccumulatorEntity> accumulators;

  const _AccumulatorListWidget({required this.accumulators});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<AccumulatorListBloc>().add(AccumulatorListRefreshEvent());
      },
      child: ListView.separated(
        itemCount: accumulators.length + 1,
        separatorBuilder: (context, index) {
          final accumulator = accumulators[index];
          return AccumulatorCardWidget(
            accumulator: accumulator,
            onTap: () => context.push(
              AccumulatorOrdersScreen.location(accumulator.id),
              extra: accumulator,
            ),
          );
        },

        itemBuilder: (context, index) => const BeSpace(size: .xxl),
      ),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 64,
            color: BeColors.surface3,
          ),
          SizedBox(height: 16),
          Text(
            'Нет прибывших накопителей',
            style: TextStyle(
              fontSize: 16,
              color: BeColors.surface4,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorWidget({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: BeColors.danger,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              color: BeColors.surface4,
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: onRetry,
            child: const Text('Повторить'),
          ),
        ],
      ),
    );
  }
}
