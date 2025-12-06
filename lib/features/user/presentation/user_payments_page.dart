import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class UserPaymentsPage extends StatefulWidget {
  const UserPaymentsPage({super.key});
  @override
  State<UserPaymentsPage> createState() => _UserPaymentsPageState();
}

class _UserPaymentsPageState extends State<UserPaymentsPage> {
  late List<PaymentTransaction> _transactions;
  String _selectedPeriod = 'all';
  @override
  void initState() {
    super.initState();
    _transactions = [];
  }

  @override
  Widget build(BuildContext context) {
    final filteredTransactions = _getFilteredTransactions();
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
          'Платежи',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Color(0xFF333333)),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildStatsSection(),
          _buildFilterChips(),
          Expanded(
            child: filteredTransactions.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: filteredTransactions.length,
                    itemBuilder: (context, index) {
                      return _buildTransactionCard(filteredTransactions[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    final totalSpent = _transactions
        .where(
          (txn) =>
              txn.type == PaymentType.outgoing &&
              txn.status == PaymentStatus.completed,
        )
        .fold(0.0, (sum, txn) => sum + txn.amount);
    final totalReceived = _transactions
        .where(
          (txn) =>
              txn.type == PaymentType.incoming &&
              txn.status == PaymentStatus.completed,
        )
        .fold(0.0, (sum, txn) => sum + txn.amount);
    return Container(
      margin: const EdgeInsets.all(20),
      child: AppCard(
        variant: AppCardVariant.outlined,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    'Потрачено',
                    '${totalSpent.toStringAsFixed(0)} ₸',
                    Icons.trending_down,
                    const Color(0xFFFF3B30),
                  ),
                ),
                Container(width: 1, height: 40, color: const Color(0xFFE0E0E0)),
                Expanded(
                  child: _buildStatItem(
                    'Получено',
                    '${totalReceived.toStringAsFixed(0)} ₸',
                    Icons.trending_up,
                    const Color(0xFF34C759),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
        ),
      ],
    );
  }

  Widget _buildFilterChips() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterChip('all', 'Все'),
          const SizedBox(width: 8),
          _buildFilterChip('outgoing', 'Расходы'),
          const SizedBox(width: 8),
          _buildFilterChip('incoming', 'Поступления'),
          const SizedBox(width: 8),
          _buildFilterChip('pending', 'В обработке'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String value, String label) {
    final isSelected = _selectedPeriod == value;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedPeriod = value;
        });
      },
      selectedColor: const Color(0xFF007AFF).withValues(alpha: 0.2),
      checkmarkColor: const Color(0xFF007AFF),
      labelStyle: TextStyle(
        color: isSelected ? const Color(0xFF007AFF) : const Color(0xFF666666),
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.payment,
              size: 60,
              color: Color(0xFF999999),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Транзакций не найдено',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'У вас пока нет транзакций с выбранным фильтром',
            style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionCard(PaymentTransaction transaction) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: AppCard(
        variant: AppCardVariant.outlined,
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _getTransactionColor(
                  transaction.type,
                ).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getTransactionIcon(transaction.type),
                color: _getTransactionColor(transaction.type),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transaction.method,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        _formatTime(transaction.timestamp),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF999999),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(
                            transaction.status,
                          ).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _getStatusText(transaction.status),
                          style: TextStyle(
                            fontSize: 10,
                            color: _getStatusColor(transaction.status),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${transaction.type == PaymentType.outgoing ? '-' : '+'}${transaction.amount.toStringAsFixed(0)} ₸',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _getTransactionColor(transaction.type),
                  ),
                ),
                const SizedBox(height: 4),
                Icon(
                  _getTransactionIcon(transaction.type),
                  size: 16,
                  color: _getTransactionColor(transaction.type),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PaymentTransaction> _getFilteredTransactions() {
    switch (_selectedPeriod) {
      case 'outgoing':
        return _transactions
            .where((txn) => txn.type == PaymentType.outgoing)
            .toList();
      case 'incoming':
        return _transactions
            .where((txn) => txn.type == PaymentType.incoming)
            .toList();
      case 'pending':
        return _transactions
            .where((txn) => txn.status == PaymentStatus.pending)
            .toList();
      default:
        return _transactions;
    }
  }

  Color _getTransactionColor(PaymentType type) {
    switch (type) {
      case PaymentType.outgoing:
        return const Color(0xFFFF3B30);
      case PaymentType.incoming:
        return const Color(0xFF34C759);
    }
  }

  IconData _getTransactionIcon(PaymentType type) {
    switch (type) {
      case PaymentType.outgoing:
        return Icons.arrow_upward;
      case PaymentType.incoming:
        return Icons.arrow_downward;
    }
  }

  Color _getStatusColor(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.completed:
        return const Color(0xFF34C759);
      case PaymentStatus.pending:
        return const Color(0xFFFF9500);
      case PaymentStatus.failed:
        return const Color(0xFFFF3B30);
    }
  }

  String _getStatusText(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.completed:
        return 'Завершен';
      case PaymentStatus.pending:
        return 'В обработке';
      case PaymentStatus.failed:
        return 'Ошибка';
    }
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} мин назад';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ч назад';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} дн назад';
    } else {
      return '${timestamp.day}.${timestamp.month}.${timestamp.year}';
    }
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Фильтр транзакций',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 20),
            ...['all', 'outgoing', 'incoming', 'pending'].map((filter) {
              final labels = {
                'all': 'Все транзакции',
                'outgoing': 'Расходы',
                'incoming': 'Поступления',
                'pending': 'В обработке',
              };
              return ListTile(
                title: Text(labels[filter]!),
                trailing: _selectedPeriod == filter
                    ? const Icon(Icons.check, color: Color(0xFF007AFF))
                    : null,
                onTap: () {
                  setState(() {
                    _selectedPeriod = filter;
                  });
                  context.pop();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class PaymentTransaction {
  final String id;
  final double amount;
  final String description;
  final PaymentType type;
  final PaymentStatus status;
  final DateTime timestamp;
  final String method;
  const PaymentTransaction({
    required this.id,
    required this.amount,
    required this.description,
    required this.type,
    required this.status,
    required this.timestamp,
    required this.method,
  });
}

enum PaymentType { outgoing, incoming }

enum PaymentStatus { completed, pending, failed }
