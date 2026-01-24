part of 'client_order_bloc.dart';

sealed class ClientOrderState {
  const ClientOrderState();
}

class ClientOrderInitialState extends ClientOrderState {
  const ClientOrderInitialState();
}

class ClientOrderLoadingState extends ClientOrderState {
  final int orderId;

  const ClientOrderLoadingState(this.orderId);
}

class ClientOrderLoadedState extends ClientOrderState with EquatableMixin {
  final OrderEntity order;

  const ClientOrderLoadedState({required this.order});

  @override
  List<Object?> get props => [order];

  String formatDate(String dateTime) {
    try {
      final date = DateTime.parse(dateTime);
      final formatter = DateFormat('d MMMM', 'ru');
      return formatter.format(date.toLocal());
    } catch (e) {
      return dateTime;
    }
  }

  bool get isShowPay => !order.isPaid;
  List<TimelineData> get timeline {
    List<TimelineData> values = [];

    if (order.histories.any((e) => e.status == 'submitted')) {
      final submitted = order.histories.firstWhere(
        (e) => e.status == 'submitted',
      );
      values.add(
        TimelineData(
          isFirst: true,
          isLast: false,
          isSelected: true,
          title: 'Посылка отправлена',
          description: formatDate(submitted.createdAt!),
        ),
      );
    } else {
      values.add(
        TimelineData(
          isFirst: true,
          isLast: false,
          isSelected: false,
          title: 'Посылка отправлена',
          description: '',
        ),
      );
    }

    if (order.histories.any((e) => e.status == 'accounted')) {
      final accounted = order.histories.firstWhere(
        (e) => e.status == 'accounted',
      );
      values.add(
        TimelineData(
          isFirst: false,
          isLast: false,
          isSelected: true,
          title: 'Обработан на складе',
          description: formatDate(accounted.createdAt!),
        ),
      );
    } else {
      values.add(
        TimelineData(
          isFirst: false,
          isLast: false,
          isSelected: false,
          title: 'Обработан на складе',
          description: '',
        ),
      );
    }

    if (order.histories.any((e) => e.status == 'dispatched')) {
      final dispatched = order.histories.firstWhere(
        (e) => e.status == 'dispatched',
      );
      values.add(
        TimelineData(
          isFirst: false,
          isLast: false,
          isSelected: true,
          title: 'Доставка в г. ${order.toCity?.name}',
          description: formatDate(dispatched.createdAt!),
        ),
      );
    } else {
      values.add(
        TimelineData(
          isFirst: false,
          isLast: false,
          isSelected: false,
          title: 'Доставка в г. ${order.toCity?.name}',
          description: '',
        ),
      );
    }

    if (order.histories.any((e) => e.status == 'arrived')) {
      final arrived = order.histories.firstWhere(
        (e) => e.status == 'arrived',
      );
      values.add(
        TimelineData(
          isFirst: false,
          isLast: true,
          isSelected: true,
          title: 'Передано курьеру',
          description: formatDate(arrived.createdAt!),
        ),
      );
    } else {
      values.add(
        TimelineData(
          isFirst: false,
          isLast: true,
          isSelected: false,
          title: 'Передано курьеру',
          description: '',
        ),
      );
    }

    return values;
  }
}

class ClientOrderPayState extends ClientOrderLoadedState {
  final bool isLoading;
  final bool isSuccess;
  final int cardId;

  const ClientOrderPayState({
    required this.isLoading,
    required this.cardId,
    required super.order,
    this.isSuccess = true,
  });

  @override
  List<Object?> get props => [isLoading, cardId, order];

  ClientOrderPayState copyWith({
    bool? isLoading,
    int? cardId,
    OrderEntity? order,
    bool? isSuccess,
  }) {
    return ClientOrderPayState(
      isLoading: isLoading ?? this.isLoading,
      cardId: cardId ?? this.cardId,
      order: order ?? this.order,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

class TimelineData {
  final bool isFirst;
  final bool isLast;
  final bool isSelected;
  final String title;
  final String description;

  const TimelineData({
    required this.isFirst,
    required this.isLast,
    required this.isSelected,
    required this.title,
    required this.description,
  });
}
