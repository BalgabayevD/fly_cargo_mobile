import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/courier/models/order_model.dart';

class OrderDetailsPage extends StatefulWidget {
  final CourierOrder order;

  const OrderDetailsPage({super.key, required this.order});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late CourierOrder _order;

  @override
  void initState() {
    super.initState();
    _order = widget.order;
  }

  void _updateOrderStatus(OrderStatus newStatus) {
    setState(() {
      _order = _order.copyWith(status: newStatus);
    });


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Статус заказа обновлен: ${_order.statusText}'),
        backgroundColor: AppColors.success,
      ),
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
        title: Text(
          _order.orderNumber,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF333333)),
            onPressed: () => _showOrderActions(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _buildStatusCard(),
            const SizedBox(height: 20),


            _buildOrderInfoCard(),
            const SizedBox(height: 20),


            _buildAddressesCard(),
            const SizedBox(height: 20),


            _buildRecipientCard(),
            const SizedBox(height: 20),


            _buildCargoCard(),
            const SizedBox(height: 20),


            _buildAdditionalInfoCard(),
            const SizedBox(height: 20),


            _buildActionButtons(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return AppCard(
      variant: AppCardVariant.filled,
      backgroundColor: _order.statusColor.withValues(alpha: 0.1),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _order.statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  _order.statusText,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: _order.statusColor,
                  ),
                ),
              ),
              if (_order.priority != OrderPriority.medium)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _order.priorityColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _order.priorityText,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _order.priorityColor,
                    ),
                  ),
                ),
            ],
          ),
          if (_order.estimatedDeliveryTime != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 16,
                  color: Color(0xFF666666),
                ),
                const SizedBox(width: 8),
                Text(
                  'Ожидаемая доставка: ${_formatDateTime(_order.estimatedDeliveryTime!)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOrderInfoCard() {
    return AppCardWithTitle(
      title: 'Информация о заказе',
      variant: AppCardVariant.filled,
      child: Column(
        children: [
          _buildInfoRow('Номер заказа', _order.orderNumber),
          _buildInfoRow('Создан', _formatDateTime(_order.createdAt)),
          _buildInfoRow('Тип упаковки', _order.boxName),
          _buildInfoRow('Размеры', _order.boxDimensions),
          _buildInfoRow(
            'Стоимость',
            '${_order.estimatedPrice.toInt()} ${_order.currency}',
          ),
        ],
      ),
    );
  }

  Widget _buildAddressesCard() {
    return AppCardWithTitle(
      title: 'Маршрут доставки',
      variant: AppCardVariant.filled,
      child: Column(
        children: [

          _buildAddressItem(
            icon: Icons.location_on,
            iconColor: const Color(0xFF007AFF),
            title: 'Забрать у отправителя',
            city: _order.pickupAddress.city,
            address: _order.pickupAddress.address,
          ),
          const SizedBox(height: 16),

          const Center(
            child: Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF666666),
              size: 24,
            ),
          ),
          const SizedBox(height: 16),

          _buildAddressItem(
            icon: Icons.location_on,
            iconColor: const Color(0xFF34C759),
            title: 'Доставить получателю',
            city: _order.deliveryAddress.city,
            address: _order.deliveryAddress.address,
          ),
        ],
      ),
    );
  }

  Widget _buildRecipientCard() {
    return AppCardWithTitle(
      title: 'Получатель',
      variant: AppCardVariant.filled,
      child: Column(
        children: [
          _buildInfoRow('Имя', _order.recipientName),
          _buildInfoRow('Телефон', _order.recipientPhone),
          const SizedBox(height: 12),
          Row(
            children: [
              AppButton(
                text: 'Позвонить',
                onPressed: () => _makeCall(_order.recipientPhone),
                size: AppButtonSize.medium,
                variant: AppButtonVariant.outline,
                icon: Icons.phone,
              ),
              const SizedBox(width: 12),
              AppButton(
                text: 'Написать',
                onPressed: () => _sendMessage(_order.recipientPhone),
                size: AppButtonSize.medium,
                variant: AppButtonVariant.outline,
                icon: Icons.message,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCargoCard() {
    return AppCardWithTitle(
      title: 'Информация о грузе',
      variant: AppCardVariant.filled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Описание', _order.cargoDescription ?? 'Не указано'),
          if (_order.photos != null && _order.photos!.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Text(
              'Фотографии:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Добавлено фотографий: ${_order.photos!.length}',
              style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAdditionalInfoCard() {
    if (_order.notes == null && _order.courierName == null) {
      return const SizedBox.shrink();
    }

    return AppCardWithTitle(
      title: 'Дополнительная информация',
      variant: AppCardVariant.filled,
      child: Column(
        children: [
          if (_order.courierName != null)
            _buildInfoRow('Курьер', _order.courierName!),
          if (_order.notes != null) _buildInfoRow('Примечания', _order.notes!),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [

        if (_order.status == OrderStatus.assigned) ...[
          AppButton(
            text: 'Забрать груз',
            onPressed: () => _updateOrderStatus(OrderStatus.pickedUp),
            size: AppButtonSize.extraLarge,
            variant: AppButtonVariant.primary,
            isFullWidth: true,
            icon: Icons.inventory,
          ),
        ] else if (_order.status == OrderStatus.pickedUp) ...[
          AppButton(
            text: 'Начать доставку',
            onPressed: () => _updateOrderStatus(OrderStatus.inTransit),
            size: AppButtonSize.extraLarge,
            variant: AppButtonVariant.primary,
            isFullWidth: true,
            icon: Icons.local_shipping,
          ),
        ] else if (_order.status == OrderStatus.inTransit) ...[
          AppButton(
            text: 'Доставить груз',
            onPressed: () => _updateOrderStatus(OrderStatus.delivered),
            size: AppButtonSize.extraLarge,
            variant: AppButtonVariant.primary,
            isFullWidth: true,
            icon: Icons.check_circle,
          ),
        ],

        const SizedBox(height: 12),


        Column(
          children: [
            AppButton(
              text: 'Сообщить о проблеме',
              onPressed: () => _reportProblem(),
              size: AppButtonSize.large,
              variant: AppButtonVariant.outline,
              icon: Icons.report_problem,
              isFullWidth: true,
            ),
            const SizedBox(height: 12),
            AppButton(
              text: 'Отменить заказ',
              onPressed: () => _cancelOrder(),
              size: AppButtonSize.large,
              variant: AppButtonVariant.danger,
              icon: Icons.cancel,
              isFullWidth: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String city,
    required String address,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF666666),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                city,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                address,
                style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year} в ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  void _showOrderActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Поделиться заказом'),
              onTap: () {
                Navigator.pop(context);

              },
            ),
            ListTile(
              leading: const Icon(Icons.print),
              title: const Text('Печать накладной'),
              onTap: () {
                Navigator.pop(context);

              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('История заказа'),
              onTap: () {
                Navigator.pop(context);

              },
            ),
          ],
        ),
      ),
    );
  }

  void _makeCall(String phone) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Звонок на номер $phone'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _sendMessage(String phone) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Отправка сообщения на номер $phone'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _reportProblem() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Сообщить о проблеме'),
        content: const Text('Опишите проблему с заказом'),
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
                  content: Text('Проблема зафиксирована'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            child: const Text('Отправить'),
          ),
        ],
      ),
    );
  }

  void _cancelOrder() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Отменить заказ?'),
        content: const Text('Вы уверены, что хотите отменить этот заказ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Нет'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _updateOrderStatus(OrderStatus.cancelled);
            },
            child: const Text(
              'Да, отменить',
              style: TextStyle(color: Color(0xFFFF3B30)),
            ),
          ),
        ],
      ),
    );
  }
}
