import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/payments/presentation/add_card/bloc/add_card_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/add_card/bloc/add_card_event.dart';
import 'package:fly_cargo/features/payments/presentation/add_card/bloc/add_card_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    // Получаем BLoC из контекста после первого build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddCardBloc>().add(const AddCardRequested());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: AppColors.surface5),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: Text(
          'Добавление карты',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.surface5,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AddCardBloc, AddCardState>(
        listener: (context, state) {
          if (state is AddCardSuccess) {
            // Карта успешно добавлена, возвращаемся с результатом true
            Navigator.pop(context, true);
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
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: AppColors.danger,
                    ),
                    const SizedBox(height: 16),
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
            return WebViewWidget(
              controller: _initWebViewController(state.formUrl),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  WebViewController _initWebViewController(String url) {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            // Отслеживаем URL для определения успешного добавления
            if (url.contains('success') || 
                url.contains('callback') ||
                url.contains('complete')) {
              context.read<AddCardBloc>().add(const AddCardCompleted());
            }
          },
          onPageFinished: (String url) {
            // Можно добавить дополнительную логику
          },
          onWebResourceError: (WebResourceError error) {
            context.read<AddCardBloc>().add(const AddCardCancelled());
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return _webViewController!;
  }

  @override
  void dispose() {
    _webViewController = null;
    super.dispose();
  }
}

