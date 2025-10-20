import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tast_abdelhamid/core/theming/app_colors.dart';
import 'package:flutter_tast_abdelhamid/core/theming/stayles.dart';

class CustomAppbarPackagesScreen extends StatelessWidget {
  const CustomAppbarPackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding:  EdgeInsets.only(
              top: 16.h,
              left: 16.w,
              right: 12.w,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: AppColors.blackText,
                  ),
                ),
                Text(
                  "أختر الباقات اللى تناسبك",
                  style: TextStyles.font24BlackMedium,
                ),
              ],
            ),
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك",
              style: TextStyles.font14DarkRegular.copyWith(
                color: AppColors.blackText.withOpacity(0.50),
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
