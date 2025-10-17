import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_item_card.dart';

class HomeCategoriesListview extends StatelessWidget {
  const HomeCategoriesListview({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'image': 'assets/Images_category/man.png', 'text': 'موضه رجالي'},
      {'image': 'assets/Images_category/watch.png', 'text': 'ساعات'},
      {'image': 'assets/Images_category/phone.png', 'text': 'موبيلات'},
      {'image': 'assets/Images_category/makeup.png', 'text': 'منتجات تجميل'},
      {'image': 'assets/Images_category/house.jpg', 'text': 'عقارات'},
    ];
    return SizedBox(
      height: 95.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: categories.length,
          separatorBuilder: (_, __) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            final item = categories[index];
            return CategoryItemCard(image: item['image']!, text: item['text']!);
          },
        ),
      ),
    );
  }
}
