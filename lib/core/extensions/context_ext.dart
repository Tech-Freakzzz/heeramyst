import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  /// Screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// ThemeData
  ThemeData get theme => Theme.of(this);

  /// TextTheme
  TextTheme get textTheme => theme.textTheme;

  /// Primary Color
  Color get primaryColor => theme.colorScheme.primary;

  /// Secondary Color
  Color get secondaryColor => theme.colorScheme.secondary;

  /// Check if device is mobile
  bool get isMobile => screenWidth < 600;

  /// Check if device is tablet
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;

  /// Check if device is desktop
  bool get isDesktop => screenWidth >= 1024;
}
