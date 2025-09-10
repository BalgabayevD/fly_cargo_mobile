import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/providers/authorization-repository.dart';
import 'package:fly_cargo/providers/network-repository.dart';
import 'package:go_router/go_router.dart';

class PhoneInputScreen extends StatefulWidget {
  const PhoneInputScreen({super.key});

  @override
  State<PhoneInputScreen> createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  final TextEditingController _phoneController = TextEditingController(
    text: '+7 (777) 380-66-02',
  );
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  String _formatPhoneNumber(String value) {
    // Удаляем все символы кроме цифр
    String digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    // Если номер начинается с 8, заменяем на 7
    if (digitsOnly.startsWith('8')) {
      digitsOnly = '7' + digitsOnly.substring(1);
    }

    // Если номер не начинается с 7, добавляем 7
    if (!digitsOnly.startsWith('7')) {
      digitsOnly = '7' + digitsOnly;
    }

    // Ограничиваем длину до 11 цифр
    if (digitsOnly.length > 11) {
      digitsOnly = digitsOnly.substring(0, 11);
    }

    // Форматируем номер
    if (digitsOnly.length >= 1) {
      String formatted = '+${digitsOnly.substring(0, 1)}';
      if (digitsOnly.length > 1) {
        formatted += ' (${digitsOnly.substring(1, 4)}';
        if (digitsOnly.length > 4) {
          formatted += ') ${digitsOnly.substring(4, 7)}';
          if (digitsOnly.length > 7) {
            formatted += '-${digitsOnly.substring(7, 9)}';
            if (digitsOnly.length > 9) {
              formatted += '-${digitsOnly.substring(9)}';
            }
          }
        }
      }
      return formatted;
    }
    return '+7';
  }

  void _onPhoneChanged(String value) {
    final formatted = _formatPhoneNumber(value);
    if (formatted != value) {
      _phoneController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
  }

  Future<void> _sendCode() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final authRepo = context.read<AuthorizationRepository>();
      final networkRepo = context.read<NetworkRepository>();

      // Извлекаем номер телефона без форматирования
      final phoneNumber = _phoneController.text.replaceAll(
        RegExp(r'[^\d]'),
        '',
      );
      final fullPhoneNumber = '+$phoneNumber';

      final (deviceId, preAuthSessionId) = await authRepo.signIn(
        networkRepo,
        fullPhoneNumber,
      );

      if (mounted) {
        context.go(
          '/auth/verify-code',
          extra: {
            'phoneNumber': fullPhoneNumber,
            'deviceId': deviceId,
            'preAuthSessionId': preAuthSessionId,
          },
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Ошибка отправки кода: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Cargo ID',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Введите номер телефона',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Чтобы войти или зарегистрироваться',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _phoneController,
                  onChanged: _onPhoneChanged,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[\d\s\(\)\+\-]'),
                    ),
                  ],
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 16),
                        Container(
                          width: 24,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.blue,
                          ),
                          child: const Center(
                            child: Text('🇰🇿', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    suffixIcon: _phoneController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.grey),
                            onPressed: () {
                              _phoneController.clear();
                            },
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _sendCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Text(
                          'Войти',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Implement biometric authentication
                  },
                  icon: const Icon(Icons.fingerprint, color: Colors.black),
                  label: const Text(
                    'По лицу или отпечатку',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: Implement more options
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Ещё',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
