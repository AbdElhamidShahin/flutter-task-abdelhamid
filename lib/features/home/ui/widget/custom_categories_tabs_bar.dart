import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/category_model.dart';
import 'category_chip.dart';

class CustomCategoriesTabsBar extends StatelessWidget {
  final List<CategoryModel> categories;
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const CustomCategoriesTabsBar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 41.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final bool isSelected = (index == selectedIndex);

            return CategoryChip(
              text: category.name,
              isSelected: isSelected,
              onTap: () => onCategorySelected(index),
            );
          },
        ),
      ),
    );
  }
}
