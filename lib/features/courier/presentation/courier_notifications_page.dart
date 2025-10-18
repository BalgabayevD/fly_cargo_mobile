import 'package:flutter/material.dart';
import 'package:fly_cargo/features/courier/models/courier_profile_model.dart';

class CourierNotificationsPage extends StatefulWidget {
  const CourierNotificationsPage({super.key});

  @override
  State<CourierNotificationsPage> createState() =>
      _CourierNotificationsPageState();
}

class _CourierNotificationsPageState extends State<CourierNotificationsPage> {
  List<CourierNotification> _notifications = [];
  bool _isLoading = true;
  String _selectedFilter = 'all';

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  void _loadNotifications() {
    // Имитация загрузки данных
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _notifications = _getMockNotifications();
        _isLoading = false;
      });
    });
  }

  List<CourierNotification> _getMockNotifications() {
    return [
      CourierNotification(
        id: '1',
        title: 'Новый заказ назначен',
        message:
            'Вам назначен заказ FC-2024-004. Адрес: ул. Абая, 150 → пр. Достык, 85',
        date: DateTime(2024, 1, 20, 10, 30),
        isRead: false,
        type: 'order',
      ),
      CourierNotification(
        id: '2',
        title: 'Заказ доставлен',
        message: 'Заказ FC-2024-001 успешно доставлен. Заработок: 1200 ₸',
        date: DateTime(2024, 1, 20, 9, 15),
        isRead: true,
        type: 'order',
      ),
      CourierNotification(
        id: '3',
        title: 'Бонус начислен',
        message:
            'Вам начислен бонус 500 ₸ за быструю доставку заказа FC-2024-002',
        date: DateTime(2024, 1, 20, 8, 45),
        isRead: true,
        type: 'payment',
      ),
      CourierNotification(
        id: '4',
        title: 'Обновление приложения',
        message:
            'Доступна новая версия приложения. Обновите для улучшенной работы.',
        date: DateTime(2024, 1, 19, 16, 20),
        isRead: true,
        type: 'system',
      ),
      CourierNotification(
        id: '5',
        title: 'Штраф за опоздание',
        message: 'За опоздание на заказ FC-2024-003 с вас удержан штраф 200 ₸',
        date: DateTime(2024, 1, 18, 15, 30),
        isRead: true,
        type: 'payment',
      ),
      CourierNotification(
        id: '6',
        title: 'Новый заказ в вашем районе',
        message:
            'В районе Алматы появился новый заказ. Проверьте список заказов.',
        date: DateTime(2024, 1, 18, 14, 0),
        isRead: true,
        type: 'order',
      ),
    ];
  }

  List<CourierNotification> get _filteredNotifications {
    switch (_selectedFilter) {
      case 'unread':
        return _notifications
            .where((notification) => !notification.isRead)
            .toList();
      case 'orders':
        return _notifications
            .where((notification) => notification.type == 'order')
            .toList();
      case 'payments':
        return _notifications
            .where((notification) => notification.type == 'payment')
            .toList();
      case 'system':
        return _notifications
            .where((notification) => notification.type == 'system')
            .toList();
      default:
        return _notifications;
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
          'Уведомления',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_email_read, color: Color(0xFF333333)),
            onPressed: _markAllAsRead,
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
                  _buildFilterChip('unread', 'Непрочитанные'),
                  const SizedBox(width: 8),
                  _buildFilterChip('orders', 'Заказы'),
                  const SizedBox(width: 8),
                  _buildFilterChip('payments', 'Платежи'),
                  const SizedBox(width: 8),
                  _buildFilterChip('system', 'Система'),
                ],
              ),
            ),
          ),

          // Список уведомлений
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredNotifications.isEmpty
                ? _buildEmptyState()
                : RefreshIndicator(
                    onRefresh: () async {
                      _loadNotifications();
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _filteredNotifications.length,
                      itemBuilder: (context, index) {
                        final notification = _filteredNotifications[index];
                        return NotificationCard(
                          notification: notification,
                          onTap: () => _markAsRead(notification),
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
            Icons.notifications_none,
            size: 64,
            color: Color(0xFFCCCCCC),
          ),
          const SizedBox(height: 16),
          const Text(
            'Нет уведомлений',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedFilter == 'all'
                ? 'У вас пока нет уведомлений'
                : 'Нет уведомлений с выбранным фильтром',
            style: const TextStyle(fontSize: 14, color: Color(0xFF999999)),
          ),
        ],
      ),
    );
  }

  void _markAsRead(CourierNotification notification) {
    setState(() {
      final index = _notifications.indexWhere((n) => n.id == notification.id);
      if (index != -1) {
        _notifications[index] = CourierNotification(
          id: notification.id,
          title: notification.title,
          message: notification.message,
          date: notification.date,
          isRead: true,
          type: notification.type,
        );
      }
    });
  }

  void _markAllAsRead() {
    setState(() {
      _notifications = _notifications
          .map(
            (notification) => CourierNotification(
              id: notification.id,
              title: notification.title,
              message: notification.message,
              date: notification.date,
              isRead: true,
              type: notification.type,
            ),
          )
          .toList();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Все уведомления отмечены как прочитанные'),
        backgroundColor: Color(0xFF34C759),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final CourierNotification notification;
  final VoidCallback onTap;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: notification.isRead ? Colors.white : const Color(0xFFF8F9FF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: notification.isRead
                ? const Color(0xFFE0E0E0)
                : const Color(0xFF007AFF).withValues(alpha: 0.3),
            width: notification.isRead ? 1 : 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Иконка типа уведомления
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: notification.typeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getNotificationIcon(notification.type),
                  color: notification.typeColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),

              // Содержимое уведомления
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: notification.isRead
                                  ? FontWeight.w500
                                  : FontWeight.w600,
                              color: const Color(0xFF333333),
                            ),
                          ),
                        ),
                        if (!notification.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF007AFF),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.message,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF666666),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: notification.typeColor.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            notification.typeText,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: notification.typeColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          _formatDateTime(notification.date),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF999999),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'order':
        return Icons.local_shipping;
      case 'payment':
        return Icons.account_balance_wallet;
      case 'system':
        return Icons.settings;
      default:
        return Icons.notifications;
    }
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
