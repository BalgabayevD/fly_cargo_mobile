import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_card.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_section_header.dart';
import 'package:fly_cargo/shared/tariffs/presentation/bloc/tariffs_bloc.dart';
import 'package:fly_cargo/shared/tariffs/presentation/widgets/tariff_category_dropdown.dart';

class OrderCategorySection extends StatelessWidget {
  final String category;
  final ValueChanged<String> onCategoryChanged;

  const OrderCategorySection({
    super.key,
    required this.category,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<TariffsBloc>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderSectionHeader(
            icon: Icons.category_outlined,
            title: 'Категория груза',
            subtitle: 'Выберите тип отправляемого груза',
          ),
          const SizedBox(height: 16),
          OrderCard(
            child: TariffCategoryDropdown(
              selectedCategory: category,
              onCategoryChanged: (value) =>
                  onCategoryChanged(value ?? 'documents'),
            ),
          ),
        ],
      ),
    );
  }
}
