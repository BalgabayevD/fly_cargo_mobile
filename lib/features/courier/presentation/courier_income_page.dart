import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/courier/models/courier_profile_model.dart';

class CourierIncomePage extends StatefulWidget {
  const CourierIncomePage({super.key});

  @override
  State<CourierIncomePage> createState() => _CourierIncomePageState();
}

class _CourierIncomePageState extends State<CourierIncomePage> {
  late CourierIncome _income;
  String _selectedPeriod = 'today';

  @override
  void initState() {
    super.initState();
    _income = _getMockIncome();
  }

  CourierIncome _getMockIncome() {
    return CourierIncome(
      todayEarnings: 2500.0,
      weekEarnings: 18500.0,
      monthEarnings: 45000.0,
      totalEarnings: 125000.0,
      todayDeliveries: 3,
      weekDeliveries: 18,
      monthDeliveries: 45,
      transactions: [
        IncomeTransaction(
          id: '1',
          amount: 1200.0,
          description: 'Доставка FC-2024-001',
          date: DateTime(2024, 1, 20, 10, 30),
          type: 'delivery',
          orderId: 'FC-2024-001',
        ),
        IncomeTransaction(
          id: '2',
          amount: 800.0,
          description: 'Доставка FC-2024-002',
          date: DateTime(2024, 1, 20, 14, 15),
          type: 'delivery',
          orderId: 'FC-2024-002',
        ),
        IncomeTransaction(
          id: '3',
          amount: 500.0,
          description: 'Бонус за быструю доставку',
          date: DateTime(2024, 1, 20, 16, 0),
          type: 'bonus',
        ),
        IncomeTransaction(
          id: '4',
          amount: 1500.0,
          description: 'Доставка FC-2024-003',
          date: DateTime(2024, 1, 19, 11, 20),
          type: 'delivery',
          orderId: 'FC-2024-003',
        ),
        IncomeTransaction(
          id: '5',
          amount: -200.0,
          description: 'Штраф за опоздание',
          date: DateTime(2024, 1, 18, 15, 45),
          type: 'penalty',
        ),
      ],
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
          onPressed: () => Navigator.pop(context),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Периоды
            _buildPeriodSelector(),
            const SizedBox(height: 20),

            // Основная статистика
            _buildMainStats(),
            const SizedBox(height: 20),

            // Детальная статистика
            _buildDetailedStats(),
            const SizedBox(height: 20),

            // История транзакций
            _buildTransactionsSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodSelector() {
    return Row(
      children: [
        _buildPeriodChip('today', 'Сегодня'),
        const SizedBox(width: 8),
        _buildPeriodChip('week', 'Неделя'),
        const SizedBox(width: 8),
        _buildPeriodChip('month', 'Месяц'),
        const SizedBox(width: 8),
        _buildPeriodChip('total', 'Всего'),
      ],
    );
  }

  Widget _buildPeriodChip(String value, String label) {
    final isSelected = _selectedPeriod == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPeriod = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF007AFF) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF666666),
          ),
        ),
      ),
    );
  }

  Widget _buildMainStats() {
    final earnings = _getEarningsForPeriod();
    final deliveries = _getDeliveriesForPeriod();

    return AppCard(
      variant: AppCardVariant.filled,
      backgroundColor: const Color(0xFF007AFF).withOpacity(0.1),
      child: Column(
        children: [
          const Text(
            'Заработок',
            style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
          ),
          const SizedBox(height: 8),
          Text(
            '${earnings.toInt()} ₸',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Color(0xFF007AFF),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Доставки', '$deliveries', Icons.local_shipping),
              _buildStatItem(
                'Средний чек',
                '${deliveries > 0 ? (earnings / deliveries).toInt() : 0} ₸',
                Icons.analytics,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedStats() {
    return AppCardWithTitle(
      title: 'Детальная статистика',
      variant: AppCardVariant.filled,
      child: Column(
        children: [
          _buildStatRow('Доставки выполнено', '${_getDeliveriesForPeriod()}'),
          _buildStatRow('Средний рейтинг', '4.8'),
          _buildStatRow('Время в пути', '${_getTimeOnRoad()} ч'),
          _buildStatRow('Расстояние', '${_getDistance()} км'),
        ],
      ),
    );
  }

  Widget _buildTransactionsSection() {
    final filteredTransactions = _getFilteredTransactions();

    return AppCardWithTitle(
      title: 'История транзакций',
      variant: AppCardVariant.filled,
      child: Column(
        children: [
          if (filteredTransactions.isEmpty)
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Нет транзакций за выбранный период',
                style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
              ),
            )
          else
            ...filteredTransactions.map(
              (transaction) => _buildTransactionItem(transaction),
            ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF007AFF), size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
        ),
      ],
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(IncomeTransaction transaction) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: transaction.typeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getTransactionIcon(transaction.type),
              color: transaction.typeColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _formatDateTime(transaction.date),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${transaction.amount > 0 ? '+' : ''}${transaction.amount.toInt()} ₸',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: transaction.amount > 0
                  ? const Color(0xFF34C759)
                  : const Color(0xFFFF3B30),
            ),
          ),
        ],
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

  List<IncomeTransaction> _getFilteredTransactions() {
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

  int _getTimeOnRoad() {
    // Моковые данные
    switch (_selectedPeriod) {
      case 'today':
        return 6;
      case 'week':
        return 42;
      case 'month':
        return 180;
      default:
        return 0;
    }
  }

  double _getDistance() {
    // Моковые данные
    switch (_selectedPeriod) {
      case 'today':
        return 45.5;
      case 'week':
        return 320.0;
      case 'month':
        return 1250.0;
      default:
        return 0.0;
    }
  }

  IconData _getTransactionIcon(String type) {
    switch (type) {
      case 'delivery':
        return Icons.local_shipping;
      case 'bonus':
        return Icons.card_giftcard;
      case 'penalty':
        return Icons.warning;
      default:
        return Icons.payment;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')} в ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
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
                Navigator.pop(context);
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
