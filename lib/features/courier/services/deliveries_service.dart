import 'package:fly_cargo/features/courier/models/order_model.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
abstract class DeliveriesService {
  Future<List<CourierOrder>> getDeliveries();
  List<CourierOrder> filterDeliveries(
    List<CourierOrder> deliveries,
    String filter,
  );
  Map<String, dynamic> getStatistics(List<CourierOrder> deliveries);
}
class MockDeliveriesService implements DeliveriesService {
  @override
  Future<List<CourierOrder>> getDeliveries() async {
    await Future.delayed(const Duration(seconds: 1));
    return _getMockDeliveries();
  }
  @override
  List<CourierOrder> filterDeliveries(
    List<CourierOrder> deliveries,
    String filter,
  ) {
    switch (filter) {
      case 'delivered':
        return deliveries
            .where((delivery) => delivery.status == OrderStatus.delivered)
            .toList();
      case 'cancelled':
        return deliveries
            .where((delivery) => delivery.status == OrderStatus.cancelled)
            .toList();
      case 'this_week':
        final weekAgo = DateTime.now().subtract(const Duration(days: 7));
        return deliveries
            .where((delivery) => delivery.createdAt.isAfter(weekAgo))
            .toList();
      case 'this_month':
        final monthAgo = DateTime.now().subtract(const Duration(days: 30));
        return deliveries
            .where((delivery) => delivery.createdAt.isAfter(monthAgo))
            .toList();
      default:
        return deliveries;
    }
  }
  @override
  Map<String, dynamic> getStatistics(List<CourierOrder> deliveries) {
    final deliveredCount = deliveries
        .where((d) => d.status == OrderStatus.delivered)
        .length;
    final cancelledCount = deliveries
        .where((d) => d.status == OrderStatus.cancelled)
        .length;
    final totalEarnings = deliveries
        .where((d) => d.status == OrderStatus.delivered)
        .fold(0.0, (sum, d) => sum + d.estimatedPrice);
    return {
      'totalDeliveries': deliveries.length,
      'deliveredCount': deliveredCount,
      'cancelledCount': cancelledCount,
      'totalEarnings': totalEarnings,
      'averageEarnings': deliveredCount > 0
          ? totalEarnings / deliveredCount
          : 0.0,
    };
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
}
