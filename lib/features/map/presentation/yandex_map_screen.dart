import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapScreen extends StatefulWidget {
  const YandexMapScreen({super.key});

  @override
  State<YandexMapScreen> createState() => _YandexMapScreenState();
}

const almatyPoint = Point(latitude: 43.238949, longitude: 76.889709);

class _YandexMapScreenState extends State<YandexMapScreen> {
  late final MapObjectId _placemarkId;
  late final List<MapObject> _mapObjects;
  YandexMapController? _controller;

  @override
  void initState() {
    super.initState();
    _placemarkId = const MapObjectId('almaty_placemark');
    _mapObjects = <MapObject>[
      PlacemarkMapObject(
        mapId: _placemarkId,
        point: almatyPoint,
        opacity: 1,
        // icon: PlacemarkIcon.single(
        //   PlacemarkIconStyle(
        //     image: BitmapDescriptor.fromDefaultAsset(DefaultAsset.preset),
        //     scale: 1,
        //   ),
        // ),
      ),
    ];
  }

  Future<void> _moveToAlmaty() async {
    final controller = _controller;
    if (controller == null) return;
    await controller.moveCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: almatyPoint,
          zoom: 12,
          azimuth: 0,
          tilt: 0,
        ),
      ),
      animation: const MapAnimation(
        type: MapAnimationType.smooth,
        duration: 0.4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yandex Map — Алматы')),
      body: YandexMap(
        onMapCreated: (c) async {
          _controller = c;
          await _moveToAlmaty();
        },
        mapObjects: _mapObjects,
        mode2DEnabled: true,
        nightModeEnabled: false,
        rotateGesturesEnabled: true,
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('К центру'),
        icon: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
