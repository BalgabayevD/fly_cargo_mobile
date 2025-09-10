import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fly_cargo/features/home/presentation/send_package_bottom_sheet.dart';
import 'package:fly_cargo/features/map/presentation/yandex_map_screen.dart';
import 'package:fly_cargo/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String a77 = '';
  String b77 = '';

  Future<void> _signOut() async {
    final authService = AuthService();
    await authService.signOut();
    if (mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const YandexMapScreen(),
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  controller: scrollController,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fly Cargo',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: _signOut,
                          tooltip: 'Выйти',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const SendPackageBottomSheet(),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 47,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            'Отправить посылку?',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // MaterialButton(
                    //   onPressed: () {
                    //     final ras = context.read<AuthorizationRepository>();
                    //     final b = context.read<NetworkRepository>();
                    //     ras.signIn(b).then((result) {
                    //       a77 = result.$1;
                    //       b77 = result.$2;
                    //       setState(() {});
                    //     });
                    //   },
                    //   child: Text('Login'),
                    // ),
                    // MaterialButton(
                    //   onPressed: () {
                    //     final ras = context.read<AuthorizationRepository>();
                    //     final b = context.read<NetworkRepository>();
                    //     ras.signCode(b, a77, b77, '451088');
                    //   },
                    //   child: Text('Login 2'),
                    // ),
                    // MaterialButton(
                    //   onPressed: () {
                    //     final ras = context.read<AuthorizationRepository>();
                    //     ras.gig();
                    //   },
                    //   child: Text('3'),
                    // ),
                    ListTile(
                      title: Text('Настольный светильник'),
                      subtitle: Text('Атырау, просп. Абая, 94'),
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Divider(color: Color(0xFFD0CFCE), height: 1),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
