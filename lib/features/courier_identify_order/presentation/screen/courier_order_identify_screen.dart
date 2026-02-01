import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/haptic.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/nothing.dart';
import 'package:fly_cargo/core/design_system/widgets/deeplink_parser.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/courier_identify_order/presentation/bloc/courier_identify_order_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_order_screen.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_orders_screen.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/courier_order_scan/scan_overlay.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CourierOrderIdentifyScreen extends StatelessWidget {
  final int orderId;

  static const String path = '/courier/order/:orderId/identify';

  final DeepLinkParser parser;

  static String location(int orderId) => Uri(
    path: path.replaceFirst(':orderId', orderId.toString()),
  ).toString();

  const CourierOrderIdentifyScreen({required this.orderId, super.key})
    : parser = const DeepLinkParser(domain: 'sapsano.kz');

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      redirect: (context, state) {
        final orderId = state.pathParameters['orderId'];

        if (orderId == null || orderId.isEmpty) {
          return CourierOrdersPage.location();
        }

        if (int.tryParse(orderId) == null) {
          return CourierOrdersPage.location();
        }

        return null;
      },
      builder: (context, state) {
        final orderId = int.parse(state.pathParameters['orderId']!);
        return BlocProvider<CourierIdentifyOrderBloc>(
          create: (BuildContext context) => getIt<CourierIdentifyOrderBloc>(),
          child: CourierOrderIdentifyScreen(orderId: orderId),
        );
      },
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      title: 'Привязать QR-код',
      backgroundColor: BeColors.white,
      centerTitle: true,
      isBorder: true,
      padding: EdgeInsets.zero,
      child: BlocConsumer<CourierIdentifyOrderBloc, CourierIdentifyOrderState>(
        listener: (BuildContext context, CourierIdentifyOrderState state) {
          if (state is CourierIdentifyOrderSuccessState) {
            Future.delayed(const Duration(seconds: 1), () {
              if (context.mounted) {
                context.push(CourierOrderScreen.location(orderId));
              }
            });
          }

          if (state is CourierIdentifyOrderFailureState) {
            Future.delayed(const Duration(seconds: 1), () {
              if (context.mounted) {
                context.read<CourierIdentifyOrderBloc>().add(
                  CourierIdentifyOrderResetEvent(),
                );
              }
            });
          }
        },
        builder: (BuildContext context, CourierIdentifyOrderState state) {
          if (state is CourierIdentifyOrderInitialState) {
            return Stack(
              children: [
                MobileScanner(
                  controller: MobileScannerController(
                    detectionTimeoutMs: 1000,
                  ),
                  onDetect: (result) {
                    BeHaptic.onScan();
                    if (result.barcodes.first.rawValue != null) {
                      final deeplink = parser.parse(
                        result.barcodes.first.rawValue!,
                      );

                      if (deeplink is OrderIdentificationLink) {
                        context.read<CourierIdentifyOrderBloc>().add(
                          CourierIdentifyOrderLoadEvent(
                            orderId,
                            deeplink.identification,
                          ),
                        );
                      }
                    }
                  },
                ),

                QRScannerOverlay(
                  finderColor: BeColors.primary,
                  variant: .idle,
                ),
              ],
            );
          }

          if (state is CourierIdentifyOrderLoadingState) {
            return Stack(
              children: [
                MobileScanner(
                  controller: MobileScannerController(
                    detectionTimeoutMs: 1000,
                  ),
                ),

                QRScannerOverlay(
                  finderColor: BeColors.success,
                  variant: .loading,
                ),
              ],
            );
          }

          if (state is CourierIdentifyOrderSuccessState) {
            return Stack(
              children: [
                MobileScanner(
                  controller: MobileScannerController(
                    detectionTimeoutMs: 1000,
                  ),
                ),

                QRScannerOverlay(
                  finderColor: BeColors.success,
                  variant: .success,
                ),
              ],
            );
          }

          if (state is CourierIdentifyOrderFailureState) {
            return Stack(
              children: [
                MobileScanner(
                  controller: MobileScannerController(
                    detectionTimeoutMs: 1000,
                  ),
                ),

                QRScannerOverlay(
                  finderColor: BeColors.danger,
                  variant: .failure,
                ),
              ],
            );
          }

          return const BeNothing();
        },
      ),
    );
  }
}
