import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/destination/models/address_model.dart';
import 'package:fly_cargo/features/destination/models/address_suggestion_model.dart';
import 'package:fly_cargo/features/destination/models/city_model.dart';
import 'package:fly_cargo/features/destination/services/addresses_api_service.dart';
import 'package:fly_cargo/providers/network-repository.dart';

class ChooseAddressPage extends StatefulWidget {
  final CityModel selectedCity;

  const ChooseAddressPage({super.key, required this.selectedCity});

  @override
  State<ChooseAddressPage> createState() => _ChooseAddressPageState();
}

class _ChooseAddressPageState extends State<ChooseAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  late final AddressesApiService _addressesApiService;

  List<AddressSuggestionModel> _suggestedAddresses = [];
  List<AddressSuggestionModel> _filteredAddresses = [];
  bool _isLoading = false;
  String? _errorMessage;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    // Получаем Dio из NetworkRepository с настроенными interceptor'ами
    final networkRepo = context.read<NetworkRepository>();
    _addressesApiService = AddressesApiService(networkRepo.dio);

    _loadSuggestedAddresses();
    _addressController.addListener(_onAddressChanged);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _addressController.dispose();
    super.dispose();
  }

  void _loadSuggestedAddresses() {
    // Загружаем популярные адреса для выбранного города
    _searchAddresses('');
  }

  Future<void> _searchAddresses(String query) async {
    if (query.trim().isEmpty) {
      // Если запрос пустой, показываем популярные адреса
      _loadFallbackAddresses();
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final addresses = await _addressesApiService.searchAddresses(
        city: widget.selectedCity.name,
        address: query,
      );

      setState(() {
        _suggestedAddresses = addresses;
        _filteredAddresses = addresses;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
        // Загружаем fallback данные в случае ошибки
        _loadFallbackAddresses();
      });
    }
  }

  void _loadFallbackAddresses() {
    // Fallback данные на случай ошибки API
    _suggestedAddresses = [
      const AddressSuggestionModel(title: 'ул. Абая, 1'),
      const AddressSuggestionModel(title: 'ул. Абая, 10'),
      const AddressSuggestionModel(title: 'ул. Абая, 25'),
      const AddressSuggestionModel(title: 'ул. Абая, 50'),
      const AddressSuggestionModel(title: 'ул. Абая, 94'),
      const AddressSuggestionModel(title: 'пр. Назарбаева, 1'),
      const AddressSuggestionModel(title: 'пр. Назарбаева, 10'),
      const AddressSuggestionModel(title: 'пр. Назарбаева, 25'),
      const AddressSuggestionModel(title: 'пр. Назарбаева, 50'),
      const AddressSuggestionModel(title: 'пр. Назарбаева, 100'),
    ];
    _filteredAddresses = _suggestedAddresses;
  }

  void _selectAddress(AddressSuggestionModel addressSuggestion) {
    final fullAddress = AddressModel(
      city: widget.selectedCity.name,
      address: addressSuggestion.title,
      fullAddress: '${widget.selectedCity.name}, ${addressSuggestion.title}',
    );
    Navigator.pop(context, fullAddress);
  }

  void _confirmCustomAddress() {
    if (_addressController.text.trim().isNotEmpty) {
      // Создаем временный объект для кастомного адреса
      final customAddress = AddressSuggestionModel(
        title: _addressController.text.trim(),
      );
      _selectAddress(customAddress);
    }
  }

  void _onAddressChanged() {
    // Обновляем UI сразу для кнопки подтверждения
    setState(() {});

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 800), () {
      if (mounted) {
        _searchAddresses(_addressController.text);
      }
    });
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
          // Заголовок с информацией о городе
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF007AFF), Color(0xFF0056CC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Выберите адрес',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_city,
                      color: Colors.white70,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.selectedCity.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Поле поиска
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: 'Введите адрес...',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                  size: 24,
                ),
                suffixIcon: _isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF007AFF),
                            ),
                          ),
                        ),
                      )
                    : _addressController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.grey[600]),
                        onPressed: () {
                          _addressController.clear();
                          _searchAddresses('');
                        },
                      )
                    : null,
              ),
              style: const TextStyle(fontSize: 16),
              onSubmitted: (_) => _confirmCustomAddress(),
            ),
          ),

          // Кнопка подтверждения (будет показываться через setState)
          if (_addressController.text.isNotEmpty)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
                  'Использовать этот адрес',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),

          // Заголовок результатов
          if (_filteredAddresses.isNotEmpty || _isLoading)
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey[600], size: 20),
                  const SizedBox(width: 8),
                  Text(
                    _isLoading
                        ? 'Поиск адресов...'
                        : 'Найденные адреса (${_filteredAddresses.length})',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: _isLoading && _filteredAddresses.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage != null && _filteredAddresses.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Color(0xFF666666),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Ошибка загрузки адресов',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _errorMessage!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () =>
                              _searchAddresses(_addressController.text),
                          child: const Text('Повторить'),
                        ),
                      ],
                    ),
                  )
                : _filteredAddresses.isEmpty &&
                      _addressController.text.isNotEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Адреса не найдены',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Попробуйте изменить запрос',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredAddresses.length,
                    itemBuilder: (context, index) {
                      final address = _filteredAddresses[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          leading: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF007AFF), Color(0xFF0056CC)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                          title: Text(
                            address.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF333333),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_city,
                                  size: 14,
                                  color: Colors.grey[500],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  widget.selectedCity.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey[400],
                          ),
                          onTap: () => _selectAddress(address),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
