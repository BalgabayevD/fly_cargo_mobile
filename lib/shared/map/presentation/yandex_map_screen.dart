import 'package:flutter/material.dart';
import 'package:yandex_maps_mapkit_lite/mapkit.dart' hide Icon;
import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart';
import 'package:yandex_maps_mapkit_lite/yandex_map.dart';

class YandexMapScreen extends StatefulWidget {
  const YandexMapScreen({super.key});

  @override
  State<YandexMapScreen> createState() => _YandexMapScreenState();
}

const almatyPoint = Point(latitude: 43.238949, longitude: 76.889709);

class _YandexMapScreenState extends State<YandexMapScreen> {
  MapWindow? controller;

  final almatyPoint = Point(latitude: 43.238949, longitude: 76.889709);

  @override
  void initState() {
    super.initState();
    mapkit.onStart();
  }

  Future<void> _moveToAlmaty() async {
    controller?.map.move(
      CameraPosition(almatyPoint, zoom: 17.0, azimuth: 150.0, tilt: 30.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YandexMap(
        platformViewType: PlatformViewType.Virtual,
        onMapCreated: (mapWindow) {
          controller = mapWindow;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _moveToAlmaty,
        label: const Text('К центру'),
        icon: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
