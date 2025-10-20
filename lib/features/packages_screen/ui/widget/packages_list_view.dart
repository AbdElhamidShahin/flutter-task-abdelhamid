import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              itemCount: packages.length,
              itemBuilder: (context, index) {
                final package = packages[index];
                final isSelected = selectedPackageId == package.id;
                return PackageCard(
                  package: package,
                  isSelected: isSelected,
                  onTap: () {
                    context.read<PackagesCubit>().selectPackage(package.id);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}