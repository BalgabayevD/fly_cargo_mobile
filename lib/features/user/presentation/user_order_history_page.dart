import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/user/models/user_profile_model.dart';

class UserOrderHistoryPage extends StatefulWidget {
  const UserOrderHistoryPage({super.key});

  @override
  State<UserOrderHistoryPage> createState() => _UserOrderHistoryPageState();
}

class _UserOrderHistoryPageState extends State<UserOrderHistoryPage> {
  late List<Order> _orders;
  String _selectedFilter = 'all';

  @override
  void initState() {
    super.initState();
    _orders = _getMockOrders();
  }

  List<Order> _getMockOrders() {
    return [
      Order(
        id: 'order_1',
        fromAddress: 'Алматы, ул. Абая 1',
        toAddress: 'Астана, ул. Республики 10',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        status: OrderStatus.completed,
        cost: 2500.0,
        description: 'Документы',
      ),
      Order(
        id: 'order_2',
        fromAddress: 'Алматы, ул. Достык 15',
        toAddress: 'Алматы, ул. Сатпаева 25',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        status: OrderStatus.completed,
        cost: 1200.0,
        description: 'Пакет',
      ),
      Order(
        id: 'order_3',
        fromAddress: 'Алматы, ул. Толе би 50',
        toAddress: 'Алматы, ул. Назарбаева 100',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        status: OrderStatus.inProgress,
        cost: 1800.0,
        description: 'Посылка',
      ),
      Order(
        id: 'order_4',
        fromAddress: 'Алматы, ул. Пушкина 20',
        toAddress: 'Алматы, ул. Гоголя 30',
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        status: OrderStatus.cancelled,
        cost: 900.0,
        description: 'Документы',
      ),
      Order(
        id: 'order_5',
        fromAddress: 'Алматы, ул. Фурманова 10',
        toAddress: 'Алматы, ул. Жамбыла 40',
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        status: OrderStatus.completed,
        cost: 1500.0,
        description: 'Пакет',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final filteredOrders = _getFilteredOrders();

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
          'История заказов',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Color(0xFF333333)),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          // Фильтры
          _buildFilterChips(),

          // Список заказов
          Expanded(
            child: filteredOrders.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: filteredOrders.length,
                    itemBuilder: (context, index) {
                      return _buildOrderCard(filteredOrders[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterChip('all', 'Все'),
          const SizedBox(width: 8),
          _buildFilterChip('completed', 'Завершенные'),
          const SizedBox(width: 8),
          _buildFilterChip('in_progress', 'В процессе'),
          const SizedBox(width: 8),
          _buildFilterChip('cancelled', 'Отмененные'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String value, String label) {
    final isSelected = _selectedFilter == value;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedFilter = value;
        });
      },
      selectedColor: const Color(0xFF007AFF).withValues(alpha: 0.2),
      checkmarkColor: const Color(0xFF007AFF),
      labelStyle: TextStyle(
        color: isSelected ? const Color(0xFF007AFF) : const Color(0xFF666666),
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.history,
              size: 60,
              color: Color(0xFF999999),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Заказов не найдено',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'У вас пока нет заказов с выбранным фильтром',
            style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Order order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: AppCard(
        variant: AppCardVariant.outlined,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок заказа
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Заказ #${order.id.split('_').last}',
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

            // Адреса
            _buildAddressRow(
              icon: Icons.location_on,
              label: 'Откуда',
              address: order.fromAddress,
            ),
            const SizedBox(height: 8),
            _buildAddressRow(
              icon: Icons.location_on,
              label: 'Куда',
              address: order.toAddress,
            ),
            const SizedBox(height: 12),

            // Описание и стоимость
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    order.description ?? 'Без описания',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                  ),
                ),
                Text(
                  '${order.cost.toStringAsFixed(0)} ₸',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Дата и действия
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDate(order.createdAt),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF999999),
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () => _viewOrderDetails(order),
                      child: const Text(
                        'Подробнее',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF007AFF),
                        ),
                      ),
                    ),
                    if (order.status == OrderStatus.completed)
                      TextButton(
                        onPressed: () => _repeatOrder(order),
                        child: const Text(
                          'Повторить',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF34C759),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressRow({
    required IconData icon,
    required String label,
    required String address,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: const Color(0xFF666666)),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Color(0xFF999999)),
              ),
              Text(
                address,
                style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Order> _getFilteredOrders() {
    switch (_selectedFilter) {
      case 'completed':
        return _orders
            .where((order) => order.status == OrderStatus.completed)
            .toList();
      case 'in_progress':
        return _orders
            .where((order) => order.status == OrderStatus.inProgress)
            .toList();
      case 'cancelled':
        return _orders
            .where((order) => order.status == OrderStatus.cancelled)
            .toList();
      default:
        return _orders;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Сегодня';
    } else if (difference.inDays == 1) {
      return 'Вчера';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} дн назад';
    } else {
      return '${date.day}.${date.month}.${date.year}';
    }
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Фильтр заказов',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 20),
            ...['all', 'completed', 'in_progress', 'cancelled'].map((filter) {
              final labels = {
                'all': 'Все заказы',
                'completed': 'Завершенные',
                'in_progress': 'В процессе',
                'cancelled': 'Отмененные',
              };
              return ListTile(
                title: Text(labels[filter]!),
                trailing: _selectedFilter == filter
                    ? const Icon(Icons.check, color: Color(0xFF007AFF))
                    : null,
                onTap: () {
                  setState(() {
                    _selectedFilter = filter;
                  });
                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  void _viewOrderDetails(Order order) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Детали заказа',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 20),
            _buildDetailRow('Номер заказа', '#${order.id.split('_').last}'),
            _buildDetailRow('Статус', order.statusText),
            _buildDetailRow('Откуда', order.fromAddress),
            _buildDetailRow('Куда', order.toAddress),
            _buildDetailRow('Описание', order.description ?? 'Без описания'),
            _buildDetailRow('Стоимость', '${order.cost.toStringAsFixed(0)} ₸'),
            _buildDetailRow('Дата создания', _formatDate(order.createdAt)),
            const SizedBox(height: 20),
            AppButton(
              text: 'Закрыть',
              onPressed: () => Navigator.pop(context),
              size: AppButtonSize.large,
              variant: AppButtonVariant.primary,
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF333333),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _repeatOrder(Order order) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Функция повторного заказа будет реализована'),
        backgroundColor: Color(0xFF007AFF),
      ),
    );
  }
}
