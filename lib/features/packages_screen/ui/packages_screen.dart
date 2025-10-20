import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tast_abdelhamid/core/theming/app_colors.dart';
import 'package:flutter_tast_abdelhamid/core/theming/stayles.dart';
import 'package:flutter_tast_abdelhamid/features/packages_screen/logic/packages_cubit.dart';
import 'package:flutter_tast_abdelhamid/features/packages_screen/ui/widget/custom_appbar_packages_screen.dart';
import 'package:flutter_tast_abdelhamid/features/packages_screen/ui/widget/packages_list_view.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PackagesCubit>().PackagesfetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppbarPackagesScreen(),
          SizedBox(height: 20.h),
          Expanded(child: PackagesListView()),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: double.infinity.w,

                decoration: BoxDecoration(color: Color(0xFFFF7F7F7)),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "باقات مخصصة لك",
                        style: TextStyles.font14MainOrangeMedium.copyWith(
                          color: AppColors.blackText,
                        ),
                      ),
                      Text(
                        "تواصل معنا لأختيار الباقة المناسبة لك",
                        style: TextStyles.font12BlackRegular.copyWith(
                          color: AppColors.blackText,
                        ),
                      ),
                      Text(
                        "فريق المبيعات",
                        style: TextStyles.font16BlackBold.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
