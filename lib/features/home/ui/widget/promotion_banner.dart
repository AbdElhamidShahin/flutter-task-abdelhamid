import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tast_abdelhamid/core/theming/app_colors.dart';
import 'package:flutter_tast_abdelhamid/core/theming/stayles.dart';

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.redLight,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("! لأي عرض تطلبه دلوقتي",style: TextStyles.font10BlackRegular,),

              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Text(
                  "شحن مجاني",
                  style: TextStyles.font12BlackRegular.copyWith(
                    color: AppColors.mainGreen,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.26),
                child: Icon(Icons.check, color: AppColors.mainGreen, size: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
