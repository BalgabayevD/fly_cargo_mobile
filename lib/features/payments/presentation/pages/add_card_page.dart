import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/widgets/deeplink_parser.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_orders_page.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AddCardPage extends StatefulWidget {
  final String url;
  static const String path = '/payments/cards/add';

  static String location(String url) => Uri(
        path: path,
        queryParameters: {'url': url},
      ).toString();

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      redirect: (context, state) {
        final url = state.uri.queryParameters['url'];

        if (url == null || url.isEmpty) {
          return ClientOrdersPage.location();
        }

        return null;
      },
      builder: (BuildContext context, state) {
        final url = state.uri.queryParameters['url'];

        return AddCardPage(url: url!);
      },
      routes: routes,
    );
  }

  const AddCardPage({required this.url, super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() => _isLoading = true);

            final parser = DeepLinkParser(domain: 'sapsano.kz');
            final deeplink = parser.parse(url);

            if (deeplink is OrderPaymentLink) {
              // Доделать вывод модалки и обноление bloc
              // print(deeplink.status == PaymentStatus.success);
            }
          },
          onPageFinished: (String url) {
            setState(() => _isLoading = false);
          },
          onWebResourceError: (WebResourceError error) {
            setState(() => _isLoading = false);
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      padding: EdgeInsets.zero,
      title: 'Добавление карты',
      child: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading) const _LoadingOverlay(),
        ],
      ),
    );
  }
}

class _LoadingOverlay extends StatelessWidget {
  const _LoadingOverlay();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BeColors.white,
      child: Center(
        child: CircularProgressIndicator(color: BeColors.primary),
      ),
    );
  }
}
