import 'package:flutter/material.dart';
import 'package:fly_cargo/features/destination/models/address_model.dart';
import 'package:fly_cargo/features/destination/presentation/choose_address_page.dart';
import 'package:fly_cargo/features/destination/presentation/choose_city_page.dart';

class SendPackageBottomSheet extends StatefulWidget {
  const SendPackageBottomSheet({super.key});

  @override
  State<SendPackageBottomSheet> createState() => _SendPackageBottomSheetState();
}

class _SendPackageBottomSheetState extends State<SendPackageBottomSheet> {
  AddressModel? _fromAddress;
  AddressModel? _toAddress;

  Future<void> _selectFromAddress() async {
    final city = await Navigator.push<dynamic>(
      context,
      MaterialPageRoute(builder: (context) => const ChooseCityPage()),
    );
    
    if (city != null) {
      final address = await Navigator.push<AddressModel>(
        context,
        MaterialPageRoute(
          builder: (context) => ChooseAddressPage(selectedCity: city),
        ),
      );
      
      if (address != null) {
        setState(() {
          _fromAddress = address;
        });
      }
    }
  }

  Future<void> _selectToAddress() async {
    final city = await Navigator.push<dynamic>(
      context,
      MaterialPageRoute(builder: (context) => const ChooseCityPage()),
    );
    
    if (city != null) {
      final address = await Navigator.push<AddressModel>(
        context,
        MaterialPageRoute(
          builder: (context) => ChooseAddressPage(selectedCity: city),
        ),
      );
      
      if (address != null) {
        setState(() {
          _toAddress = address;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Отправить посылку',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              'Откуда?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 12),

            GestureDetector(
              onTap: _selectFromAddress,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _fromAddress?.city ?? 'Выберите город',
                            style: TextStyle(
                              fontSize: 16,
                              color: _fromAddress != null 
                                  ? const Color(0xFF333333) 
                                  : const Color(0xFF999999),
                              fontWeight: _fromAddress != null 
                                  ? FontWeight.w500 
                                  : FontWeight.normal,
                            ),
                          ),
                          if (_fromAddress != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              _fromAddress!.address,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Icon(
                      Icons.location_city,
                      color: _fromAddress != null 
                          ? const Color(0xFF007AFF) 
                          : const Color(0xFF666666),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Куда?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 12),

            GestureDetector(
              onTap: _selectToAddress,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _toAddress?.city ?? 'Выберите город',
                            style: TextStyle(
                              fontSize: 16,
                              color: _toAddress != null 
                                  ? const Color(0xFF333333) 
                                  : const Color(0xFF999999),
                              fontWeight: _toAddress != null 
                                  ? FontWeight.w500 
                                  : FontWeight.normal,
                            ),
                          ),
                          if (_toAddress != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              _toAddress!.address,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Icon(
                      Icons.location_city,
                      color: _toAddress != null 
                          ? const Color(0xFF007AFF) 
                          : const Color(0xFF666666),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: (_fromAddress != null && _toAddress != null) 
                    ? () {
                        // Здесь можно добавить логику для обработки выбранных адресов
                        print('Откуда: ${_fromAddress!.displayText}');
                        print('Куда: ${_toAddress!.displayText}');
                        Navigator.pop(context);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: (_fromAddress != null && _toAddress != null)
                      ? const Color(0xFF007AFF)
                      : const Color(0xFFE0E0E0),
                  foregroundColor: (_fromAddress != null && _toAddress != null)
                      ? Colors.white
                      : const Color(0xFF999999),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Продолжить',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
