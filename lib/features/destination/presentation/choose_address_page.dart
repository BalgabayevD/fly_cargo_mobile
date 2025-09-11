import 'package:flutter/material.dart';
import 'package:fly_cargo/features/destination/models/address_model.dart';
import 'package:fly_cargo/features/destination/models/city_model.dart';

class ChooseAddressPage extends StatefulWidget {
  final CityModel selectedCity;

  const ChooseAddressPage({super.key, required this.selectedCity});

  @override
  State<ChooseAddressPage> createState() => _ChooseAddressPageState();
}

class _ChooseAddressPageState extends State<ChooseAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  List<String> _suggestedAddresses = [];
  List<String> _filteredAddresses = [];

  @override
  void initState() {
    super.initState();
    _loadSuggestedAddresses();
    _searchController.addListener(_filterAddresses);
  }

  @override
  void dispose() {
    _addressController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _loadSuggestedAddresses() {
    // Здесь можно загрузить адреса из API или использовать статический список
    // В реальном приложении это может быть геокодирование или поиск по базе адресов
    _suggestedAddresses = [
      'ул. Абая, 1',
      'ул. Абая, 10',
      'ул. Абая, 25',
      'ул. Абая, 50',
      'ул. Абая, 94',
      'пр. Назарбаева, 1',
      'пр. Назарбаева, 10',
      'пр. Назарбаева, 25',
      'пр. Назарбаева, 50',
      'пр. Назарбаева, 100',
      'ул. Сатпаева, 1',
      'ул. Сатпаева, 10',
      'ул. Сатпаева, 25',
      'ул. Сатпаева, 50',
      'ул. Сатпаева, 100',
      'ул. Достык, 1',
      'ул. Достык, 10',
      'ул. Достык, 25',
      'ул. Достык, 50',
      'ул. Достык, 100',
    ];
    _filteredAddresses = _suggestedAddresses;
  }

  void _filterAddresses() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredAddresses = _suggestedAddresses.where((address) {
        return address.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _selectAddress(String address) {
    final fullAddress = AddressModel(
      city: widget.selectedCity.name,
      address: address,
      fullAddress: '${widget.selectedCity.name}, $address',
    );
    Navigator.pop(context, fullAddress);
  }

  void _confirmCustomAddress() {
    if (_addressController.text.trim().isNotEmpty) {
      _selectAddress(_addressController.text.trim());
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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Адрес в ${widget.selectedCity.name}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Введите адрес',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: TextField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      hintText: 'Например: ул. Абая, 94',
                      hintStyle: TextStyle(color: Color(0xFF999999)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      suffixIcon: Icon(
                        Icons.location_on,
                        color: Color(0xFF666666),
                      ),
                    ),
                    style: const TextStyle(fontSize: 16),
                    onSubmitted: (_) => _confirmCustomAddress(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _confirmCustomAddress,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007AFF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Подтвердить адрес',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xFFE0E0E0), height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Популярные адреса',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Поиск адреса...',
                      hintStyle: TextStyle(color: Color(0xFF999999)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      prefixIcon: Icon(Icons.search, color: Color(0xFF666666)),
                    ),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredAddresses.length,
              itemBuilder: (context, index) {
                final address = _filteredAddresses[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.location_on,
                      color: Color(0xFF666666),
                    ),
                  ),
                  title: Text(
                    address,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    widget.selectedCity.name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                  ),
                  onTap: () => _selectAddress(address),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
