import 'package:flutter/material.dart';
import '../../../../core/navigation/main_navigation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ivory,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.m),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO: Replace with official Project Hifz Rehberi logo asset
                // Image.asset('assets/images/logo.png', height: 120),
                const Icon(
                  Icons.auto_stories,
                  size: 90,
                  color: AppColors.turquoise,
                ),
                const SizedBox(height: AppSpacing.m),
                const Text(
                  "Hifz Rehberi",
                  style: AppTypography.h1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xs),
                const Text(
                  "Willkommen auf deinem Hifz-Weg",
                  textAlign: TextAlign.center,
                  style: AppTypography.body,
                ),
                const SizedBox(height: AppSpacing.xl),
                AppButton(
                  text: "Lernen starten",
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainNavigation(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
