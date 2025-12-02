import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/user/models/user_profile_model.dart';
class UserPaymentCardsPage extends StatefulWidget {
  const UserPaymentCardsPage({super.key});
  @override
  State<UserPaymentCardsPage> createState() => _UserPaymentCardsPageState();
}
class _UserPaymentCardsPageState extends State<UserPaymentCardsPage> {
  late List<PaymentCard> _paymentCards;
  @override
  void initState() {
    super.initState();
    _paymentCards = _getMockPaymentCards();
  }
  List<PaymentCard> _getMockPaymentCards() {
    return [
      PaymentCard(
        id: 'card_1',
        type: 'Visa',
        lastFourDigits: '2395',
        holderName: 'Дамир Токмашов',
        isPrimary: true,
        expiryDate: DateTime(2025, 12, 31),
      ),
      PaymentCard(
        id: 'card_2',
        type: 'Mastercard',
        lastFourDigits: '1234',
        holderName: 'Дамир Токмашов',
        isPrimary: false,
        expiryDate: DateTime(2024, 8, 31),
      ),
    ];
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
          'Платежные карты',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xFF333333)),
            onPressed: _addPaymentCard,
          ),
        ],
      ),
      body: _paymentCards.isEmpty
          ? _buildEmptyState()
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ваши карты',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ..._paymentCards.map((card) => _buildPaymentCard(card)),
                  const SizedBox(height: 20),
                  _buildAddCardButton(),
                ],
              ),
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
              Icons.credit_card,
              size: 60,
              color: Color(0xFF999999),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'У вас пока нет карт',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Добавьте карту для удобной оплаты',
            style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          AppButton(
            text: 'Добавить карту',
            onPressed: _addPaymentCard,
            size: AppButtonSize.large,
            variant: AppButtonVariant.primary,
            isFullWidth: true,
          ),
        ],
      ),
    );
  }
  Widget _buildPaymentCard(PaymentCard card) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: AppCard(
        variant: AppCardVariant.outlined,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _getCardColor(card.type),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(card.icon, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            card.displayName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF333333),
                            ),
                          ),
                          if (card.isPrimary) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF34C759),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Основная',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        card.holderName,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                        ),
                      ),
                      Text(
                        'Действует до ${card.expiryDate.month.toString().padLeft(2, '0')}/${card.expiryDate.year.toString().substring(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) => _handleCardAction(value, card),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'set_primary',
                      child: Text('Сделать основной'),
                    ),
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('Редактировать'),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Удалить'),
                    ),
                  ],
                  child: const Icon(Icons.more_vert, color: Color(0xFF666666)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildAddCardButton() {
    return AppButton(
      text: 'Добавить новую карту',
      onPressed: _addPaymentCard,
      size: AppButtonSize.large,
      variant: AppButtonVariant.outline,
      isFullWidth: true,
      icon: Icons.add,
    );
  }
  Color _getCardColor(String type) {
    switch (type.toLowerCase()) {
      case 'visa':
        return const Color(0xFF1A1F71);
      case 'mastercard':
        return const Color(0xFFEB001B);
      default:
        return const Color(0xFF666666);
    }
  }
  void _addPaymentCard() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _buildAddCardModal(),
    );
  }
  Widget _buildAddCardModal() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Добавить карту',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Номер карты',
              hintText: '1234 5678 9012 3456',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'MM/YY',
                    hintText: '12/25',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'CVV',
                    hintText: '123',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Имя держателя',
              hintText: 'Иван Иванов',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          AppButton(
            text: 'Добавить карту',
            onPressed: () {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Карта добавлена'),
                  backgroundColor: Color(0xFF34C759),
                ),
              );
            },
            size: AppButtonSize.large,
            variant: AppButtonVariant.primary,
            isFullWidth: true,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
  void _handleCardAction(String action, PaymentCard card) {
    switch (action) {
      case 'set_primary':
        _setPrimaryCard(card);
        break;
      case 'edit':
        _editCard(card);
        break;
      case 'delete':
        _deleteCard(card);
        break;
    }
  }
  void _setPrimaryCard(PaymentCard card) {
    setState(() {
      for (var c in _paymentCards) {
        c = PaymentCard(
          id: c.id,
          type: c.type,
          lastFourDigits: c.lastFourDigits,
          holderName: c.holderName,
          isPrimary: c.id == card.id,
          expiryDate: c.expiryDate,
        );
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Основная карта изменена'),
        backgroundColor: Color(0xFF34C759),
      ),
    );
  }
  void _editCard(PaymentCard card) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Редактирование карты будет реализовано'),
        backgroundColor: Color(0xFF007AFF),
      ),
    );
  }
  void _deleteCard(PaymentCard card) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить карту'),
        content: Text(
          'Вы уверены, что хотите удалить карту ${card.displayName}?',
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _paymentCards.removeWhere((c) => c.id == card.id);
              });
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Карта удалена'),
                  backgroundColor: Color(0xFF34C759),
                ),
              );
            },
            child: const Text(
              'Удалить',
              style: TextStyle(color: Color(0xFFFF3B30)),
            ),
          ),
        ],
      ),
    );
  }
}
