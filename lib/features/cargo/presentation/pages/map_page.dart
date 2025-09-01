import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../shared/widgets/localized_text_widget.dart';
import '../../domain/entities/location.dart';
import '../bloc/map_bloc.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LocationInitializer(
        child: BlocListener<MapBloc, MapState>(
          listener: (context, state) {
            if (state is MapLoaded && state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: LocalizedTextWidget(textKey: state.errorMessage!),
                ),
              );
            }
          },
          child: BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              if (state is MapInitial) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is MapLoaded) {
                return Stack(
                  children: [
                    SizedBox.expand(child: MapWidget(state: state)),
                    DestinationFieldWidget(state: state),
                    SearchResultsWidget(state: state),
                    BottomPanelWidget(state: state),
                  ],
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

class LocationInitializer extends StatefulWidget {
  final Widget child;

  const LocationInitializer({super.key, required this.child});

  @override
  State<LocationInitializer> createState() => _LocationInitializerState();
}

class _LocationInitializerState extends State<LocationInitializer> {
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      final location = Location(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      if (mounted) {
        context.read<MapBloc>().add(MapLocationChanged(location));
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class MapWidget extends StatefulWidget {
  final MapLoaded state;

  const MapWidget({super.key, required this.state});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  YandexMapController? _mapController;

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS && _isSimulator()) {
      return SimulatorPlaceholderWidget(state: widget.state);
    }

    return YandexMap(
      onMapCreated: (YandexMapController controller) {
        _mapController = controller;
        if (widget.state.currentLocation != null) {
          controller.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: Point(
                  latitude: widget.state.currentLocation!.latitude,
                  longitude: widget.state.currentLocation!.longitude,
                ),
                zoom: 15.0,
              ),
            ),
          );
        }
      },
      mapObjects: _buildMapObjects(),
    );
  }

  bool _isSimulator() {
    if (!Platform.isIOS) return false;

    final environment = Platform.environment;
    return environment.containsKey('SIMULATOR_DEVICE_NAME') ||
        environment.containsKey('SIMULATOR_HOST_HOME');
  }

  List<MapObject> _buildMapObjects() {
    final mapObjects = <MapObject>[];

    if (widget.state.currentLocation != null) {
      mapObjects.add(
        PlacemarkMapObject(
          mapId: const MapObjectId('current_location'),
          point: Point(
            latitude: widget.state.currentLocation!.latitude,
            longitude: widget.state.currentLocation!.longitude,
          ),
          onTap: (_, __) {},
        ),
      );
    }

    if (widget.state.selectedLocation != null) {
      mapObjects.add(
        PlacemarkMapObject(
          mapId: const MapObjectId('selected_location'),
          point: Point(
            latitude: widget.state.selectedLocation!.latitude,
            longitude: widget.state.selectedLocation!.longitude,
          ),
          onTap: (_, __) {},
        ),
      );
    }

    return mapObjects;
  }
}

class DestinationFieldWidget extends StatefulWidget {
  final MapLoaded state;

  const DestinationFieldWidget({super.key, required this.state});

  @override
  State<DestinationFieldWidget> createState() => _DestinationFieldWidgetState();
}

class _DestinationFieldWidgetState extends State<DestinationFieldWidget> {
  final TextEditingController _destinationController = TextEditingController();
  final FocusNode _destinationFocusNode = FocusNode();

  @override
  void dispose() {
    _destinationController.dispose();
    _destinationFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 80,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: LocalizedTextWidget(
                    textKey: 'home',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _destinationController,
                    focusNode: _destinationFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Куда доставить?',
                      border: InputBorder.none,
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        context.read<MapBloc>().add(
                          SearchLocationsRequested(value),
                        );
                      } else {
                        context.read<MapBloc>().add(ClearSearch());
                      }
                    },
                  ),
                ),
                if (_destinationController.text.isNotEmpty)
                  IconButton(
                    onPressed: () {
                      _destinationController.clear();
                      context.read<MapBloc>().add(ClearSearch());
                    },
                    icon: const Icon(Icons.clear),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResultsWidget extends StatelessWidget {
  final MapLoaded state;

  const SearchResultsWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, currentState) {
        if (currentState is! MapLoaded || currentState.searchResults.isEmpty) {
          return const SizedBox.shrink();
        }

        return Positioned(
          top: MediaQuery.of(context).padding.top + 180,
          left: 16,
          right: 16,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 300),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: currentState.searchResults.length,
              itemBuilder: (context, index) {
                final location = currentState.searchResults[index];
                return ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.grey),
                  title: Text(location.name ?? 'Неизвестное место'),
                  subtitle: Text(location.address ?? ''),
                  onTap: () {
                    context.read<MapBloc>().add(LocationSelected(location));
                    context.read<MapBloc>().add(ClearSearch());
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class BottomPanelWidget extends StatelessWidget {
  final MapLoaded state;

  const BottomPanelWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            if (state.selectedLocation != null) ...[
              LocationInfoWidget(location: state.selectedLocation!),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const LocalizedTextWidget(
                    textKey: 'add',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ] else ...[
              const LocalizedTextWidget(
                textKey: 'enterDestination',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class LocationInfoWidget extends StatelessWidget {
  final Location location;

  const LocationInfoWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.location_on, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.name ?? 'Выбранная точка',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (location.address != null)
                  Text(
                    location.address!,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SimulatorPlaceholderWidget extends StatelessWidget {
  final MapLoaded state;

  const SimulatorPlaceholderWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone_iphone, size: 64, color: Colors.blue[400]),
            const SizedBox(height: 16),
            Text(
              'Яндекс.Карты на iOS симуляторе',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Для тестирования карт используйте реальное устройство',
              style: TextStyle(fontSize: 14, color: Colors.blue[500]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            if (state.currentLocation != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Текущая локация:',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${state.currentLocation!.latitude.toStringAsFixed(4)}, ${state.currentLocation!.longitude.toStringAsFixed(4)}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
