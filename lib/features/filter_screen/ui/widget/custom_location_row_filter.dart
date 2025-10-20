import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/stayles.dart';

class CustomLocationRowFilter extends StatelessWidget {
  const CustomLocationRowFilter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Colors.black.withOpacity(0.10)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.blackText,
                  size: 28.sp,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الموقع',
                        style: TextStyles.font14DarkRegular.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'مصر',
                        style: TextStyles.font12BlackRegular.copyWith(
                          color: Colors.black.withOpacity(0.50),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.blackText,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.black.withOpacity(0.10)),
      ],
    );
  }
}
