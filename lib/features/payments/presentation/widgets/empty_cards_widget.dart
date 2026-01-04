import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/payments/presentation/add_card/bloc/add_card_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/pages/add_card_page.dart';
import 'package:fly_cargo/features/payments/presentation/cards_list/bloc/cards_list_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/cards_list/bloc/cards_list_event.dart';

class EmptyCardsWidget extends StatelessWidget {
  const EmptyCardsWidget({super.key});

  Future<void> _openAddCardPage(BuildContext context) async {
    // Получаем BLoC из текущего контекста
    final addCardBloc = context.read<AddCardBloc>();
    
    // Открываем страницу добавления карты на весь экран
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (newContext) => BlocProvider.value(
          value: addCardBloc,
          child: const AddCardPage(),
        ),
      ),
    );

    // Если карта успешно добавлена, обновляем список
    if (result == true && context.mounted) {
      context.read<CardsListBloc>().add(const CardsListRefreshRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.credit_card_outlined,
              size: 80,
              color: AppColors.surface3,
            ),
            const SizedBox(height: 24),
            Text(
              'Добавьте карту',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.surface5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'У вас пока нет сохраненных карт',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.surface4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => _openAddCardPage(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C3A31),
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Добавить карту',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Назад',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.surface5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

