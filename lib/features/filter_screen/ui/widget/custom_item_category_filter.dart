import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/stayles.dart';

Widget CustomItemCategoryFilter({
  required List<String> options,
  required String selectedOption,
  required ValueChanged<String> onSelected,
}) {
  return Wrap(
    spacing: 12.w,
    runSpacing: 12.h,
    children: options.map((option) {
      return _CustomChoiceChip(
        label: option,
        isSelected: selectedOption == option,
        onSelected: () => onSelected(option),
      );
    }).toList(),
  );

}

class _CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const _CustomChoiceChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: onSelected,
      backgroundColor: isSelected
          ? AppColors.blue.withOpacity(0.05)
          : Colors.white,
      labelStyle: TextStyle(
        color: isSelected
            ? AppColors.blue
            : AppColors.blackText.withOpacity(0.50),
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
        side: BorderSide(
          color: isSelected ? AppColors.blue : Colors.black.withOpacity(0.10),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 11.5.h),
    );
  }
}