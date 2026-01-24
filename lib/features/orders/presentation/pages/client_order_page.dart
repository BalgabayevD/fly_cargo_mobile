import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/design_system/components/timeline.dart';
import 'package:fly_cargo/core/design_system/nothing.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/client_order_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_orders_page.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/client_order/client_order_pay_dialog.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/client_order/photo_grid_view.dart';
import 'package:fly_cargo/features/payments/presentation/bloc/payment_cards_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/pages/add_card_page.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientOrderPage extends StatelessWidget {
  static const String path = '/orders/:orderId';

  static String location(int orderId) =>
      Uri(path: path.replaceFirst(':orderId', orderId.toString())).toString();

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      redirect: (context, state) {
        final orderId = state.pathParameters['orderId'];

        if (orderId == null || orderId.isEmpty) {
          return ClientOrdersPage.location();
        }

        if (int.tryParse(orderId) == null) {
          return ClientOrdersPage.location();
        }

        return null;
      },
      builder: (BuildContext context, state) {
        final orderId = int.parse(state.pathParameters['orderId']!);

        return BlocProvider<ClientOrderBloc>(
          create: (BuildContext context) {
            return getIt<ClientOrderBloc>()..add(ClientOrderLoadEvent(orderId));
          },
          child: ClientOrderPage(),
        );
      },
      routes: routes,
    );
  }

  const ClientOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientOrderBloc, ClientOrderState>(
      builder: (BuildContext context, ClientOrderState state) {
        if (state is ClientOrderLoadingState) {
          return BePage(
            title: 'Заказ №${state.orderId}',
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is ClientOrderLoadedState) {
          return BePage(
            backgroundColor: BeColors.white,
            isBorder: true,
            title: 'Заказ ${state.order.id}',
            actions: ClientOrderPayButton(
              isShowPay: state.isShowPay,
              orderId: state.order.id,
              payAmount: state.order.payAmount,
            ),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<ClientOrderBloc>().add(
                  ClientOrderLoadEvent(state.order.id),
                );
                await Future.delayed(Duration(seconds: 1));
              },
              child: ListView(
                children: [
                  BeSpace(size: .md),

                  Text(
                    'Посылка от ${state.formatDate(state.order.createdAt)}, ${state.isShowPay ? 'не оплочен' : 'оплочен'}',
                    style: GoogleFonts.montserrat(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: BeColors.surface5,
                    ),
                  ),

                  BeSpace(size: .xl),

                  ...state.timeline.map((data) {
                    return BeTimeline(
                      isFirst: data.isFirst,
                      isLast: data.isLast,
                      isSelected: data.isSelected,
                      title: data.title,
                      description: data.description,
                    );
                  }),

                  FlatListTile(
                    label: context.l10n.recipientLabel,
                    value:
                        '${state.order.toName ?? ''}, ${state.order.toPhone ?? ''}',
                  ),

                  BeSpace(size: .md),

                  FlatListTile(
                    label: context.l10n.deliveryLabel,
                    value:
                        '${state.order.toCity?.name ?? ''}, ${state.order.toAddress}',
                  ),

                  FlatListTile(
                    isFluid: true,
                    label: context.l10n.description,
                    value: state.order.description,
                  ),

                  BeSpace(size: .xxxl),

                  if (state.order.photos.isNotEmpty)
                    PhotoGridView(photos: state.order.photos),

                  if (state.order.isCanCancel) BeSpace(size: .xxxl),

                  if (state.order.isCanCancel)
                    BeButton(
                      text: 'Отменить',
                      variant: .flat,
                      color: .danger,
                    ),

                  BeSpace(size: .xxxl),

                  if (state.isShowPay) BeSpace(size: .xxxl),
                  if (state.isShowPay) BeSpace(size: .xxxl),
                  if (state.isShowPay) BeSpace(size: .xxxl),
                ],
              ),
            ),
          );
        }

        return BeNothing();
      },
    );
  }
}

class ClientOrderPayButton extends StatelessWidget {
  final ClientOrderPayDialog dialog;
  final bool isShowPay;
  final int orderId;
  final double payAmount;

  const ClientOrderPayButton({
    required this.orderId,
    required this.payAmount,
    this.isShowPay = false,
    super.key,
  }) : dialog = const ClientOrderPayDialog();

  Future<void> payOrder(BuildContext context, PaymentCardsState state) async {
    final payload = await dialog.selectCards(
      context,
      state.cards,
      orderId,
      payAmount,
    );

    if (payload != null &&
        payload.$1 == ClientOrderPayAction.pay &&
        context.mounted) {
      context.read<ClientOrderBloc>().add(
        ClientOrderPayEvent(payload.$2),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isShowPay,
      child: MultiBlocListener(
        listeners: [
          BlocListener<PaymentCardsBloc, PaymentCardsState>(
            listener: (BuildContext context, PaymentCardsState state) {
              if (state is PaymentCardsAddState) {
                context.push(AddCardPage.location(state.url));
              }
            },
            listenWhen: (PaymentCardsState previous, PaymentCardsState state) {
              return (state is PaymentCardsAddState);
            },
          ),
          BlocListener<ClientOrderBloc, ClientOrderState>(
            listener: (BuildContext context, ClientOrderState state) async {
              if (state is ClientOrderPayState && !state.isLoading) {
                if (state.isSuccess) {
                  await dialog.paySuccessStatus(context);

                  if (context.mounted) {
                    context.read<ClientOrderBloc>().add(
                      ClientOrderLoadEvent(orderId),
                    );
                  }
                } else {
                  final isPay = await dialog.payFailureStatus(context);

                  if (isPay != null && isPay && context.mounted) {
                    context.read<ClientOrderBloc>().add(
                      ClientOrderRePayEvent(),
                    );
                  }
                }
              }
            },
            listenWhen: (ClientOrderState previous, ClientOrderState state) {
              return (state is ClientOrderPayState);
            },
          ),
        ],
        child: BlocBuilder<ClientOrderBloc, ClientOrderState>(
          builder: (BuildContext context, ClientOrderState orderState) {
            final isLoading = orderState is ClientOrderPayState
                ? orderState.isLoading
                : false;

            return BlocBuilder<PaymentCardsBloc, PaymentCardsState>(
              builder: (BuildContext context, PaymentCardsState state) {
                return BeButton(
                  text: isLoading
                      ? 'Проводим оплату'
                      : 'Оплатить $payAmount тг',
                  isLoading: isLoading,
                  onPressed: () => payOrder(context, state),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
