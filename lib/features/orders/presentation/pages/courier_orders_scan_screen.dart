import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/widgets/deeplink_parser.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/courier_order_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_accept_order_screen.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/courier_order_scan/scan_overlay.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CourierOrdersScanScreen extends StatelessWidget {
  static const String path = '/courier/scan';

  static String location() => Uri(path: path).toString();

  const CourierOrdersScanScreen({super.key});

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) => BlocProvider<CourierOrderBloc>(
        create: (_) => getIt<CourierOrderBloc>(),
        child: const _CourierOrdersScanScreenContent(),
      ),
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourierOrderBloc>(
      create: (_) => getIt<CourierOrderBloc>(),
      child: const _CourierOrdersScanScreenContent(),
    );
  }
}

class _CourierOrdersScanScreenContent extends StatefulWidget {
  const _CourierOrdersScanScreenContent();

  @override
  State<_CourierOrdersScanScreenContent> createState() =>
      _CourierOrdersScanScreenContentState();
}

class _CourierOrdersScanScreenContentState
    extends State<_CourierOrdersScanScreenContent> {
  final DeepLinkParser _parser = const DeepLinkParser(domain: 'sapsano.kz');
  final MobileScannerController _scannerController = MobileScannerController();
  bool _isProcessing = false;

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture result) {
    if (_isProcessing) return;
    if (result.barcodes.isEmpty) return;

    final rawValue = result.barcodes.first.rawValue;
    if (rawValue == null) return;

    final deeplink = _parser.parse(rawValue);

    if (deeplink is OrderIdentificationLink) {
      setState(() => _isProcessing = true);
      _scannerController.stop();

      context.read<CourierOrderBloc>().add(
            CourierOrderLoadIdentificationEvent(deeplink.identification),
          );
    }
  }

  void _resetScanner() {
    setState(() => _isProcessing = false);
    _scannerController.start();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CourierOrderBloc, CourierOrderState>(
      listener: (context, state) {
        if (state is CourierOrderLoadedState) {
          context.pushReplacement(
            CourierAcceptOrdersPage.location(state.order.id),
          );
        } else if (state is CourierOrderInitialState && _isProcessing) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Заказ не найден'),
              backgroundColor: BeColors.danger,
            ),
          );
          _resetScanner();
        }
      },
      child: BePage(
        title: 'Принять заказ',
        backgroundColor: BeColors.white,
        centerTitle: true,
        isBorder: true,
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            MobileScanner(
              controller: _scannerController,
              onDetect: _onDetect,
            ),
            const QRScannerOverlay(),
            if (_isProcessing)
              Container(
                color: Colors.black54,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: BeColors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
