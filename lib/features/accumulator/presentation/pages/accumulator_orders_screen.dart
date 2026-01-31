import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/accumulator/domain/entities/accumulator_entity.dart';
import 'package:fly_cargo/features/accumulator/domain/repositories/accumulator_rest_repository.dart';
import 'package:fly_cargo/features/accumulator/presentation/widgets/accumulator_order_card_widget.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_order_screen.dart';
import 'package:go_router/go_router.dart';

class AccumulatorOrdersScreen extends StatefulWidget {
  static const String path = '/courier/accumulators/:id';

  final int accumulatorId;
  final AccumulatorEntity? accumulator;

  static String location(int id) =>
      Uri(path: '/courier/accumulators/$id').toString();

  const AccumulatorOrdersScreen({
    super.key,
    required this.accumulatorId,
    this.accumulator,
  });

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) {
        final accumulatorId = int.parse(state.pathParameters['id'] ?? '0');
        final accumulator = state.extra as AccumulatorEntity?;
        return AccumulatorOrdersScreen(
          accumulatorId: accumulatorId,
          accumulator: accumulator,
        );
      },
      routes: routes,
    );
  }

  @override
  State<AccumulatorOrdersScreen> createState() =>
      _AccumulatorOrdersScreenState();
}

class _AccumulatorOrdersScreenState extends State<AccumulatorOrdersScreen> {
  AccumulatorEntity? _accumulator;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _accumulator = widget.accumulator;
    if (_accumulator == null) {
      _loadAccumulator();
    }
  }

  Future<void> _loadAccumulator() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final repository = getIt<AccumulatorRestRepository>();
      final accumulator = await repository.getById(widget.accumulatorId);
      setState(() {
        _accumulator = accumulator;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Ошибка загрузки накопителя';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      title: 'Накопитель ${widget.accumulatorId}',
      backgroundColor: BeColors.white,
      centerTitle: true,
      isBorder: true,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
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
              _error!,
              style: const TextStyle(
                fontSize: 16,
                color: BeColors.surface4,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _loadAccumulator,
              child: const Text('Повторить'),
            ),
          ],
        ),
      );
    }

    if (_accumulator == null || _accumulator!.orders.isEmpty) {
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
              'Нет заказов в накопителе',
              style: TextStyle(
                fontSize: 16,
                color: BeColors.surface4,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadAccumulator,
      child: ListView.separated(
        itemCount: _accumulator!.orders.length,
        separatorBuilder: (_, __) => const BeSpace(size: .md),
        itemBuilder: (context, index) {
          final order = _accumulator!.orders[index];
          return AccumulatorOrderCardWidget(
            order: order,
            onTap: () => context.push(
              CourierOrderScreen.location(order.id),
              extra: order,
            ),
          );
        },
      ),
    );
  }
}
