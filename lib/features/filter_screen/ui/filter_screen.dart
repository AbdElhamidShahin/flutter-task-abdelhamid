import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tast_abdelhamid/core/theming/stayles.dart';
import 'package:flutter_tast_abdelhamid/features/filter_screen/ui/widget/build_bottom_button.dart'
    show buildBottomButton;
import 'package:flutter_tast_abdelhamid/features/filter_screen/ui/widget/custom_filter_section.dart';
import 'package:flutter_tast_abdelhamid/features/filter_screen/ui/widget/custom_item_category_filter.dart';
import 'package:flutter_tast_abdelhamid/features/filter_screen/ui/widget/custom_location_row_filter.dart';
import 'package:flutter_tast_abdelhamid/features/filter_screen/ui/widget/price_range_fields.dart';
import '../../../core/theming/app_colors.dart';
import 'widget/custom_app_bar_filter_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String _selectedType = 'الكل';
  String _selectedRooms = '5 غرف+';
  String _selectedPayment = 'كاش';
  String _selectedStatus = 'جاهز';

  final TextEditingController _minInstallmentController =
      TextEditingController();
  final TextEditingController _maxInstallmentController =
      TextEditingController();
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  @override
  void dispose() {
    _minInstallmentController.dispose();
    _maxInstallmentController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBarFilterScreen(context),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الفئة",
                        style: TextStyles.font16BlackMedium.copyWith(
                          color: Colors.black.withOpacity(0.50),
                        ),
                      ),
                      SizedBox(height: 12.w),

                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/buildings.svg',
                            width: 24.sp,
                            height: 24.sp,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'عقارات',
                                  style: TextStyles.font14MainOrangeMedium
                                      .copyWith(color: AppColors.blackText),
                                ),
                                Text(
                                  'فلل, شقق',
                                  style: TextStyles.font12BlackRegular.copyWith(
                                    color: AppColors.blackText.withOpacity(
                                      0.50,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'تغيير',
                              style: TextStyles.font14BlueMainBold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.w),
                    ],
                  ),
                ),
                const CustomLocationRowFilter(),

                SizedBox(height: 20.w),
                CustomFilterSection(
                  title: 'الأقساط الشهرية',
                  child: PriceRangeFields(
                    minController: _minInstallmentController,
                    maxController: _maxInstallmentController,
                    minHint: '',
                    maxHint: '',
                  ),
                ),

                CustomFilterSection(
                  title: 'النوع',
                  child: CustomItemCategoryFilter(
                    options: ['الكل', 'توين هاوس', 'فيلا منفصلة', 'تاون هاوس'],
                    selectedOption: _selectedType,
                    onSelected: (value) =>
                        setState(() => _selectedType = value),
                  ),
                ),

                CustomFilterSection(
                  title: 'عدد الغرف',
                  child: CustomItemCategoryFilter(
                    options: ['4 غرف', '5 غرف+', 'الكل', 'غرفتين', '3 غرف'],
                    selectedOption: _selectedRooms,
                    onSelected: (value) =>
                        setState(() => _selectedRooms = value),
                  ),
                ),

                CustomFilterSection(
                  title: 'السعر',
                  child: PriceRangeFields(
                    minController: _minPriceController,
                    maxController: _maxPriceController,
                    minHint: 'أقل سعر',
                    maxHint: 'أقصى سعر',
                  ),
                ),

                CustomFilterSection(
                  title: 'طريقة الدفع',
                  child: CustomItemCategoryFilter(
                    options: ['أي', 'تقسيط', 'كاش'],
                    selectedOption: _selectedPayment,
                    onSelected: (value) =>
                        setState(() => _selectedPayment = value),
                  ),
                ),

                CustomFilterSection(
                  title: 'حالة العقار',
                  child: CustomItemCategoryFilter(
                    options: ['أي', 'جاهز', 'قيد الإنشاء'],
                    selectedOption: _selectedStatus,
                    onSelected: (value) =>
                        setState(() => _selectedStatus = value),
                  ),
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildBottomButton(),
    );
  }
}
