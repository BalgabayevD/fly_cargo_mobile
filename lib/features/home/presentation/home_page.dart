import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/di/service_locator.dart';
import 'package:fly_cargo/features/home/presentation/bloc/box_selection_bloc.dart';
import 'package:fly_cargo/features/home/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/features/home/presentation/box_details_page.dart';
import 'package:fly_cargo/features/home/presentation/send_package_bottom_sheet.dart';
import 'package:fly_cargo/features/home/presentation/tariff_details_page.dart';
import 'package:fly_cargo/features/home/presentation/widgets/home_bottom_sheet_content.dart';
import 'package:fly_cargo/features/user/presentation/user_profile_page.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';
import 'package:fly_cargo/shared/auth/presentation/router/auth_router.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/map/presentation/yandex_map_screen.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_event.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_bloc.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AddressModel? _fromAddress;
  AddressModel? _toAddress;
  void _onAddressesSelected(AddressModel fromAddress, AddressModel toAddress) {
    setState(() {
      _fromAddress = fromAddress;
      _toAddress = toAddress;
    });
  }

  void _openAddressSelection() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SendPackageBottomSheet(
        onAddressesSelected: _onAddressesSelected,
        initialFromAddress: _fromAddress,
        initialToAddress: _toAddress,
      ),
    );
  }

  void _onSendPackagePressed() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthUnauthenticated || authState is AuthInitial) {
      AuthRouter.navigateToPhoneInput(context);
    } else {
      _openAddressSelection();
    }
  }

  @override
  void initState() {
    context.read<AuthBloc>().add(AuthInitialized());
    context.read<TariffSelectionBloc>().add(LoadTariffCategoriesEvent());
    context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
    context.read<OrdersBloc>().add(const GetClientOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoxSelectionBloc(
        getBoxesUseCase: ServiceLocator().getBoxesUseCase,
        getBoxByTypeUseCase: ServiceLocator().getBoxByTypeUseCase,
      )..add(LoadBoxesEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Fly Cargo',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.person, color: Color(0xFF333333)),
              onPressed: () => _openUserProfile(context),
            ),
          ],
        ),
        body: Stack(
          children: [
            const YandexMapScreen(),
            DraggableScrollableSheet(
              initialChildSize: 0.6,
              snap: true,
              minChildSize: 0.6,
              maxChildSize: 0.6,
              builder: (context, scrollController) {
                return HomeBottomSheetContent(
                  fromAddress: _fromAddress,
                  toAddress: _toAddress,
                  onSendPackagePressed: _onSendPackagePressed,
                  onAddressSelectionTap: _openAddressSelection,
                  onBoxDetailsTap: _openBoxDetailsPage,
                  scrollController: scrollController,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openBoxDetailsPage(BuildContext context, String boxType) {
    final tariffId = int.tryParse(boxType);
    if (tariffId != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TariffDetailsPage(
            tariffId: tariffId,
            fromAddress: _fromAddress,
            toAddress: _toAddress,
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BoxDetailsPage(
            boxType: boxType,
            fromAddress: _fromAddress,
            toAddress: _toAddress,
          ),
        ),
      );
    }
  }

  void _openUserProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserProfilePage()),
    );
  }
}
