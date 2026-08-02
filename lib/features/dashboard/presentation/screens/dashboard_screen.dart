import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../hifz/application/hifz_providers.dart';
import '../../../hifz/domain/entities/hifz_progress.dart';
import '../../../hifz/domain/hifz_plan.dart';
import '../../../hifz/presentation/screens/todays_learning_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(hifzProgressProvider).value;

    return Scaffold(
      backgroundColor: AppColors.ivory,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: AppSpacing.l),
                _buildDailyImpulse(),
                const SizedBox(height: AppSpacing.l),
                _buildActionGrid(context, progress),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flexible slots for greeting, user name and date
            Text("Assalāmu ʿalaikum", style: AppTypography.label),
            const Text("Benutzername", style: AppTypography.h1),
            Text("25. Juli 2026", style: AppTypography.label),
          ],
        ),
        // TODO: Replace with official Project Hifz Rehberi logo asset
        const Icon(Icons.auto_stories, size: 48, color: AppColors.turquoise),
      ],
    );
  }

  Widget _buildDailyImpulse() {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.lightbulb_outline,
                color: AppColors.gold,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                "Tagesimpuls",
                style: AppTypography.label.copyWith(color: AppColors.gold),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s),
          const Text(
            "\"Der Beste unter euch ist derjenige, der den Qur'an lernt und ihn lehrt.\"",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          const Align(
            alignment: Alignment.centerRight,
            child: Text("— Hadith", style: AppTypography.label),
          ),
        ],
      ),
    );
  }

  Widget _buildActionGrid(BuildContext context, HifzProgress? progress) {
    final completed = progress?.completedPages ?? 0;
    final isDone = progress?.isPlanComplete ?? false;
    final learnSubtitle = isDone
        ? "Juz ${HifzPlan.juzNumber} abgeschlossen"
        : "Seite ${completed + 1} von ${HifzPlan.totalPages} · Juz ${HifzPlan.juzNumber}";

    return Column(
      children: [
        _ActionCard(
          icon: Icons.menu_book,
          title: "Heute lernen",
          subtitle: learnSubtitle,
          progress: completed / HifzPlan.totalPages,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TodaysLearningScreen(),
              ),
            );
          },
        ),
        const SizedBox(height: AppSpacing.s),
        _ActionCard(
          icon: Icons.sync,
          title: "Festigung",
          subtitle: "Murājaʿa deiner Suren",
        ),
        const SizedBox(height: AppSpacing.s),
        _ActionCard(
          icon: Icons.bar_chart,
          title: "Fortschritt",
          subtitle: "Deine Meilensteine im Blick",
        ),
        const SizedBox(height: AppSpacing.s),
        _ActionCard(
          icon: Icons.track_changes,
          title: "Nächster Schritt",
          subtitle: "Was als Nächstes ansteht",
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double? progress;
  final VoidCallback? onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.progress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.s,
      ),
      onTap: onTap ?? () {},
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.s),
                decoration: BoxDecoration(
                  color: AppColors.turquoise.withAlpha(25),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: AppColors.turquoise, size: 28),
              ),
              const SizedBox(width: AppSpacing.m),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTypography.h2),
                    Text(subtitle, style: AppTypography.label),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.gold),
            ],
          ),
          if (progress != null) ...[
            const SizedBox(height: AppSpacing.s),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress!.clamp(0.0, 1.0),
                minHeight: 6,
                backgroundColor: AppColors.turquoise.withAlpha(25),
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.turquoise),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
