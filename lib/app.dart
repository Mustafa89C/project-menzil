import 'package:flutter/material.dart';

import 'features/start/presentation/screens/start_screen.dart';

class HifzRehberiApp extends StatelessWidget {
  const HifzRehberiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hifz Rehberi',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F6B4F),
        ),
      ),
      home: const StartScreen(),
    );
  }
}