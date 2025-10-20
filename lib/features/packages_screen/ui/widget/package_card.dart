import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/networking/add_packages_model.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/stayles.dart';
import 'circular_views_indicator.dart';
import 'getIconForFeature.dart';

class PackageCard extends StatelessWidget {
  final AddPackagesModel package;
  final bool isSelected;
  final VoidCallback onTap;
  final String? tag;
  final int? viewsCount;

  const PackageCard({
    super.key,
    required this.package,
    required this.isSelected,
    required this.onTap,
    this.tag,
    this.viewsCount,
  });

  @override
  Widget build(BuildContext context) {
    String? displayTag;
    int? displayViewsCount;
    if (package.id == 3) {
      displayTag = "أفضل قيمة مقابل سعر";
      displayViewsCount = 18;
    } else if (package.id == 4) {
      displayTag = "أعلى مشاهدات";
      displayViewsCount = 24;
    } else if (package.id == 2) {
      displayViewsCount = 7;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Colors.grey.shade300,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (displayTag != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                margin: EdgeInsets.only(bottom: 8.h),
                decoration: BoxDecoration(
                  color: displayTag.contains("قيمة")
                      ? AppColors.redLight
                      : AppColors.redLight,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(displayTag, style: TextStyles.font12BlackRegular),
              ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          children: [
                            Text(
                              "${package.price} م.ج",
                              style: TextStyles.font16BlackBold.copyWith(
                                color: AppColors.red,
                              ),
                            ),
                            Container(
                              height: 2.h,
                              width: 80.w,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),

                      Spacer(),
                      Text(
                        package.name,
                        style: TextStyles.font16BlackBold.copyWith(
                          color: isSelected
                              ? AppColors.blueMain
                              : AppColors.blackText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                Transform.scale(
                  scale: 0.75.h,
                  child: Checkbox(
                    value: isSelected,

                    onChanged: (bool? value) => onTap(),
                    activeColor: AppColors.blueMain,
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            Container(
              height: 1.h,
              width: double.infinity.w,
              color: Colors.black.withOpacity(.1),
            ),
            SizedBox(height: 12.h),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (displayViewsCount != null)
                  EllipticalHeadView(viewCount: displayViewsCount),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: package.features.map((feature) {
                      bool isRed = feature.contains("(");
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                feature,
                                style:
                                    (isRed
                                            ? TextStyles.font14MainOrangeMedium
                                                  .copyWith(
                                                    color: AppColors.red,
                                                  )
                                            : TextStyles.font14DarkRegular
                                                  .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                  ))
                                        .copyWith(height: 1.4),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              getIconForFeature(feature),
                              size: 20.sp,
                              color: AppColors.blackText,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
