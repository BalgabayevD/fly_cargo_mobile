import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/haptic.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/widgets/deeplink_parser.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/accumulator/presentation/bloc/accumulator_scan_bloc.dart';
import 'package:fly_cargo/features/accumulator/presentation/bloc/accumulator_scan_event.dart';
import 'package:fly_cargo/features/accumulator/presentation/bloc/accumulator_scan_state.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/courier_order_scan/scan_overlay.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AccumulatorScanScreen extends StatelessWidget {
  static const String path = '/courier/accumulator/scan';

  final DeepLinkParser parser;

  static String location() => Uri(path: path).toString();

  const AccumulatorScanScreen({super.key})
      : parser = const DeepLinkParser(domain: 'sapsano.kz');

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<AccumulatorScanBloc>(),
        child: const AccumulatorScanScreen(),
      ),
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccumulatorScanBloc, AccumulatorScanState>(
      listener: (context, state) {
        if (state is AccumulatorScanScannedState) {
          BeHaptic.onScan();
        }

        if (state is AccumulatorScanSuccessState) {
          Future.delayed(const Duration(seconds: 1), () {
            if (context.mounted) {
              context.read<AccumulatorScanBloc>().add(
                    AccumulatorScanResetEvent(),
                  );
            }
          });
        }

        if (state is AccumulatorScanErrorState) {
          _showErrorSnackBar(context, state.message);
          Future.delayed(const Duration(seconds: 1), () {
            if (context.mounted) {
              context.read<AccumulatorScanBloc>().add(
                    AccumulatorScanResetEvent(),
                  );
            }
          });
        }
      },
      builder: (context, state) {
        return BePage(
          title: 'Принять прибывшие заказы',
          backgroundColor: BeColors.white,
          centerTitle: true,
          isBorder: true,
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              MobileScanner(
                onDetect: (result) => _onDetect(context, result, state),
              ),
              QRScannerOverlay(
                variant: _overlayVariant(state),
                finderColor: _finderColor(state),
              ),
            ],
          ),
        );
      },
    );
  }

  QRScannerOverlayVariant _overlayVariant(AccumulatorScanState state) {
    if (state is AccumulatorScanScannedState ||
        state is AccumulatorScanSuccessState) {
      return QRScannerOverlayVariant.success;
    }
    if (state is AccumulatorScanErrorState) {
      return QRScannerOverlayVariant.failure;
    }
    return QRScannerOverlayVariant.idle;
  }

  Color _finderColor(AccumulatorScanState state) {
    if (state is AccumulatorScanScannedState ||
        state is AccumulatorScanSuccessState) {
      return BeColors.success;
    }
    if (state is AccumulatorScanErrorState) {
      return BeColors.danger;
    }
    return BeColors.primary;
  }

  void _onDetect(
    BuildContext context,
    BarcodeCapture result,
    AccumulatorScanState state,
  ) {
    if (state is! AccumulatorScanInitialState) return;

    if (result.barcodes.first.rawValue != null) {
      final deeplink = parser.parse(result.barcodes.first.rawValue!);

      if (deeplink is OrderAccumulatorIdentificationLink) {
        context.read<AccumulatorScanBloc>().add(
              AccumulatorScanIdentificationEvent(
                deeplink.accumulatorId,
              ),
            );
      }
    }
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: BeColors.danger,
      ),
    );
  }
}
