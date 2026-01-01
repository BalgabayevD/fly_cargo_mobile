import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_type.dart';
import 'package:fly_cargo/features/orders/data/models/order_model.dart';
import 'package:intl/intl.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderModel order;
  final UserType userType;

  const OrderDetailPage({
    required this.order,
    required this.userType,
    super.key,
  });

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final formatter = DateFormat('d MMMM', 'ru');
      return formatter.format(date.toLocal());
    } catch (e) {
      return dateString;
    }
  }

  String _getDeliveryDate() {
    try {
      final date = DateTime.parse(order.createdAt).add(const Duration(days: 3));
      final formatter = DateFormat('d MMMM', 'ru');
      return 'Доставка в ${formatter.format(date)}';
    } catch (e) {
      return 'Доставка';
    }
  }

  @override
  Widget build(BuildContext context) {
    final price = order.priceCalculations?.sellingPrice ?? order.price ?? 0;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.surface5, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Заказ ${order.id}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.surface5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined, color: AppColors.surface5),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                _getDeliveryDate(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.surface5,
                ),
              ),
            ),

            SizedBox(height: 24),
            OrderTimeline(
              steps: [
                TimelineStep(
                  title: 'Посылка отправлена',
                  date: _formatDate(order.createdAt),
                  isCompleted: true,
                ),
                TimelineStep(
                  title: 'Обработан на складе',
                  date: _formatDate(order.createdAt),
                  isCompleted: false,
                ),
                TimelineStep(
                  title: 'Доставка в ${order.toCity?.name ?? 'г. Астана'}',
                  date: _formatDate(
                    DateTime.parse(
                      order.createdAt,
                    ).add(Duration(days: 1)).toIso8601String(),
                  ),
                  isCompleted: false,
                ),
                TimelineStep(
                  title: 'Передано курьеру',
                  date: _formatDate(
                    DateTime.parse(
                      order.createdAt,
                    ).add(Duration(days: 1)).toIso8601String(),
                  ),
                  isCompleted: false,
                ),
              ],
            ),

            SizedBox(height: 24),
            if (order.isPaid != null && !order.isPaid!) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: OrderPaymentButton(
                  price: price,
                  userType: userType,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 32),
            ],
            OrderInfoSection(
              label: 'Получатель',
              value: '${order.toName ?? ''}, ${order.toPhone ?? ''}',
            ),

            SizedBox(height: 24),
            OrderInfoSection(
              label: 'Доставка',
              value: '${order.toCity?.name ?? ''}, ${order.toAddress}',
            ),

            SizedBox(height: 24),
            if (order.description.isNotEmpty) ...[
              OrderDescriptionSection(
                description: order.description,
                photos: order.contentPhotos,
              ),
              SizedBox(height: 24),
            ],
            if (order.isPaid != null && !order.isPaid!) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CopyPaymentLinkButton(
                  orderId: order.id,
                ),
              ),
              SizedBox(height: 16),
            ],
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: CancelOrderButton(
                onPressed: () {},
              ),
            ),

            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class OrderTimeline extends StatelessWidget {
  final List<TimelineStep> steps;

  const OrderTimeline({
    required this.steps,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: List.generate(
          steps.length,
          (index) => TimelineStepWidget(
            step: steps[index],
            isLast: index == steps.length - 1,
          ),
        ),
      ),
    );
  }
}

class TimelineStep {
  final String title;
  final String date;
  final bool isCompleted;

  const TimelineStep({
    required this.title,
    required this.date,
    required this.isCompleted,
  });
}

class TimelineStepWidget extends StatelessWidget {
  final TimelineStep step;
  final bool isLast;

  const TimelineStepWidget({
    required this.step,
    required this.isLast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: step.isCompleted ? Color(0xFF5C3A31) : AppColors.white,
                  border: Border.all(
                    color: step.isCompleted
                        ? Color(0xFF5C3A31)
                        : Color(0xFFE0E0E0),
                    width: 2,
                  ),
                ),
                child: step.isCompleted
                    ? Icon(
                        Icons.check,
                        color: AppColors.white,
                        size: 18,
                      )
                    : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    color: Color(0xFFE0E0E0),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.surface5,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    step.date,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.surface4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderPaymentButton extends StatelessWidget {
  final double price;
  final UserType userType;
  final VoidCallback onPressed;

  const OrderPaymentButton({
    required this.price,
    required this.userType,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF5C3A31),
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          userType.isUser
              ? 'Оплатить ${price.toStringAsFixed(0)} тг'
              : 'Привязать штрихкод',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class OrderInfoSection extends StatelessWidget {
  final String label;
  final String value;

  const OrderInfoSection({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.surface4,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.surface5,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDescriptionSection extends StatelessWidget {
  final String description;
  final List<String> photos;

  const OrderDescriptionSection({
    required this.description,
    required this.photos,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Описание',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.surface4,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.surface5,
            ),
          ),
          if (photos.isNotEmpty) ...[
            SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: photos.length,
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemBuilder: (context, index) => OrderPhotoItem(
                  photoUrl: photos[index],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class OrderPhotoItem extends StatelessWidget {
  final String photoUrl;

  const OrderPhotoItem({
    required this.photoUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 120,
        height: 120,
        color: AppColors.surface1,
        child: Image.network(
          photoUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.surface2,
            child: Icon(
              Icons.image_outlined,
              color: AppColors.surface4,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class CopyPaymentLinkButton extends StatelessWidget {
  final int orderId;

  const CopyPaymentLinkButton({
    required this.orderId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final link = 'https://fly-cargo.kz/payment/$orderId';
        Clipboard.setData(ClipboardData(text: link));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ссылка скопирована'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Скопировать ссылку на платеж',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.surface5,
            ),
          ),
        ),
      ),
    );
  }
}

class CancelOrderButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CancelOrderButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.danger,
          side: BorderSide(color: AppColors.danger, width: 1.5),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Отменить',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
