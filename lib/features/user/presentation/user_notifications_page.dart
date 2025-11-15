import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/user/models/user_profile_model.dart';

class UserNotificationsPage extends StatefulWidget {
  const UserNotificationsPage({super.key});

  @override
  State<UserNotificationsPage> createState() => _UserNotificationsPageState();
}

class _UserNotificationsPageState extends State<UserNotificationsPage> {
  late NotificationSettings _notificationSettings;

  @override
  void initState() {
    super.initState();
    _notificationSettings = const NotificationSettings(
      orderUpdates: true,
      promotions: true,
      paymentNotifications: true,
      systemNotifications: false,
    );
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
          TextButton(
            onPressed: _saveSettings,
            child: const Text(
              'Сохранить',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _buildNotificationSection(),
            const SizedBox(height: 20),


            _buildNotificationHistory(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSection() {
    return AppCard(
      variant: AppCardVariant.outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Настройки уведомлений',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 20),


          _buildNotificationItem(
            icon: Icons.local_shipping,
            title: 'Обновления заказов',
            subtitle: 'Уведомления о статусе ваших заказов',
            value: _notificationSettings.orderUpdates,
            onChanged: (value) {
              setState(() {
                _notificationSettings = _notificationSettings.copyWith(
                  orderUpdates: value,
                );
              });
            },
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),


          _buildNotificationItem(
            icon: Icons.local_offer,
            title: 'Промоакции и скидки',
            subtitle: 'Специальные предложения и акции',
            value: _notificationSettings.promotions,
            onChanged: (value) {
              setState(() {
                _notificationSettings = _notificationSettings.copyWith(
                  promotions: value,
                );
              });
            },
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),


          _buildNotificationItem(
            icon: Icons.payment,
            title: 'Платежные уведомления',
            subtitle: 'Информация о платежах и транзакциях',
            value: _notificationSettings.paymentNotifications,
            onChanged: (value) {
              setState(() {
                _notificationSettings = _notificationSettings.copyWith(
                  paymentNotifications: value,
                );
              });
            },
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),


          _buildNotificationItem(
            icon: Icons.settings,
            title: 'Системные уведомления',
            subtitle: 'Важные обновления приложения',
            value: _notificationSettings.systemNotifications,
            onChanged: (value) {
              setState(() {
                _notificationSettings = _notificationSettings.copyWith(
                  systemNotifications: value,
                );
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF666666), size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF007AFF),
      ),
    );
  }

  Widget _buildNotificationHistory() {
    return AppCard(
      variant: AppCardVariant.outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'История уведомлений',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              TextButton(
                onPressed: _clearHistory,
                child: const Text(
                  'Очистить',
                  style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ..._getMockNotifications().map(
            (notification) => _buildNotificationHistoryItem(notification),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationHistoryItem(NotificationItem notification) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: notification.isRead
                  ? Colors.transparent
                  : const Color(0xFF007AFF),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: notification.isRead
                        ? FontWeight.w400
                        : FontWeight.w600,
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification.message,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatTime(notification.timestamp),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF999999),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<NotificationItem> _getMockNotifications() {
    return [
      NotificationItem(
        id: '1',
        title: 'Заказ завершен',
        message: 'Ваш заказ #12345 успешно доставлен',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        isRead: false,
      ),
      NotificationItem(
        id: '2',
        title: 'Новая акция',
        message: 'Скидка 20% на доставку по городу',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        isRead: false,
      ),
      NotificationItem(
        id: '3',
        title: 'Платеж прошел',
        message: 'С вашей карты Visa -2395 списано 2500 ₸',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
      ),
      NotificationItem(
        id: '4',
        title: 'Заказ в пути',
        message: 'Ваш заказ #12344 взят курьером',
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        isRead: true,
      ),
    ];
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} мин назад';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ч назад';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} дн назад';
    } else {
      return '${timestamp.day}.${timestamp.month}.${timestamp.year}';
    }
  }

  void _saveSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Настройки сохранены'),
        backgroundColor: Color(0xFF34C759),
      ),
    );
    Navigator.pop(context);
  }

  void _clearHistory() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Очистить историю'),
        content: const Text(
          'Вы уверены, что хотите очистить всю историю уведомлений?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('История очищена'),
                  backgroundColor: Color(0xFF34C759),
                ),
              );
            },
            child: const Text(
              'Очистить',
              style: TextStyle(color: Color(0xFFFF3B30)),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
  final bool isRead;

  const NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.isRead,
  });
}
