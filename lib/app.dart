import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/start/presentation/screens/start_screen.dart';

class HifzRehberiApp extends StatelessWidget {
  const HifzRehberiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Hifz Rehberi',
      theme: AppTheme.lightTheme,
      home: const StartScreen(),
    );
  }
}
