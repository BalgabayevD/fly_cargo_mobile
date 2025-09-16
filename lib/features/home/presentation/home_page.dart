import 'package:flutter/material.dart';
import 'package:fly_cargo/features/destination/models/address_model.dart';
import 'package:fly_cargo/features/home/presentation/box_details_page.dart';
import 'package:fly_cargo/features/home/presentation/send_package_bottom_sheet.dart';
import 'package:fly_cargo/features/map/presentation/yandex_map_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String a77 = '';
  String b77 = '';
  AddressModel? _fromAddress;
  AddressModel? _toAddress;
  String? _selectedBoxType;

  void _onAddressesSelected(AddressModel fromAddress, AddressModel toAddress) {
    setState(() {
      _fromAddress = fromAddress;
      _toAddress = toAddress;
    });
  }

  void _openAddressSelection() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SendPackageBottomSheet(
        onAddressesSelected: _onAddressesSelected,
        initialFromAddress: _fromAddress,
        initialToAddress: _toAddress,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const YandexMapScreen(),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  controller: scrollController,
                  children: [
                    Text(
                      'Fly Cargo',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (_fromAddress == null || _toAddress == null)
                      GestureDetector(
                        onTap: _openAddressSelection,
                        child: Container(
                          width: double.infinity,
                          height: 47,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              'Отправить посылку?',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    else
                      Column(
                        children: [
                          // Заголовок с кнопкой изменения
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Маршрут доставки',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              TextButton(
                                onPressed: _openAddressSelection,
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  'Изменить',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF007AFF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Адрес отправки
                          GestureDetector(
                            onTap: _openAddressSelection,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: const Color(0xFFE0E0E0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF007AFF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Откуда забрать',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF666666),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          _fromAddress!.city,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF333333),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          _fromAddress!.address,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF666666),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.edit,
                                    color: Color(0xFF666666),
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Divider
                          Container(height: 1, color: const Color(0xFFE0E0E0)),
                          const SizedBox(height: 12),
                          // Адрес доставки
                          GestureDetector(
                            onTap: _openAddressSelection,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: const Color(0xFFE0E0E0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF34C759),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Куда доставить',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF666666),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          _toAddress!.city,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF333333),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          _toAddress!.address,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF666666),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.edit,
                                    color: Color(0xFF666666),
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Выбор коробки
                          if (_fromAddress != null && _toAddress != null) ...[
                            const SizedBox(height: 24),
                            const Text(
                              'Выберите коробку для упаковки',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF333333),
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildBoxSelection(),
                            // Кнопка выбора коробки
                            if (_selectedBoxType != null) ...[
                              const SizedBox(height: 20),
                              _buildSelectBoxButton(),
                            ],
                          ],
                        ],
                      ),
                    const SizedBox(height: 16),
                    // MaterialButton(
                    //   onPressed: () {
                    //     final ras = context.read<AuthorizationRepository>();
                    //     final b = context.read<NetworkRepository>();
                    //     ras.signIn(b).then((result) {
                    //       a77 = result.$1;
                    //       b77 = result.$2;
                    //       setState(() {});
                    //     });
                    //   },
                    //   child: Text('Login'),
                    // ),
                    // MaterialButton(
                    //   onPressed: () {
                    //     final ras = context.read<AuthorizationRepository>();
                    //     final b = context.read<NetworkRepository>();
                    //     ras.signCode(b, a77, b77, '451088');
                    //   },
                    //   child: Text('Login 2'),
                    // ),
                    // MaterialButton(
                    //   onPressed: () {
                    //     final ras = context.read<AuthorizationRepository>();
                    //     ras.gig();
                    //   },
                    //   child: Text('3'),
                    // ),
                    ListTile(
                      title: Text('Настольный светильник'),
                      subtitle: Text('Атырау, просп. Абая, 94'),
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Divider(color: Color(0xFFD0CFCE), height: 1),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBoxSelection() {
    return Row(
      children: [
        Expanded(
          child: _buildBoxOption(
            'small',
            'Маленькая',
            '15 × 10 × 20',
            'assets/images/small.png',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildBoxOption(
            'medium',
            'Средняя',
            '20 × 20 × 30',
            'assets/images/medium.png',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildBoxOption(
            'big',
            'Большая',
            '30 × 30 × 40',
            'assets/images/big.png',
          ),
        ),
      ],
    );
  }

  Widget _buildBoxOption(
    String type,
    String title,
    String subtitle,
    String imagePath,
  ) {
    final isSelected = _selectedBoxType == type;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBoxType = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF007AFF).withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF007AFF)
                : const Color(0xFFE0E0E0),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color(0xFF007AFF)
                    : const Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? const Color(0xFF007AFF)
                    : const Color(0xFF666666),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectBoxButton() {
    return GestureDetector(
      onTap: () {
        _openBoxDetailsPage();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF007AFF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Text(
            'Выбрать',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void _openBoxDetailsPage() {
    if (_selectedBoxType == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BoxDetailsPage(boxType: _selectedBoxType!),
      ),
    );
  }
}
