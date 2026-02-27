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

    values.add(
      TimelineData(
        isFirst: true,
        isLast: false,
        isSelected: order.isAccounted,
        title: 'Заказ получен в г. ${order.fromCity?.name}',
        description: '',
      ),
    );
    values.add(
      TimelineData(
        isFirst: false,
        isLast: false,
        isSelected: order.isChecked,
        title: 'Заказ прошел обработку',
        description: '',
      ),
    );
    values.add(
      TimelineData(
        isFirst: false,
        isLast: false,
        isSelected: order.isTransit,
        title: 'Заказ отгружен',
        description: '',
      ),
    );
    values.add(
      TimelineData(
        isFirst: false,
        isLast: false,
        isSelected: order.isArrived,
        title: 'Заказ прибыл в г. ${order.toCity?.name}',
        description: '',
      ),
    );
    values.add(
      TimelineData(
        isFirst: false,
        isLast: false,
        isSelected: order.isAssigned,
        title: 'Заказ выдан на доставку',
        description: '',
      ),
    );
    values.add(
      TimelineData(
        isFirst: false,
        isLast: true,
        isSelected: true,
        title: 'Заказ завершен',
        description: '',
      ),
    );

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

class ClientOrderCancelState extends ClientOrderLoadedState {
  final bool isLoading;
  final bool isSuccess;

  const ClientOrderCancelState({
    required this.isLoading,
    required super.order,
    this.isSuccess = true,
  });

  @override
  List<Object?> get props => [isLoading, order, isSuccess];

  ClientOrderCancelState copyWith({
    bool? isLoading,
    OrderEntity? order,
    bool? isSuccess,
  }) {
    return ClientOrderCancelState(
      isLoading: isLoading ?? this.isLoading,
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
