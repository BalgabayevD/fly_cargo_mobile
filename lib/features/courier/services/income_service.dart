import 'package:fly_cargo/features/courier/models/courier_profile_model.dart';

abstract class IncomeService {
  Future<CourierIncome> getIncome();
  List<IncomeTransaction> getTransactionsForPeriod(
    List<IncomeTransaction> transactions,
    String period,
  );
  double getEarningsForPeriod(CourierIncome income, String period);
  int getDeliveriesForPeriod(CourierIncome income, String period);
  int getTimeOnRoadForPeriod(String period);
  double getDistanceForPeriod(String period);
}

class MockIncomeService implements IncomeService {
  @override
  Future<CourierIncome> getIncome() async {
    // Имитация загрузки данных
    await Future.delayed(const Duration(seconds: 1));
    return _getMockIncome();
  }

  @override
  List<IncomeTransaction> getTransactionsForPeriod(
    List<IncomeTransaction> transactions,
    String period,
  ) {
    final now = DateTime.now();
    switch (period) {
      case 'today':
        return transactions
            .where(
              (t) =>
                  t.date.day == now.day &&
                  t.date.month == now.month &&
                  t.date.year == now.year,
            )
            .toList();
      case 'week':
        final weekAgo = now.subtract(const Duration(days: 7));
        return transactions.where((t) => t.date.isAfter(weekAgo)).toList();
      case 'month':
        final monthAgo = now.subtract(const Duration(days: 30));
        return transactions.where((t) => t.date.isAfter(monthAgo)).toList();
      case 'total':
        return transactions;
      default:
        return [];
    }
  }

  @override
  double getEarningsForPeriod(CourierIncome income, String period) {
    switch (period) {
      case 'today':
        return income.todayEarnings;
      case 'week':
        return income.weekEarnings;
      case 'month':
        return income.monthEarnings;
      case 'total':
        return income.totalEarnings;
      default:
        return 0.0;
    }
  }

  @override
  int getDeliveriesForPeriod(CourierIncome income, String period) {
    switch (period) {
      case 'today':
        return income.todayDeliveries;
      case 'week':
        return income.weekDeliveries;
      case 'month':
        return income.monthDeliveries;
      default:
        return 0;
    }
  }

  @override
  int getTimeOnRoadForPeriod(String period) {
    // Моковые данные
    switch (period) {
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

  @override
  double getDistanceForPeriod(String period) {
    // Моковые данные
    switch (period) {
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
}
