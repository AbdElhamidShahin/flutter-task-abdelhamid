import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowIconsItemHome extends StatelessWidget {
  const CustomRowIconsItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/Images_category/iconImageItemHome.png',
          height: 16.h,
          width: 24.w,
        ),

        SizedBox(width: 1.w),

        SizedBox(
          height: 24.h,
          width: 32.w,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1.5.w),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.add_shopping_cart,
              color: Colors.black87,
              size: 16,
            ),
          ),
        ),

        const Spacer(),

        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: 26.w,
              height: 26.h,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.corporate_fare,
                  color: Colors.blue.shade700,
                  size: 16,
                ),
              ),
            ),

            Positioned(
              top: -3,
              right: -2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5.w),
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
