import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_order_state.dart';

mixin OrderBlocListenerMixin<T extends StatefulWidget> on State<T> {
  bool get isAnalyzing;
  
  void setAnalyzing(bool value);
  void updatePreOrderData(PreCreateOrderData data, AnalysisStatus status);
  void resetOrderForm();
  void showSuccessMessage(String message);
  void showErrorMessage(String message);

  void handleOrdersState(BuildContext context, CreateOrderState state) {
    if (state is CreateOrderLoading) {
      // Показываем индикатор загрузки
    } else if (state is CreateOrderUnauthorized) {
      setAnalyzing(false);
      showErrorMessage('Для создания заказа необходимо войти в аккаунт');
    } else if (state is CreateOrderError) {
      setAnalyzing(false);
      showErrorMessage(state.message);
    } else if (state is PreOrderAnalyzed) {
      updatePreOrderData(state.preOrderData, state.analysisStatus);

      if (state.analysisStatus == AnalysisStatus.none) {
        showSuccessMessage('Анализ завершен! Данные заполнены автоматически');
      }
    } else if (state is OrderCreated) {
      showSuccessMessage('Заказ #${state.orderResult.orderId} создан успешно!');
      resetOrderForm();
    }
  }

  void showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.danger,
        ),
      );
    }
  }

  void showSuccess(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }
}

