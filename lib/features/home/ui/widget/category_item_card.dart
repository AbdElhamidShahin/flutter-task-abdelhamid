import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tast_abdelhamid/core/theming/stayles.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 56.h,
            width: 75.w,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.black.withOpacity(0.10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(image, fit: BoxFit.contain),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            text,
            style: TextStyles.font12BlackRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
