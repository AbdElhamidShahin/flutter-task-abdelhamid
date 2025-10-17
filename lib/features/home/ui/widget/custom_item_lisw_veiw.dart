import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/product_model.dart';
import 'custom_item_home.dart';

class CustomItemLiswVeiw extends StatelessWidget {
  const CustomItemLiswVeiw({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 158 / 360,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
        ),
        itemBuilder: (context, index) {
          return CustomItemHome(productModel: products[index]);
        },
      ),
    );
  }
}
