import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/courier/models/courier_profile_model.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/detailed_stats_widget.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/income_stats_widget.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/period_selector_widget.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/transactions_list_widget.dart';
import 'package:fly_cargo/features/courier/services/income_service.dart';
class CourierIncomePage extends StatefulWidget {
  const CourierIncomePage({super.key});
  @override
  State<CourierIncomePage> createState() => _CourierIncomePageState();
}
class _CourierIncomePageState extends State<CourierIncomePage> {
  late CourierIncome _income;
  String _selectedPeriod = 'today';
  bool _isLoading = true;
  late final IncomeService _incomeService;
  @override
  void initState() {
    super.initState();
    _incomeService = MockIncomeService();
    _loadIncome();
  }
  Future<void> _loadIncome() async {
    try {
      final income = await _incomeService.getIncome();
      setState(() {
        _income = income;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
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
                    earnings: _incomeService.getEarningsForPeriod(
                      _income,
                      _selectedPeriod,
                    ),
                    deliveries: _incomeService.getDeliveriesForPeriod(
                      _income,
                      _selectedPeriod,
                    ),
                  ),
                  const SizedBox(height: 20),
                  DetailedStatsWidget(
                    deliveries: _incomeService.getDeliveriesForPeriod(
                      _income,
                      _selectedPeriod,
                    ),
                    rating: 4.8,
                    timeOnRoad: _incomeService.getTimeOnRoadForPeriod(
                      _selectedPeriod,
                    ),
                    distance: _incomeService.getDistanceForPeriod(
                      _selectedPeriod,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TransactionsListWidget(
                    transactions: _incomeService.getTransactionsForPeriod(
                      _income.transactions,
                      _selectedPeriod,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
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
