import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/destination/presentation/bloc/destination_bloc.dart';
import 'package:fly_cargo/shared/destination/presentation/bloc/destination_event.dart';
import 'package:fly_cargo/shared/destination/presentation/bloc/destination_state.dart';

enum CityType { from, to }

class ChooseCityPage extends StatefulWidget {
  final CityType cityType;
  final String? fromCityId;

  const ChooseCityPage({super.key, required this.cityType, this.fromCityId});

  @override
  State<ChooseCityPage> createState() => _ChooseCityPageState();
}

class _ChooseCityPageState extends State<ChooseCityPage> {
  final TextEditingController _searchController = TextEditingController();
  late final DestinationBloc _destinationBloc;

  @override
  void initState() {
    super.initState();
    _destinationBloc = getIt<DestinationBloc>();
    _loadCities();
    _searchController.addListener(_filterCities);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadCities() {
    if (widget.cityType == CityType.from) {
      _destinationBloc.add(const LoadCitiesFromEvent());
    } else {
      _destinationBloc.add(
        LoadCitiesToEvent(fromCityId: widget.fromCityId ?? '1'),
      );
    }
  }

  void _filterCities() {

    setState(() {});
  }

  List<CityModel> _getFilteredCities(List<CityModel> cities) {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) return cities;

    return cities.where((city) {
      return city.name.toLowerCase().contains(query) ||
          (city.region?.toLowerCase().contains(query) ?? false);
    }).toList();
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
          Expanded(
            child: BlocBuilder<DestinationBloc, DestinationState>(
              bloc: _destinationBloc,
              builder: (context, state) {
                if (state is DestinationLoading) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF007AFF),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Загрузка городов...',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (state is DestinationError) {
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
                            state.message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF666666),
                            ),
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

                List<CityModel> cities = [];
                if (state is CitiesFromLoaded) {
                  cities = state.cities;
                } else if (state is CitiesToLoaded) {
                  cities = state.cities;
                } else if (state is AllCitiesLoaded) {
                  cities = state.cities;
                }

                final filteredCities = _getFilteredCities(cities);

                if (filteredCities.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Color(0xFF666666),
                        ),
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
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredCities.length,
                  itemBuilder: (context, index) {
                    final city = filteredCities[index];
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
                          Icons.location_city,
                          color: Color(0xFF666666),
                        ),
                      ),
                      title: Text(
                        city.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
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
                      onTap: () => Navigator.pop(context, city),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
