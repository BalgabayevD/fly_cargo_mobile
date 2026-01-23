import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/client_order/vliew_photo.dart';

class PhotoGridView extends StatelessWidget {
  final List<String> photos;

  const PhotoGridView({
    required this.photos,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164,
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemBuilder: (BuildContext context, int index) {
          return ViewPhoto(photo: photos.elementAt(index));
        },
        separatorBuilder: (BuildContext context, int index) {
          return BeSpace(size: .md, direction: .vertical);
        },
        itemCount: photos.length,
      ),
    );
  }
}
