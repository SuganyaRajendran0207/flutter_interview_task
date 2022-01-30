// ignore_for_file:  public_member_api_docs
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview_task/presentation/styles/colors.dart';

class DotLine extends StatelessWidget {
  ///
  /// constructor
  ///
  const DotLine(
      {Key? key,
      this.isHorizontal = false,
      this.size,
      this.color,
      this.padding})
      : super(key: key);

  final bool isHorizontal;
  final Size? size;
  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 16, right: 16.0),
      child: CustomPaint(
          size: size ?? const Size(double.infinity, 1),
          painter: isHorizontal
              ? DashedLineHorizontalPainter(
                  dashColor: color ?? CustomColors.greyLiteColor)
              : DashedLineVerticalPainter(
                  dashColor: color ?? CustomColors.greyLiteColor)),
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  final double? dashHeight;
  final double? dashSpace;
  final Color? dashColor;

  DashedLineVerticalPainter(
      {this.dashHeight = 4, this.dashSpace = 1, this.dashColor});

  @override
  void paint(Canvas canvas, Size size) {
    double startY = 0;
    final Paint paint = Paint()
      ..color = dashColor ?? Colors.black12
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(
          Offset(0, startY), Offset(0, startY + dashHeight!), paint);
      startY += dashHeight! + dashSpace!;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DashedLineHorizontalPainter extends CustomPainter {
  final double? dashWidth;
  final double? dashSpace;
  final Color? dashColor;

  DashedLineHorizontalPainter(
      {this.dashWidth = 1, this.dashSpace = 1, this.dashColor});

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;
    final Paint paint = Paint()
      ..color = dashColor ?? Colors.black12
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth!, 0), paint);
      startX += dashWidth! + dashSpace!;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
