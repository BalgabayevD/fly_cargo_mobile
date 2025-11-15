import 'package:flutter/material.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/destination/presentation/pages/choose_address_page.dart';
import 'package:fly_cargo/shared/destination/presentation/pages/choose_city_page.dart';
class SendPackageBottomSheet extends StatefulWidget {
  final Function(AddressModel fromAddress, AddressModel toAddress)?
  onAddressesSelected;
  final AddressModel? initialFromAddress;
  final AddressModel? initialToAddress;
  const SendPackageBottomSheet({
    super.key,
    this.onAddressesSelected,
    this.initialFromAddress,
    this.initialToAddress,
  });
  @override
  State<SendPackageBottomSheet> createState() => _SendPackageBottomSheetState();
}
class _SendPackageBottomSheetState extends State<SendPackageBottomSheet> {
  AddressModel? _fromAddress;
  AddressModel? _toAddress;
  @override
  void initState() {
    super.initState();
    _fromAddress = widget.initialFromAddress;
    _toAddress = widget.initialToAddress;
  }
  Future<void> _selectFromAddress() async {
    final city = await Navigator.push<dynamic>(
      context,
      MaterialPageRoute(
        builder: (context) => const ChooseCityPage(cityType: CityType.from),
      ),
    );
    if (city != null) {
      final address = await Navigator.push<AddressModel>(
        context,
        MaterialPageRoute(
          builder: (context) => ChooseAddressPage(city: city.name),
        ),
      );
      if (address != null) {
        setState(() {
          _fromAddress = AddressModel(
            city: address.city,
            address: address.address,
            cityId: city.id,
            fullAddress: address.fullAddress,
          );
        });
      }
    }
  }
  Future<void> _selectToAddress() async {
    if (_fromAddress == null) {
      _showAlert(
        'Сначала выберите город отправки',
        'Для выбора города доставки необходимо сначала указать город отправки.',
      );
      return;
    }
    final city = await Navigator.push<dynamic>(
      context,
      MaterialPageRoute(
        builder: (context) => ChooseCityPage(
          cityType: CityType.to,
          fromCityId: _fromAddress!.cityId,
        ),
      ),
    );
    if (city != null) {
      final address = await Navigator.push<AddressModel>(
        context,
        MaterialPageRoute(
          builder: (context) => ChooseAddressPage(city: city.name),
        ),
      );
      if (address != null) {
        setState(() {
          _toAddress = AddressModel(
            city: address.city,
            address: address.address,
            cityId: city.id,
            fullAddress: address.fullAddress,
          );
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_fromAddress != null || _toAddress != null)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _fromAddress = null;
                            _toAddress = null;
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Сбросить',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
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
                        widget.onAddressesSelected?.call(
                          _fromAddress!,
                          _toAddress!,
                        );
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
  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          content: Text(message, style: const TextStyle(fontSize: 16)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Понятно',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF007AFF),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
