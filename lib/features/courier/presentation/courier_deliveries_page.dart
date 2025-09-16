import 'package:flutter/material.dart';
import 'package:fly_cargo/features/courier/models/order_model.dart';
import 'package:fly_cargo/features/courier/presentation/order_details_page.dart';
import 'package:fly_cargo/features/destination/models/address_model.dart';

class CourierDeliveriesPage extends StatefulWidget {
  const CourierDeliveriesPage({super.key});

  @override
  State<CourierDeliveriesPage> createState() => _CourierDeliveriesPageState();
}

class _CourierDeliveriesPageState extends State<CourierDeliveriesPage> {
  List<CourierOrder> _deliveries = [];
  bool _isLoading = true;
  String _selectedFilter = 'all';

  @override
  void initState() {
    super.initState();
    _loadDeliveries();
  }

  void _loadDeliveries() {
    // Имитация загрузки данных
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _deliveries = _getMockDeliveries();
        _isLoading = false;
      });
    });
  }

  List<CourierOrder> _getMockDeliveries() {
    return [
      CourierOrder(
        id: '1',
        orderNumber: 'FC-2024-001',
        status: OrderStatus.delivered,
        priority: OrderPriority.high,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        estimatedDeliveryTime: DateTime.now().subtract(
          const Duration(hours: 2),
        ),
        pickupAddress: const AddressModel(
          city: 'Алматы',
          address: 'ул. Абая, 150',
          cityId: 'almaty',
        ),
        deliveryAddress: const AddressModel(
          city: 'Алматы',
          address: 'пр. Достык, 85',
          cityId: 'almaty',
        ),
        recipientName: 'Айдар Нурланов',
        recipientPhone: '+7 777 123 4567',
        cargoDescription: 'Документы и подарки',
        boxType: 'small',
        boxName: 'Маленькая коробка',
        boxDimensions: '20x15x10 см',
        estimatedPrice: 1200,
        currency: '₸',
        courierId: 'courier_1',
        courierName: 'Дамир',
      ),
      CourierOrder(
        id: '2',
        orderNumber: 'FC-2024-002',
        status: OrderStatus.delivered,
        priority: OrderPriority.medium,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        estimatedDeliveryTime: DateTime.now().subtract(const Duration(days: 1)),
        pickupAddress: const AddressModel(
          city: 'Алматы',
          address: 'ул. Сатпаева, 90',
          cityId: 'almaty',
        ),
        deliveryAddress: const AddressModel(
          city: 'Алматы',
          address: 'ул. Толе би, 200',
          cityId: 'almaty',
        ),
        recipientName: 'Мария Ким',
        recipientPhone: '+7 777 234 5678',
        cargoDescription: 'Электроника',
        boxType: 'medium',
        boxName: 'Средняя коробка',
        boxDimensions: '30x25x20 см',
        estimatedPrice: 1500,
        currency: '₸',
        courierId: 'courier_1',
        courierName: 'Дамир',
      ),
      CourierOrder(
        id: '3',
        orderNumber: 'FC-2024-003',
        status: OrderStatus.cancelled,
        priority: OrderPriority.urgent,
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        estimatedDeliveryTime: DateTime.now().subtract(const Duration(days: 2)),
        pickupAddress: const AddressModel(
          city: 'Алматы',
          address: 'ул. Гоголя, 45',
          cityId: 'almaty',
        ),
        deliveryAddress: const AddressModel(
          city: 'Алматы',
          address: 'ул. Пушкина, 120',
          cityId: 'almaty',
        ),
        recipientName: 'Асылбек Ахметов',
        recipientPhone: '+7 777 345 6789',
        cargoDescription: 'Лекарства',
        boxType: 'small',
        boxName: 'Маленькая коробка',
        boxDimensions: '20x15x10 см',
        estimatedPrice: 800,
        currency: '₸',
        courierId: 'courier_1',
        courierName: 'Дамир',
      ),
      CourierOrder(
        id: '4',
        orderNumber: 'FC-2024-004',
        status: OrderStatus.delivered,
        priority: OrderPriority.low,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        estimatedDeliveryTime: DateTime.now().subtract(const Duration(days: 4)),
        pickupAddress: const AddressModel(
          city: 'Алматы',
          address: 'ул. Фурманова, 78',
          cityId: 'almaty',
        ),
        deliveryAddress: const AddressModel(
          city: 'Алматы',
          address: 'ул. Желтоксан, 156',
          cityId: 'almaty',
        ),
        recipientName: 'Елена Смирнова',
        recipientPhone: '+7 777 456 7890',
        cargoDescription: 'Книги',
        boxType: 'large',
        boxName: 'Большая коробка',
        boxDimensions: '40x30x25 см',
        estimatedPrice: 2000,
        currency: '₸',
        courierId: 'courier_1',
        courierName: 'Дамир',
      ),
    ];
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('all', 'Все'),
                  const SizedBox(width: 8),
                  _buildFilterChip('delivered', 'Доставлены'),
                  const SizedBox(width: 8),
                  _buildFilterChip('cancelled', 'Отменены'),
                  const SizedBox(width: 8),
                  _buildFilterChip('this_week', 'Эта неделя'),
                  const SizedBox(width: 8),
                  _buildFilterChip('this_month', 'Этот месяц'),
                ],
              ),
            ),
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
                        return DeliveryCard(
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

  Widget _buildFilterChip(String value, String label) {
    final isSelected = _selectedFilter == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF007AFF) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF666666),
          ),
        ),
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
    final deliveredCount = _deliveries
        .where((d) => d.status == OrderStatus.delivered)
        .length;
    final cancelledCount = _deliveries
        .where((d) => d.status == OrderStatus.cancelled)
        .length;
    final totalEarnings = _deliveries
        .where((d) => d.status == OrderStatus.delivered)
        .fold(0.0, (sum, d) => sum + d.estimatedPrice);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Статистика доставок'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStatRow('Всего доставок', '${_deliveries.length}'),
            _buildStatRow('Доставлено', '$deliveredCount'),
            _buildStatRow('Отменено', '$cancelledCount'),
            _buildStatRow('Общий заработок', '${totalEarnings.toInt()} ₸'),
            _buildStatRow(
              'Средний чек',
              '${deliveredCount > 0 ? (totalEarnings / deliveredCount).toInt() : 0} ₸',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryCard extends StatelessWidget {
  final CourierOrder delivery;
  final VoidCallback onTap;

  const DeliveryCard({super.key, required this.delivery, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок с номером заказа и статусом
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    delivery.orderNumber,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: delivery.statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      delivery.statusText,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: delivery.statusColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Адреса
              _buildAddressRow(
                icon: Icons.location_on,
                iconColor: const Color(0xFF007AFF),
                address:
                    '${delivery.pickupAddress.city}, ${delivery.pickupAddress.address}',
                label: 'Забрать',
              ),
              const SizedBox(height: 8),
              _buildAddressRow(
                icon: Icons.location_on,
                iconColor: const Color(0xFF34C759),
                address:
                    '${delivery.deliveryAddress.city}, ${delivery.deliveryAddress.address}',
                label: 'Доставить',
              ),
              const SizedBox(height: 12),

              // Получатель и цена
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        delivery.recipientName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Text(
                        delivery.recipientPhone,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${delivery.estimatedPrice.toInt()} ${delivery.currency}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF007AFF),
                    ),
                  ),
                ],
              ),

              // Время создания
              const SizedBox(height: 8),
              Text(
                'Создан: ${_formatDateTime(delivery.createdAt)}',
                style: const TextStyle(fontSize: 12, color: Color(0xFF999999)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddressRow({
    required IconData icon,
    required Color iconColor,
    required String address,
    required String label,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: iconColor),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            address,
            style: const TextStyle(fontSize: 13, color: Color(0xFF666666)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} дн. назад';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ч. назад';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} мин. назад';
    } else {
      return 'Только что';
    }
  }
}
