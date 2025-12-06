import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/courier/models/courier_profile_model.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/detailed_stats_widget.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/income_stats_widget.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/period_selector_widget.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/transactions_list_widget.dart';
import 'package:go_router/go_router.dart';

class CourierIncomePage extends StatefulWidget {
  const CourierIncomePage({super.key});
  @override
  State<CourierIncomePage> createState() => _CourierIncomePageState();
}

class _CourierIncomePageState extends State<CourierIncomePage> {
  late CourierIncome _income;
  String _selectedPeriod = 'today';
  final bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _income = CourierIncome(
      todayEarnings: 0.0,
      weekEarnings: 0.0,
      monthEarnings: 0.0,
      totalEarnings: 0.0,
      todayDeliveries: 0,
      weekDeliveries: 0,
      monthDeliveries: 0,
      transactions: [],
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
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Мой доход',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_balance_wallet,
              color: Color(0xFF333333),
            ),
            onPressed: () => _showPaymentMethods(),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PeriodSelectorWidget(
                    selectedPeriod: _selectedPeriod,
                    onPeriodChanged: (period) {
                      setState(() {
                        _selectedPeriod = period;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  IncomeStatsWidget(
                    earnings: _getEarningsForPeriod(),
                    deliveries: _getDeliveriesForPeriod(),
                  ),
                  const SizedBox(height: 20),
                  DetailedStatsWidget(
                    deliveries: _getDeliveriesForPeriod(),
                    rating: 0.0,
                    timeOnRoad: 0,
                    distance: 0.0,
                  ),
                  const SizedBox(height: 20),
                  TransactionsListWidget(
                    transactions: _getTransactionsForPeriod(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  double _getEarningsForPeriod() {
    switch (_selectedPeriod) {
      case 'today':
        return _income.todayEarnings;
      case 'week':
        return _income.weekEarnings;
      case 'month':
        return _income.monthEarnings;
      case 'total':
        return _income.totalEarnings;
      default:
        return 0.0;
    }
  }

  int _getDeliveriesForPeriod() {
    switch (_selectedPeriod) {
      case 'today':
        return _income.todayDeliveries;
      case 'week':
        return _income.weekDeliveries;
      case 'month':
        return _income.monthDeliveries;
      default:
        return 0;
    }
  }

  List<IncomeTransaction> _getTransactionsForPeriod() {
    final now = DateTime.now();
    switch (_selectedPeriod) {
      case 'today':
        return _income.transactions
            .where(
              (t) =>
                  t.date.day == now.day &&
                  t.date.month == now.month &&
                  t.date.year == now.year,
            )
            .toList();
      case 'week':
        final weekAgo = now.subtract(const Duration(days: 7));
        return _income.transactions
            .where((t) => t.date.isAfter(weekAgo))
            .toList();
      case 'month':
        final monthAgo = now.subtract(const Duration(days: 30));
        return _income.transactions
            .where((t) => t.date.isAfter(monthAgo))
            .toList();
      case 'total':
        return _income.transactions;
      default:
        return [];
    }
  }

  void _showPaymentMethods() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Способы выплаты',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.credit_card, color: Color(0xFF007AFF)),
              title: const Text('Visa -2395'),
              subtitle: const Text('Основная карта'),
              trailing: const Icon(Icons.check, color: Color(0xFF34C759)),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_balance,
                color: Color(0xFF666666),
              ),
              title: const Text('Банковский счет'),
              subtitle: const Text('KZ1234567890123456'),
            ),
            const SizedBox(height: 20),
            AppButton(
              text: 'Добавить способ выплаты',
              onPressed: () {
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Добавление способа выплаты будет реализовано',
                    ),
                    backgroundColor: Color(0xFF007AFF),
                  ),
                );
              },
              size: AppButtonSize.large,
              variant: AppButtonVariant.primary,
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}
