import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/features/payments/presentation/bloc/payment_cards_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/pages/add_card_page.dart';
import 'package:fly_cargo/features/payments/presentation/widgets/delete_card_bottom_sheet.dart';
import 'package:fly_cargo/features/payments/presentation/widgets/payment_card_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class PaymentCardsPage extends StatelessWidget {
  static const String path = '/payments/cards';

  static String location() => Uri(path: path).toString();

  const PaymentCardsPage({super.key});

  static GoRoute route({GlobalKey<NavigatorState>? parentNavigatorKey}) {
    return GoRoute(
      path: path,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const PaymentCardsPage(),
    );
  }

  void _onAddCard(BuildContext context, PaymentCardsBloc bloc) {
    bloc.add(PaymentCardsAddEvent());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PaymentCardsBloc>();

    return BlocConsumer<PaymentCardsBloc, PaymentCardsState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is PaymentCardsAddState) {
          context.push(AddCardPage.location(state.url));
        }
      },
      builder: (context, state) {
        return BePage(
          title: 'Платёжные карты',
          backgroundColor: BeColors.white,
          automaticallyImplyLeading: true,
          centerTitle: true,
          isBorder: true,
          child: Column(
            children: [
              Expanded(
                child: state.cards.isEmpty
                    ? _EmptyState(onAddCard: () => _onAddCard(context, bloc))
                    : _CardsList(cards: state.cards, bloc: bloc),
              ),
              if (state.cards.isNotEmpty)
                _AddCardButton(onPressed: () => _onAddCard(context, bloc)),
            ],
          ),
        );
      },
    );
  }
}

class _CardsList extends StatelessWidget {
  final List cards;
  final PaymentCardsBloc bloc;

  const _CardsList({required this.cards, required this.bloc});

  Future<void> _onCardTap(BuildContext context, card) async {
    final shouldDelete = await DeleteCardBottomSheet.show(context, card);
    if (shouldDelete == true) {
      bloc.add(PaymentCardsDeleteEvent(card.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16),
      itemCount: cards.length,
      separatorBuilder: (_, __) => BeSpace(size: .sm),
      itemBuilder: (context, index) {
        final card = cards[index];
        return PaymentCardTile(
          card: card,
          onTap: () => _onCardTap(context, card),
        );
      },
    );
  }
}

class _AddCardButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _AddCardButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomPadding + 24,
      ),
      child: BeButton(
        text: 'Добавить карту',
        color: .primary,
        onPressed: onPressed,
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onAddCard;

  const _EmptyState({required this.onAddCard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeroIcon(
            HeroIcons.creditCard,
            style: HeroIconStyle.outline,
            size: 80,
            color: BeColors.surface3,
          ),
          BeSpace(size: .xl),
          Text(
            'У вас нет сохранённых карт',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: BeColors.surface5,
            ),
          ),
          BeSpace(size: .sm),
          Text(
            'Добавьте карту для быстрой оплаты заказов',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              color: BeColors.surface4,
            ),
          ),
          BeSpace(size: .xxl),
          BeButton(
            text: 'Добавить карту',
            color: .primary,
            onPressed: onAddCard,
          ),
        ],
      ),
    );
  }
}
