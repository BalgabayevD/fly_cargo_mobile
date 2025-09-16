import 'package:flutter/material.dart';
import 'package:fly_cargo/features/courier/models/order_model.dart';
import 'package:fly_cargo/features/courier/presentation/order_details_page.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/deliveries_filter_widget.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/deliveries_statistics_dialog.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/delivery_card_widget.dart';
import 'package:fly_cargo/features/courier/services/deliveries_service.dart';

class CourierDeliveriesPage extends StatefulWidget {
  const CourierDeliveriesPage({super.key});

  @override
  State<CourierDeliveriesPage> createState() => _CourierDeliveriesPageState();
}

class _CourierDeliveriesPageState extends State<CourierDeliveriesPage> {
  List<CourierOrder> _deliveries = [];
  bool _isLoading = true;
  String _selectedFilter = 'all';
  late final DeliveriesService _deliveriesService;

  @override
  void initState() {
    super.initState();
    _deliveriesService = MockDeliveriesService();
    _loadDeliveries();
  }

  Future<void> _loadDeliveries() async {
    try {
      final deliveries = await _deliveriesService.getDeliveries();
      setState(() {
        _deliveries = deliveries;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Обработка ошибки
    }
  }

  List<CourierOrder> get _filteredDeliveries {
    return _deliveriesService.filterDeliveries(_deliveries, _selectedFilter);
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
          onPressed: () => Navigator.pop(context),
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
          // Фильтры
          DeliveriesFilterWidget(
            selectedFilter: _selectedFilter,
            onFilterChanged: (filter) {
              setState(() {
                _selectedFilter = filter;
              });
            },
          ),

          // Список доставок
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredDeliveries.isEmpty
                ? _buildEmptyState()
                : RefreshIndicator(
                    onRefresh: () async {
                      _loadDeliveries();
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailsPage(order: delivery),
      ),
    );
  }

  void _showStatistics() {
    final statistics = _deliveriesService.getStatistics(_deliveries);
    showDialog(
      context: context,
      builder: (context) => DeliveriesStatisticsDialog(statistics: statistics),
    );
  }
}
