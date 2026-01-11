import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:heroicons/heroicons.dart';

class DangerousCargoBottomSheet extends StatelessWidget {
  const DangerousCargoBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) => const DangerousCargoBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXL),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DangerousCargoHeader(),
            _DangerousCargoList(),
            SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }
}

class _DangerousCargoHeader extends StatelessWidget {
  const _DangerousCargoHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.l10n.dangerousGoods,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: AppColors.surface5,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: HeroIcon(
              HeroIcons.xMark,
              style: HeroIconStyle.outline,
              size: 24,
              color: AppColors.surface5,
            ),
          ),
        ],
      ),
    );
  }
}

class _DangerousCargoList extends StatelessWidget {
  const _DangerousCargoList();

  @override
  Widget build(BuildContext context) {
    final cargoItems = [
      _DangerousCargoItem(
        imagePath: 'assets/images/layer_1.png',
        title: context.l10n.explosiveMaterials,
      ),
      _DangerousCargoItem(
        imagePath: 'assets/images/layer_2.png',
        title: context.l10n.compressedGases,
      ),
      _DangerousCargoItem(
        imagePath: 'assets/images/layer_3.png',
        title: context.l10n.oxidizingSubstances,
      ),
      _DangerousCargoItem(
        imagePath: 'assets/images/layer_1.png',
        title: context.l10n.explosiveMaterials,
      ),
      _DangerousCargoItem(
        imagePath: 'assets/images/layer_2.png',
        title: context.l10n.compressedGases,
      ),
      _DangerousCargoItem(
        imagePath: 'assets/images/layer_3.png',
        title: context.l10n.oxidizingSubstances,
      ),
      _DangerousCargoItem(
        imagePath: 'assets/images/layer_3.png',
        title: context.l10n.oxidizingSubstances,
      ),
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      itemCount: cargoItems.length,
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.lg),
      itemBuilder: (context, index) {
        final item = cargoItems[index];
        return _DangerousCargoItemWidget(item: item);
      },
    );
  }
}

class _DangerousCargoItem {
  final String imagePath;
  final String title;

  const _DangerousCargoItem({
    required this.imagePath,
    required this.title,
  });
}

class _DangerousCargoItemWidget extends StatelessWidget {
  final _DangerousCargoItem item;

  const _DangerousCargoItemWidget({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          child: Image.asset(
            item.imagePath,
            width: 64,
            height: 64,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: AppSpacing.lg),
        Expanded(
          child: Text(
            item.title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: AppColors.surface5,
            ),
          ),
        ),
      ],
    );
  }
}
