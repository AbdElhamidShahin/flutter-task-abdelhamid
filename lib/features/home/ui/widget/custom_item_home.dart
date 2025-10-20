import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tast_abdelhamid/core/theming/app_colors.dart';
import 'package:flutter_tast_abdelhamid/core/theming/stayles.dart';
import '../../../../core/networking/product_model.dart';
import 'custom_row_icons_item_home.dart';

class CustomItemHome extends StatelessWidget {
  CustomItemHome({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.blackText.withOpacity(0.10),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(
        width: 158.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 215.h,
              width: double.infinity.w,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.05)),
              child: Image.asset(productModel.image),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    "assets/icons/discount.svg",
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(height: 8.h),

                  Expanded(
                    child: Text(
                      textDirection: TextDirection.rtl,
                      productModel.title,
                      style: TextStyles.font14MainOrangeMedium.copyWith(
                        color: AppColors.blackText,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                height: 26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                      Icon(
                        Icons.favorite_border_outlined,
                        size: 24,
                        color: AppColors.blackText,
                      ),

                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        "${productModel.oldPrice}/",
                        overflow: TextOverflow.ellipsis,

                        textDirection: TextDirection.rtl,

                        style: TextStyles.font12BlackRegular.copyWith(
                          decoration: TextDecoration.lineThrough,

                          color: Colors.black.withOpacity(0.50),
                        ),
                      ),
                    ),
                    Text(
                      "${productModel.price}""جم",
                      textDirection: TextDirection.rtl,

                      style: TextStyles.font14MainOrangeMedium.copyWith(
                        color: AppColors.red,

                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "تم بيع +${productModel.sales}",
                    style: TextStyles.font10BlackRegular.copyWith(
                      color: AppColors.blackText.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(width: 4.h),
                  Icon(
                    Icons.local_fire_department_outlined,
                    size: 18,
                    color: AppColors.blackText.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            SizedBox(height: 27.h), // تم تقليل المسافة
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomRowIconsItemHome(),
          )
          ],
        ),
      ),
    );
  }
}
