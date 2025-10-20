import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../logic/cubit.dart';

Widget buildNavItem(
  BuildContext context,
  int selectedIndex, {
  required String svgPath,
  required String label,
  required int index,
}) {
  final cubit = context.read<NavigationCubit>();
  final bool isSelected = selectedIndex == index;

  Color color;
  final Color blueNavBar = AppColors.blueNavBar;
  final Color activeColor = AppColors.blackText;
  final Color inactiveColor = AppColors.blackText.withOpacity(0.5);

  if (index == 2) {
    color = blueNavBar;
  } else if (isSelected) {
    color = activeColor;
  } else {
    color = inactiveColor;
  }
  FontWeight fontWeight = isSelected || index == 2
      ? FontWeight.bold
      : FontWeight.normal;
  return Expanded(
    child: InkWell(
      onTap: () => cubit.changeTab(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 24.h, width: 24.w, child: SvgPicture.asset(svgPath)),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
         SizedBox(
    height: isSelected ? 3 : 0,
        width: isSelected ? 45.w : 0,
        child: CustomPaint(
        painter: CurvedLinePainter(
        color: isSelected ? Colors.black : Colors.transparent,
    ),
  ),
  ),
        ],
      ),
    ),
  );
}

class CurvedLinePainter extends CustomPainter {
  final Color color;
  CurvedLinePainter({required this.color});
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // ← دي اللي بتخلي الأطراف منحنية

    final path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }
}