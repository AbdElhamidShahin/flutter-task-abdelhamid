import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tast_abdelhamid/features/home/ui/widget/custom_item_lisw_veiw.dart';
import 'package:flutter_tast_abdelhamid/features/home/ui/widget/home_categories_list_view.dart';
import 'package:flutter_tast_abdelhamid/features/home/ui/widget/promotion_banner.dart';
import '../logic/cubit.dart';
import '../logic/state.dart';
import 'widget/custom_categories_tabs_bar.dart';
import 'widget/custom_text_appbar_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomTextAppbarHome(),
            SizedBox(height: 12.h),

            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(color: Colors.orange),
                    ),
                    error: (error) => Center(child: Text(error)),
                    success: (categories) {
                      final cubit = context.read<HomeCubit>();
                      return Column(
                        children: [
                          CustomCategoriesTabsBar(
                            categories: categories,
                            selectedIndex: cubit.selectedIndex,
                            onCategorySelected: (index) {
                              cubit.changeCategory(index);
                            },
                          ),

                          SizedBox(height: 33.h),
                          HomeCategoriesListview(),
                          SizedBox(height: 33.h),
                          PromotionBanner(),

                          SizedBox(height: 20.h),
                          Expanded(
                            child: CustomItemLiswVeiw(
                              products:
                                  categories[cubit.selectedIndex].products,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
