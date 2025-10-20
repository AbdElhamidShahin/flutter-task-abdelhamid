import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/stayles.dart';

Widget buildBottomButton() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
    child: FilledButton(
      onPressed: () {
      },
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.blue,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
      ),
      child:  Text(
          'شاهد +10,000 نتائج',
          style: TextStyles.font16BlackBold.copyWith(color: Colors.white)
      ),
    ),
  );
}