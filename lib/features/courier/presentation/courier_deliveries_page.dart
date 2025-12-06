import 'package:flutter/material.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/courier/models/order_model.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/deliveries_filter_widget.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/deliveries_statistics_dialog.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/delivery_card_widget.dart';
import 'package:go_router/go_router.dart';

class CourierDeliveriesPage extends StatefulWidget {
  const CourierDeliveriesPage({super.key});
  @override
  State<CourierDeliveriesPage> createState() => _CourierDeliveriesPageState();
}

class _CourierDeliveriesPageState extends State<CourierDeliveriesPage> {
  final List<CourierOrder> _deliveries = [];
  final bool _isLoading = false;
  String _selectedFilter = 'all';

  @override
  void initState() {
    super.initState();
  }

  List<CourierOrder> get _filteredDeliveries {
    switch (_selectedFilter) {
      case 'delivered':
        return _deliveries
            .where((delivery) => delivery.status == OrderStatus.delivered)
            .toList();
      case 'cancelled':
        return _deliveries
            .where((delivery) => delivery.status == OrderStatus.cancelled)
            .toList();
      case 'this_week':
        final weekAgo = DateTime.now().subtract(const Duration(days: 7));
        return _deliveries
            .where((delivery) => delivery.createdAt.isAfter(weekAgo))
            .toList();
      case 'this_month':
        final monthAgo = DateTime.now().subtract(const Duration(days: 30));
        return _deliveries
            .where((delivery) => delivery.createdAt.isAfter(monthAgo))
            .toList();
      default:
        return _deliveries;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF333333)),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Мои доставки',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics, color: Color(0xFF333333)),
            onPressed: () => _showStatistics(),
          ),
        ],
      ),
      body: Column(
        children: [
          DeliveriesFilterWidget(
            selectedFilter: _selectedFilter,
            onFilterChanged: (filter) {
              setState(() {
                _selectedFilter = filter;
              });
            },
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredDeliveries.isEmpty
                ? _buildEmptyState()
                : RefreshIndicator(
                    onRefresh: () async {
                      // TODO: загрузка доставок с сервера
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _filteredDeliveries.length,
                      itemBuilder: (context, index) {
                        final delivery = _filteredDeliveries[index];
                        return DeliveryCardWidget(
                          delivery: delivery,
                          onTap: () => _openDeliveryDetails(delivery),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.local_shipping_outlined,
            size: 64,
            color: Color(0xFFCCCCCC),
          ),
          const SizedBox(height: 16),
          const Text(
            'Нет доставок',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedFilter == 'all'
                ? 'У вас пока нет доставок'
                : 'Нет доставок с выбранным фильтром',
            style: const TextStyle(fontSize: 14, color: Color(0xFF999999)),
          ),
        ],
      ),
    );
  }

  void _openDeliveryDetails(CourierOrder delivery) {
    context.push(
      '${AppRoutes.courierHome}/${AppRoutes.courierOrderDetails}',
      extra: delivery,
    );
  }

  void _showStatistics() {
    final deliveredCount = _deliveries
        .where((d) => d.status == OrderStatus.delivered)
        .length;
    final cancelledCount = _deliveries
        .where((d) => d.status == OrderStatus.cancelled)
        .length;
    final totalEarnings = _deliveries
        .where((d) => d.status == OrderStatus.delivered)
        .fold(0.0, (sum, d) => sum + d.estimatedPrice);
    final statistics = {
      'totalDeliveries': _deliveries.length,
      'deliveredCount': deliveredCount,
      'cancelledCount': cancelledCount,
      'totalEarnings': totalEarnings,
      'averageEarnings': deliveredCount > 0
          ? totalEarnings / deliveredCount
          : 0.0,
    };
    showDialog(
      context: context,
      builder: (context) => DeliveriesStatisticsDialog(statistics: statistics),
    );
  }
}
