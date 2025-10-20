import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text_field_filter.dart';

class PriceRangeFields extends StatelessWidget {
  final TextEditingController minController;
  final TextEditingController maxController;
  final String minHint;
  final String maxHint;

  const PriceRangeFields({
    required this.minController,
    required this.maxController,
    required this.minHint,
    required this.maxHint,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(controller: minController, hintText: minHint),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: CustomTextField(controller: maxController, hintText: maxHint),
        ),
      ],
    );
  }
}
