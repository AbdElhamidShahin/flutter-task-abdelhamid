import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tast_abdelhamid/core/theming/app_colors.dart';
import 'package:flutter_tast_abdelhamid/core/theming/stayles.dart';

class EllipticalHeadView extends StatelessWidget {
  const EllipticalHeadView({super.key, required this.viewCount});
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      width: 71.w,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: _EllipticalHeaderPainter(
              fillColor: AppColors.mainGreen.withOpacity(0.05),
              borderColor: AppColors.mainGreen,
              strokeWidth: 1.5,
            ),
          ),
          Positioned(

            top: 20,
            child: Text(
              "$viewCount",
              style: TextStyles.font14BlueMainBold.copyWith(
                color: AppColors.mainGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EllipticalHeaderPainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;
  final double strokeWidth;

  _EllipticalHeaderPainter({
    required this.fillColor,
    required this.borderColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final path = Path()
      ..moveTo(0, height)
      ..lineTo(0, height * 0.7)
      ..cubicTo(
        width * 0.1,
        -height * 0.1,
        width * 0.9,
        -height * 0.1,
        width,
        height * 0.7,
      )
      ..lineTo(width, height);
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! _EllipticalHeaderPainter ||
        oldDelegate.fillColor != fillColor ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
