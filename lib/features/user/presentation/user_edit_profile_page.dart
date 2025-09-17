import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/user/models/user_profile_model.dart';

class UserEditProfilePage extends StatefulWidget {
  const UserEditProfilePage({super.key});

  @override
  State<UserEditProfilePage> createState() => _UserEditProfilePageState();
}

class _UserEditProfilePageState extends State<UserEditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late UserProfile _profile;

  @override
  void initState() {
    super.initState();
    _profile = _getMockProfile();
    _nameController = TextEditingController(text: _profile.name);
    _phoneController = TextEditingController(text: _profile.phone);
    _emailController = TextEditingController(text: _profile.email ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  UserProfile _getMockProfile() {
    return UserProfile(
      id: 'user_1',
      name: 'Дамир',
      phone: '+7 777 380 6602',
      email: 'damir@example.com',
      joinDate: DateTime(2024, 1, 15),
      status: 'active',
      paymentCards: const [],
      orderHistory: const [],
      notificationSettings: const NotificationSettings(
        orderUpdates: true,
        promotions: true,
        paymentNotifications: true,
        systemNotifications: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF333333)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Мой профиль',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _saveProfile,
            child: const Text(
              'Сохранить',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Аватар
            _buildAvatarSection(),
            const SizedBox(height: 30),

            // Форма редактирования
            _buildEditForm(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFE0E0E0), width: 2),
              ),
              child: _profile.avatarUrl != null
                  ? ClipOval(
                      child: Image.network(
                        _profile.avatarUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            _buildDefaultAvatar(),
                      ),
                    )
                  : _buildDefaultAvatar(),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFF007AFF),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: _changeAvatar,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: _changeAvatar,
          child: const Text(
            'Изменить фото',
            style: TextStyle(fontSize: 16, color: Color(0xFF007AFF)),
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultAvatar() {
    return const Icon(Icons.person, size: 60, color: Color(0xFF999999));
  }

  Widget _buildEditForm() {
    return AppCard(
      variant: AppCardVariant.outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Личная информация',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 20),

          // Имя
          _buildTextField(
            controller: _nameController,
            label: 'Имя',
            icon: Icons.person,
          ),
          const SizedBox(height: 16),

          // Телефон
          _buildTextField(
            controller: _phoneController,
            label: 'Телефон',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),

          // Email
          _buildTextField(
            controller: _emailController,
            label: 'Email',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF666666)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF007AFF), width: 2),
        ),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
      ),
    );
  }

  void _changeAvatar() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Выберите фото',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Color(0xFF007AFF)),
              title: const Text('Сделать фото'),
              onTap: () {
                Navigator.pop(context);
                _takePhoto();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.photo_library,
                color: Color(0xFF007AFF),
              ),
              title: const Text('Выбрать из галереи'),
              onTap: () {
                Navigator.pop(context);
                _selectFromGallery();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _takePhoto() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Функция съемки фото будет реализована'),
        backgroundColor: Color(0xFF007AFF),
      ),
    );
  }

  void _selectFromGallery() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Функция выбора из галереи будет реализована'),
        backgroundColor: Color(0xFF007AFF),
      ),
    );
  }

  void _saveProfile() {
    // Здесь будет логика сохранения профиля
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Профиль сохранен'),
        backgroundColor: Color(0xFF34C759),
      ),
    );
    Navigator.pop(context);
  }
}
