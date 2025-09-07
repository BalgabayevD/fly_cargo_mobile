import 'package:flutter/material.dart';

class SendPackageBottomSheet extends StatefulWidget {
  const SendPackageBottomSheet({super.key});

  @override
  State<SendPackageBottomSheet> createState() => _SendPackageBottomSheetState();
}

class _SendPackageBottomSheetState extends State<SendPackageBottomSheet> {
  final TextEditingController _fromCityController = TextEditingController();
  final TextEditingController _fromAddressController = TextEditingController();
  final TextEditingController _toCityController = TextEditingController();
  final TextEditingController _toAddressController = TextEditingController();

  @override
  void dispose() {
    _fromCityController.dispose();
    _fromAddressController.dispose();
    _toCityController.dispose();
    _toAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Отправить посылку',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              'Откуда?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: TextField(
                controller: _fromCityController,
                decoration: const InputDecoration(
                  hintText: 'Выберите город',
                  hintStyle: TextStyle(color: Color(0xFF999999)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  suffixIcon: Icon(
                    Icons.location_city,
                    color: Color(0xFF666666),
                  ),
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: TextField(
                controller: _fromAddressController,
                decoration: const InputDecoration(
                  hintText: 'Указать адрес',
                  hintStyle: TextStyle(color: Color(0xFF999999)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  suffixIcon: Icon(Icons.location_on, color: Color(0xFF666666)),
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Куда?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: TextField(
                controller: _toCityController,
                decoration: const InputDecoration(
                  hintText: 'Выберите город',
                  hintStyle: TextStyle(color: Color(0xFF999999)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  suffixIcon: Icon(
                    Icons.location_city,
                    color: Color(0xFF666666),
                  ),
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: TextField(
                controller: _toAddressController,
                decoration: const InputDecoration(
                  hintText: 'Указать адрес',
                  hintStyle: TextStyle(color: Color(0xFF999999)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  suffixIcon: Icon(Icons.location_on, color: Color(0xFF666666)),
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007AFF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Продолжить',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
