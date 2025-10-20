import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/stayles.dart';

class CustomFilterSection extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomFilterSection({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h, right: 16.w, left: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.font16BlackMedium.copyWith(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 12.h),
          child,
        ],
      ),
    );
  }
}
