import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  /// Add padding
  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget paddingSymmetric({double v = 0, double h = 0}) => Padding(
        padding: EdgeInsets.symmetric(vertical: v, horizontal: h),
        child: this,
      );

  /// Add margin with a container
  Widget marginAll(double value) => Container(
        margin: EdgeInsets.all(value),
        child: this,
      );

  /// OnTap Gesture
  Widget onTap(VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: this,
      );

  /// Hide widget conditionally
  Widget visible(bool isVisible) => isVisible ? this : const SizedBox.shrink();

  /// Add rounded corners & background
  Widget roundedBox({double radius = 8, Color? color}) => Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: this,
      );
}
