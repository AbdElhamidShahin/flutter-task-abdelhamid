import 'package:flutter/material.dart';
import '../../../../core/theming/stayles.dart';

class CustomTextAppbarHome extends StatelessWidget {
  const CustomTextAppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black.withOpacity(0.5),
            ),
          ),

          Text(
            "الكل",
            style: TextStyles.font16BlackBold.copyWith(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Spacer(),
          Text("أكتشف العروض", style: TextStyles.font16BlackMedium),
        ],
      ),
    );
  }
}
