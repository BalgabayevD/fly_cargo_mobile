import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/payments/presentation/add_card/bloc/add_card_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/add_card/bloc/add_card_event.dart';
import 'package:fly_cargo/features/payments/presentation/add_card/bloc/add_card_state.dart';
import 'package:fly_cargo/features/payments/presentation/payment_flow_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AddCardWidget extends StatefulWidget {
  const AddCardWidget({super.key});

  @override
  State<AddCardWidget> createState() => _AddCardWidgetState();
}

class _AddCardWidgetState extends State<AddCardWidget> {
  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    context.read<AddCardBloc>().add(const AddCardRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCardBloc, AddCardState>(
      listener: (context, state) {
        if (state is AddCardSuccess) {
          // Карта успешно добавлена, возвращаемся к списку карт
          context.read<PaymentFlowCubit>().showCards();
        }
      },
      builder: (context, state) {
        if (state is AddCardLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AddCardError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style: TextStyle(color: AppColors.danger),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AddCardBloc>().add(const AddCardRequested());
                    },
                    child: const Text('Попробовать снова'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is AddCardFormReady) {
          return _buildWebView(state.formUrl);
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildWebView(String url) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  context.read<PaymentFlowCubit>().showCards();
                },
              ),
              const Expanded(
                child: Text(
                  'Добавление карты',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 48), // Для симметрии
            ],
          ),
        ),
        Expanded(
          child: WebViewWidget(
            controller: _initWebViewController(url),
          ),
        ),
      ],
    );
  }

  WebViewController _initWebViewController(String url) {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            // Можно добавить логику для отслеживания успешного добавления карты
            if (url.contains('success') || url.contains('callback')) {
              context.read<AddCardBloc>().add(const AddCardCompleted());
            }
          },
          onPageFinished: (String url) {
            // Логика после загрузки страницы
          },
          onWebResourceError: (WebResourceError error) {
            context.read<AddCardBloc>().add(const AddCardCancelled());
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return _webViewController!;
  }
}

