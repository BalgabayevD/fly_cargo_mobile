import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class OrderPhotoItem extends StatelessWidget {
  final String photoUrl;

  const OrderPhotoItem({
    required this.photoUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 120,
        height: 120,
        color: AppColors.surface1,
        child: Image.network(
          photoUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.surface2,
            child: Icon(
              Icons.image_outlined,
              color: AppColors.surface4,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class OrderDescriptionSection extends StatelessWidget {
  final String description;
  final List<String> photos;

  const OrderDescriptionSection({
    required this.description,
    required this.photos,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Описание',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.surface4,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.surface5,
            ),
          ),
          if (photos.isNotEmpty) ...[
            SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: photos.length,
                separatorBuilder: (_, _) => SizedBox(width: 12),
                itemBuilder: (context, index) => OrderPhotoItem(
                  photoUrl: photos[index],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
