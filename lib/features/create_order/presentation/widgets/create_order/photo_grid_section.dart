import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/photos_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/add_photo.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/edit_photo.dart';
import 'package:fly_cargo/features/submit_order/presentation/bloc/courier_submit_order_bloc.dart';

class PhotoGridSection extends StatelessWidget {
  const PhotoGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164,
      child: BlocConsumer<PhotosBloc, PhotosState>(
        listener: (BuildContext context, PhotosState state) {
          if (state is PhotosPickerState) {
            final field = UpdateOrdersDefectPhotosField(state.photos);

            context.read<CourierSubmitOrderBloc>().add(
              CourierSubmitOrderUpdateEvent(field),
            );
          }
        },
        builder: (context, state) {
          return ListView.separated(
            scrollDirection: .horizontal,
            itemBuilder: (BuildContext context, int index) {
              if (state.photos.length == 5) {
                return EditPhoto(photo: state.photos.elementAt(index));
              }

              if (index == 0) return AddPhoto();

              return EditPhoto(photo: state.photos.elementAt(index - 1));
            },
            separatorBuilder: (BuildContext context, int index) {
              return BeSpace(size: .md, direction: .vertical);
            },
            itemCount: (state as PhotosPickerState).itemsCount,
          );
        },
      ),
    );
  }
}
