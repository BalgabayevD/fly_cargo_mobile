import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/widgets/deeplink_parser.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_orders_page.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AddCardPage extends StatelessWidget {
  final String url;
  static const String path = '/cards/add';

  static String location(String url) => Uri(
    path: path,
    queryParameters: {
      'url': url,
    },
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

  WebViewController getController(BuildContext context) {
    final webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            final parser = DeepLinkParser(domain: 'sapsano.kz');
            final deeplink = parser.parse(url);

            if (deeplink is OrderPaymentLink) {
              // Доделать вывод модалки и обноление bloc
              print(deeplink.status == PaymentStatus.success);
            }
          },
          onWebResourceError: (WebResourceError error) {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return webViewController;
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      padding: EdgeInsets.zero,
      title: 'Добавление карты',
      child: WebViewWidget(
        controller: getController(context),
      ),
    );
  }
}
