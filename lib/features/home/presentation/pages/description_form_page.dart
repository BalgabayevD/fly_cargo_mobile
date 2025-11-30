import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

/// Модальная страница для ввода описания посылки
class DescriptionFormPage extends StatefulWidget {
  final String? initialDescription;

  const DescriptionFormPage({
    this.initialDescription,
    super.key,
  });

  @override
  State<DescriptionFormPage> createState() => _DescriptionFormPageState();
}

class _DescriptionFormPageState extends State<DescriptionFormPage> {
  late final TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController(text: widget.initialDescription);
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pop(_descriptionController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Описание',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            TextFormField(
              controller: _descriptionController,
              maxLines: 6,
              decoration: InputDecoration(
                labelText: 'Описание посылки',
                hintText: 'Опишите содержимое посылки',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                  borderSide: const BorderSide(color: AppColors.borderLight),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                  borderSide: const BorderSide(color: AppColors.borderLight),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                  borderSide: const BorderSide(color: AppColors.primary, width: 2),
                ),
                filled: true,
                fillColor: AppColors.surfaceVariant,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Введите описание посылки';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.xxl),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _onSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Сохранить',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

