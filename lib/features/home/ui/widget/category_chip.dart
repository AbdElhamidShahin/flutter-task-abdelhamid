import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/stayles.dart';

class CategoryChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),

        child: Container(
          margin: EdgeInsets.only(left: 8.w),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.mainOrange.withOpacity(0.05)
                : Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.black.withOpacity(0.10)),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(12.0.r),
              child: Text(
                text,
                style: TextStyles.font14MainOrangeMedium.copyWith(
                  color: isSelected
                      ? AppColors.mainOrange
                      : AppColors.blackText.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
