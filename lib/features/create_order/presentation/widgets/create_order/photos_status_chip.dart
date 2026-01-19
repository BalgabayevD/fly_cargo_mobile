import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/chip.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/photos_bloc.dart';

class PhotosStatusChip extends StatelessWidget {
  const PhotosStatusChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CreateOrdersBloc, CreateOrdersState>(
        builder: (BuildContext context, CreateOrdersState state) {
          if (state is CreateOrdersCreateState) {
            return BlocBuilder<PhotosBloc, PhotosState>(
              builder: (BuildContext context, PhotosState photosState) {
                switch (state.photosValidationStatus) {
                  case PhotosValidationStatus.idle:
                    if (photosState is PhotosPickerState &&
                        photosState.photos.isNotEmpty) {
                      return BeChip(
                        text: 'Фото ${photosState.photos.length}/5',
                        color: .warning,
                        size: .sm,
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  case PhotosValidationStatus.pending:
                    return PhotosPendingChip();
                  case PhotosValidationStatus.moreInside:
                    return BeChip(
                      text: 'Нужно фото внтури',
                      color: .danger,
                      size: .sm,
                    );
                  case PhotosValidationStatus.moreOutside:
                    return BeChip(
                      text: 'Нужно фото снаржи',
                      color: .danger,
                      size: .sm,
                    );
                  case PhotosValidationStatus.fulfilled:
                    return BeChip(
                      text: 'Фотографии загружены',
                      color: .success,
                      size: .sm,
                    );
                }
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

class PhotosPendingChip extends StatefulWidget {
  const PhotosPendingChip({super.key});

  @override
  State<PhotosPendingChip> createState() => _PhotosPendingChipState();
}

class _PhotosPendingChipState extends State<PhotosPendingChip> {
  int percent = 0;
  Timer? timer;

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(milliseconds: 250), (Timer t) {
      if (percent < 100) {
        setState(() {
          percent++;
        });
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BeChip(
      text: '$percent% загрузка',
      isLoading: true,
      size: .sm,
    );
  }
}
