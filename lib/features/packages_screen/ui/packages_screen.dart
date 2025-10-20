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

        ],
      ),
    );
  }
}
