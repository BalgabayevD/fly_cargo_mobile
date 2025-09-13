import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/destination/models/city_model.dart';
import 'package:fly_cargo/features/destination/services/cities_api_service.dart';
import 'package:fly_cargo/providers/network-repository.dart';

enum CityType { from, to }

class ChooseCityPage extends StatefulWidget {
  final CityType cityType;

  const ChooseCityPage({super.key, required this.cityType});

  @override
  State<ChooseCityPage> createState() => _ChooseCityPageState();
}

class _ChooseCityPageState extends State<ChooseCityPage> {
  final TextEditingController _searchController = TextEditingController();
  late final CitiesApiService _citiesApiService;

  List<CityModel> _cities = [];
  List<CityModel> _filteredCities = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Получаем Dio из NetworkRepository с настроенными interceptor'ами
    final networkRepo = context.read<NetworkRepository>();
    _citiesApiService = CitiesApiService(networkRepo.dio);

    _loadCities();
    _searchController.addListener(_filterCities);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadCities() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      // Загружаем только нужные города в зависимости от типа
      final cities = widget.cityType == CityType.from
          ? await _citiesApiService.getCitiesFrom()
          : await _citiesApiService.getCitiesTo();

      setState(() {
        _cities = cities;
        _filteredCities = cities;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
        // Загружаем fallback данные в случае ошибки
        _loadFallbackCities();
      });
    }
  }

  void _loadFallbackCities() {
    // Fallback данные на случай ошибки API
    _cities = [
      const CityModel(id: '1', name: 'Алматы', region: 'Алматинская область'),
      const CityModel(id: '2', name: 'Астана', region: 'Акмолинская область'),
      const CityModel(
        id: '3',
        name: 'Шымкент',
        region: 'Туркестанская область',
      ),
      const CityModel(id: '4', name: 'Атырау', region: 'Атырауская область'),
      const CityModel(id: '5', name: 'Актобе', region: 'Актюбинская область'),
      const CityModel(id: '6', name: 'Тараз', region: 'Жамбылская область'),
      const CityModel(
        id: '7',
        name: 'Павлодар',
        region: 'Павлодарская область',
      ),
      const CityModel(
        id: '8',
        name: 'Семей',
        region: 'Восточно-Казахстанская область',
      ),
      const CityModel(
        id: '9',
        name: 'Усть-Каменогорск',
        region: 'Восточно-Казахстанская область',
      ),
      const CityModel(
        id: '10',
        name: 'Уральск',
        region: 'Западно-Казахстанская область',
      ),
      const CityModel(
        id: '11',
        name: 'Костанай',
        region: 'Костанайская область',
      ),
      const CityModel(
        id: '12',
        name: 'Кызылорда',
        region: 'Кызылординская область',
      ),
      const CityModel(id: '13', name: 'Актау', region: 'Мангистауская область'),
      const CityModel(
        id: '14',
        name: 'Петропавловск',
        region: 'Северо-Казахстанская область',
      ),
      const CityModel(
        id: '15',
        name: 'Туркестан',
        region: 'Туркестанская область',
      ),
    ];
    _filteredCities = _cities;
  }

  void _filterCities() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCities = _cities.where((city) {
        return city.name.toLowerCase().contains(query) ||
            (city.region?.toLowerCase().contains(query) ?? false);
      }).toList();
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
          widget.cityType == CityType.from
              ? 'Город отправки'
              : 'Город доставки',
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
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Поиск города...',
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
          ),
          Expanded(child: _buildCitiesList()),
        ],
      ),
    );
  }

  Widget _buildCitiesList() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF007AFF)),
            ),
            SizedBox(height: 16),
            Text(
              'Загрузка городов...',
              style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
            ),
          ],
        ),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Color(0xFF666666),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ошибка загрузки',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _loadCities,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007AFF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text('Повторить'),
              ),
            ],
          ),
        ),
      );
    }

    if (_filteredCities.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Color(0xFF666666)),
            SizedBox(height: 16),
            Text(
              'Города не найдены',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Попробуйте изменить поисковый запрос',
              style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _filteredCities.length,
      itemBuilder: (context, index) {
        final city = _filteredCities[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.location_city, color: Color(0xFF666666)),
          ),
          title: Text(
            city.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: city.region != null
              ? Text(
                  city.region!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                  ),
                )
              : null,
          onTap: () {
            Navigator.pop(context, city);
          },
        );
      },
    );
  }
}
