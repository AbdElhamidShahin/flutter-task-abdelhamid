import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tast_abdelhamid/core/theming/app_colors.dart';
import 'package:flutter_tast_abdelhamid/core/theming/stayles.dart';
import 'package:flutter_tast_abdelhamid/features/packages_screen/ui/widget/package_card.dart';
import '../../logic/packages_cubit.dart';
import '../../logic/packages_state.dart';

class PackagesListView extends StatelessWidget {
  const PackagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesCubit, PackagesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text('حدث خطأ: $message')),
          success: (packages, selectedPackageId) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              itemCount: packages.length + 1,
              itemBuilder: (context, index) {
                if (index < packages.length) {
                  final package = packages[index];
                  final isSelected = selectedPackageId == package.id;
                  return PackageCard(
                    package: package,
                    isSelected: isSelected,
                    onTap: () {
                      context.read<PackagesCubit>().selectPackage(package.id);
                    },
                  );
                } else {
                  return _buildSalesBanner();
                }
              },
            );
          },
        );
      },
    );
  }

  Widget _buildSalesBanner() {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFFFF7F7F7)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "باقات مخصصة لك",
                  style: TextStyles.font14MainOrangeMedium.copyWith(
                    color: AppColors.blackText,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "تواصل معنا لأختيار الباقة المناسبة لك",
                  style: TextStyles.font12BlackRegular.copyWith(
                    color: AppColors.blackText,
                  ),
                ),
                SizedBox(height: 8.h),
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
    );
  }
}
