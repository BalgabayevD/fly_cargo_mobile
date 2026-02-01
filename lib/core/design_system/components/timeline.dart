import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/timeline_thumb.dart';
import 'package:google_fonts/google_fonts.dart';

class BeTimeline extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isSelected;
  final String title;
  final String description;

  const BeTimeline({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    this.isSelected = false,
    this.title = '',
    this.description = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        spacing: 18,
        crossAxisAlignment: .start,
        children: [
          TimelineThumb(
            isFirst: isFirst,
            isLast: isLast,
            isSelected: isSelected,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                if (isFirst) SizedBox(height: 2),
                if (!isFirst && !isLast) SizedBox(height: 21),
                if (isLast) SizedBox(height: 22),
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: BeColors.surface5,
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    color: BeColors.surface5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
