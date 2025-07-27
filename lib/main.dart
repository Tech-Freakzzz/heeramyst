import 'package:flutter/material.dart';
import 'package:heeramyst/pages/home_page.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const HeeraMystApp());
}

class HeeraMystApp extends StatelessWidget {
  const HeeraMystApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HeeraMyst',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // Change to ThemeMode.system if needed
      home: HomePage(),
    );
  }
}
