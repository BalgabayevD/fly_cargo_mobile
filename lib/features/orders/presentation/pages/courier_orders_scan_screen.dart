import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/widgets/deeplink_parser.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/courier_order_scan/scan_overlay.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CourierOrdersScanScreen extends StatelessWidget {
  static const String path = '/courier/scan';

  final DeepLinkParser parser;
  static String location() => Uri(path: path).toString();

  const CourierOrdersScanScreen({super.key})
    : parser = const DeepLinkParser(domain: 'sapsano.kz');

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) => const CourierOrdersScanScreen(),
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      title: 'Принять заказ',
      backgroundColor: BeColors.white,
      centerTitle: true,
      isBorder: true,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          MobileScanner(
            onDetect: (result) {
              if (result.barcodes.first.rawValue != null) {
                final deeplink = parser.parse(result.barcodes.first.rawValue!);

                if (deeplink is OrderIdentificationLink) {
                  print('deeplink is OrderIdentificationLink');
                  print(deeplink.identification);
                }
              }
            },
          ),

          const QRScannerOverlay(),
        ],
      ),
    );
  }
}
