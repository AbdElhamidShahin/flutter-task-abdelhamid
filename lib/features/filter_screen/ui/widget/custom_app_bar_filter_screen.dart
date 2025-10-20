import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tast_abdelhamid/core/theming/app_colors.dart';
import 'package:flutter_tast_abdelhamid/core/theming/stayles.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';

Widget CustomAppBarFilterScreen(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      children: [
        IconButton(
          onPressed: () {

            context.go(routes.AppLayout);

          },
          icon: Icon(Icons.close, color: AppColors.blackText, size: 24),
        ),
        Text('فلترة', style: TextStyles.font24BlackMedium),

        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'رجوع للافتراضي',
            style: TextStyles.font16BlackBold.copyWith(color: AppColors.blue),
          ),
        ),
      ],
    ),
  );
}
