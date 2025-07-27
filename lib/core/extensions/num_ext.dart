import 'package:flutter/material.dart';

extension NumExt on num {
  /// Convert to EdgeInsets (all)
  EdgeInsets get all => EdgeInsets.all(toDouble());

  /// Horizontal padding
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble());

  /// Vertical padding
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble());

  /// BorderRadius circular
  BorderRadius get radius => BorderRadius.circular(toDouble());

  /// SizedBox height
  SizedBox get hBox => SizedBox(height: toDouble());

  /// SizedBox width
  SizedBox get wBox => SizedBox(width: toDouble());
}
