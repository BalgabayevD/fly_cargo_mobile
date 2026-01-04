import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/payments/presentation/add_card/bloc/add_card_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/cards_list/bloc/cards_list_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/cards_list/bloc/cards_list_event.dart';
import 'package:fly_cargo/features/payments/presentation/cards_list/bloc/cards_list_state.dart';
import 'package:fly_cargo/features/payments/presentation/epayment_pay/bloc/epayment_pay_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/epayment_pay/bloc/epayment_pay_state.dart';
import 'package:fly_cargo/features/payments/presentation/payment_flow_cubit.dart';
import 'package:fly_cargo/features/payments/presentation/widgets/cards_list/cards_list_widget.dart';
import 'package:fly_cargo/features/payments/presentation/widgets/empty_cards_widget.dart';
import 'package:fly_cargo/features/payments/presentation/widgets/payment_error_widget.dart';
import 'package:fly_cargo/features/payments/presentation/widgets/payment_processing_widget.dart';
import 'package:fly_cargo/features/payments/presentation/widgets/payment_success_widget.dart';
import 'package:heroicons/heroicons.dart';

class PaymentBottomSheet extends StatefulWidget {
  final int orderId;
  final double price;

  const PaymentBottomSheet({
    required this.orderId,
    required this.price,
    super.key,
  });

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  @override
  void initState() {
    super.initState();
    // Загружаем список карт при открытии
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CardsListBloc>().add(const CardsListLoadRequested());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // Слушаем изменения в EpaymentPayBloc
        BlocListener<EpaymentPayBloc, EpaymentPayState>(
          listener: (context, state) {
            if (state is EpaymentPayProcessing) {
              context.read<PaymentFlowCubit>().showProcessing();
            } else if (state is EpaymentPaySuccess) {
              context.read<PaymentFlowCubit>().showSuccess();
            } else if (state is EpaymentPayError) {
              context.read<PaymentFlowCubit>().showError();
            }
          },
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: BlocBuilder<PaymentFlowCubit, PaymentStep>(
                builder: (context, step) {
                  return _buildContent(step);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXL),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<PaymentFlowCubit, PaymentStep>(
              builder: (context, step) {
                String title = 'Оплата заказа №${widget.orderId}';
                if (step == PaymentStep.addCard) {
                  title = 'Добавление карты';
                } else {
                  title = '';
                }

                return Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.surface5,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
          IconButton(
            icon: HeroIcon(
              HeroIcons.xMark,
              size: 24,
              color: AppColors.surface4,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 26),
        ],
      ),
    );
  }

  Widget _buildContent(PaymentStep step) {
    switch (step) {
      case PaymentStep.cards:
        return BlocBuilder<CardsListBloc, CardsListState>(
          builder: (context, state) {
            if (state is CardsListEmpty) {
              return const EmptyCardsWidget();
            }
            return CardsListWidget(orderId: widget.orderId);
          },
        );
      case PaymentStep.addCard:
        return const EmptyCardsWidget();
      case PaymentStep.processing:
        return const PaymentProcessingWidget();
      case PaymentStep.success:
        return const PaymentSuccessWidget();
      case PaymentStep.error:
        return const PaymentErrorWidget();
    }
  }
}

// Функция для открытия BottomSheet
Future<bool?> showPaymentBottomSheet(
  BuildContext context, {
  required int orderId,
  required double price,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<PaymentFlowCubit>()),
        BlocProvider(create: (_) => getIt<CardsListBloc>()),
        BlocProvider(create: (_) => getIt<AddCardBloc>()),
        BlocProvider(create: (_) => getIt<EpaymentPayBloc>()),
      ],
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: PaymentBottomSheet(
          orderId: orderId,
          price: price,
        ),
      ),
    ),
  );
}
