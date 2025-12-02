import 'package:flutter/material.dart';
import 'package:fly_cargo/features/courier/models/order_model.dart';
import 'package:go_router/go_router.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
class CourierHomePage extends StatefulWidget {
  const CourierHomePage({super.key});
  @override
  State<CourierHomePage> createState() => _CourierHomePageState();
}
class _CourierHomePageState extends State<CourierHomePage> {
  List<CourierOrder> _orders = [];
  bool _isLoading = true;
  String _selectedFilter = 'all';
  @override
  void initState() {
    super.initState();
    _loadOrders();
  }
  void _loadOrders() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _orders = _getMockOrders();
        _isLoading = false;
      });
    });
  }
  List<CourierOrder> _getMockOrders() {
    return [
      CourierOrder(
        id: '1',
        orderNumber: 'FC-2024-001',
        status: OrderStatus.assigned,
        priority: OrderPriority.high,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        estimatedDeliveryTime: DateTime.now().add(const Duration(hours: 4)),
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
        estimatedPrice: 2500,
        currency: '₸',
        courierId: 'courier_1',
        courierName: 'Иван Петров',
      ),
      CourierOrder(
        id: '2',
        orderNumber: 'FC-2024-002',
        status: OrderStatus.pickedUp,
        priority: OrderPriority.medium,
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        estimatedDeliveryTime: DateTime.now().add(const Duration(hours: 2)),
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
        estimatedPrice: 3500,
        currency: '₸',
        courierId: 'courier_1',
        courierName: 'Иван Петров',
      ),
      CourierOrder(
        id: '3',
        orderNumber: 'FC-2024-003',
        status: OrderStatus.pending,
        priority: OrderPriority.urgent,
        createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
        estimatedDeliveryTime: DateTime.now().add(const Duration(hours: 1)),
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
        estimatedPrice: 1800,
        currency: '₸',
      ),
    ];
  }
  List<CourierOrder> get _filteredOrders {
    switch (_selectedFilter) {
      case 'pending':
        return _orders
            .where((order) => order.status == OrderStatus.pending)
            .toList();
      case 'assigned':
        return _orders
            .where((order) => order.status == OrderStatus.assigned)
            .toList();
      case 'in_progress':
        return _orders
            .where(
              (order) =>
                  order.status == OrderStatus.pickedUp ||
                  order.status == OrderStatus.inTransit,
            )
            .toList();
      default:
        return _orders;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Заказы курьера',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Color(0xFF333333)),
            onPressed: () => _openProfile(),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Color(0xFF333333)),
            onPressed: _loadOrders,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('all', 'Все заказы'),
                  const SizedBox(width: 8),
                  _buildFilterChip('pending', 'Ожидают'),
                  const SizedBox(width: 8),
                  _buildFilterChip('assigned', 'Назначены'),
                  const SizedBox(width: 8),
                  _buildFilterChip('in_progress', 'В работе'),
                ],
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredOrders.isEmpty
                ? _buildEmptyState()
                : RefreshIndicator(
                    onRefresh: () async {
                      _loadOrders();
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _filteredOrders.length,
                      itemBuilder: (context, index) {
                        final order = _filteredOrders[index];
                        return OrderCard(
                          order: order,
                          onTap: () => _openOrderDetails(order),
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
          const Icon(Icons.inbox_outlined, size: 64, color: Color(0xFFCCCCCC)),
          const SizedBox(height: 16),
          const Text(
            'Нет заказов',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedFilter == 'all'
                ? 'У вас пока нет заказов'
                : 'Нет заказов с выбранным фильтром',
            style: const TextStyle(fontSize: 14, color: Color(0xFF999999)),
          ),
        ],
      ),
    );
  }
  void _openOrderDetails(CourierOrder order) {
    context.push(
      '${AppRoutes.courierHome}/${AppRoutes.courierOrderDetails}',
      extra: order,
    );
  }
  void _openProfile() {
    context.push('${AppRoutes.courierHome}/${AppRoutes.courierProfile}');
  }
}
class OrderCard extends StatelessWidget {
  final CourierOrder order;
  final VoidCallback onTap;
  const OrderCard({required this.order, required this.onTap, super.key});
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
              color: Colors.black.withValues(alpha: 0.05),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.orderNumber,
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
                      color: order.statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      order.statusText,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: order.statusColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (order.priority != OrderPriority.medium)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: order.priorityColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    order.priorityText,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: order.priorityColor,
                    ),
                  ),
                ),
              _buildAddressRow(
                icon: Icons.location_on,
                iconColor: const Color(0xFF007AFF),
                address:
                    '${order.pickupAddress.city}, ${order.pickupAddress.address}',
                label: 'Забрать',
              ),
              const SizedBox(height: 8),
              _buildAddressRow(
                icon: Icons.location_on,
                iconColor: const Color(0xFF34C759),
                address:
                    '${order.deliveryAddress.city}, ${order.deliveryAddress.address}',
                label: 'Доставить',
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.recipientName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Text(
                        order.recipientPhone,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${order.estimatedPrice.toInt()} ${order.currency}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF007AFF),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Создан: ${_formatDateTime(order.createdAt)}',
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
