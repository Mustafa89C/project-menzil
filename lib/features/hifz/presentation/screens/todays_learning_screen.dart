import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../application/hifz_providers.dart';
import '../../domain/entities/hifz_progress.dart';
import '../../domain/hifz_plan.dart';

/// The warm ivory "Mushaf world" screen. The Mushaf page remains the primary
/// focus; interface elements stay calm and secondary.
class TodaysLearningScreen extends ConsumerWidget {
  const TodaysLearningScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressAsync = ref.watch(hifzProgressProvider);

    return Scaffold(
      backgroundColor: AppColors.ivory,
      appBar: AppBar(
        backgroundColor: AppColors.ivory,
        elevation: 0,
        centerTitle: true,
        title: const Text('Heute lernen', style: AppTypography.h2),
      ),
      body: SafeArea(
        child: progressAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.turquoise),
          ),
          error: (e, _) => Center(
            child: Text('Fortschritt konnte nicht geladen werden.',
                style: AppTypography.body),
          ),
          data: (progress) => progress.isPlanComplete
              ? _CompletedView()
              : _LearningView(progress: progress),
        ),
      ),
    );
  }
}

class _LearningView extends ConsumerWidget {
  final HifzProgress progress;

  const _LearningView({required this.progress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Traditionelle Methode',
            textAlign: TextAlign.center,
            style: AppTypography.label.copyWith(color: AppColors.gold),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Juz ${HifzPlan.juzNumber}',
            textAlign: TextAlign.center,
            style: AppTypography.h1,
          ),
          const SizedBox(height: AppSpacing.l),
          // Mushaf page focus area. The actual Mushaf rendering (approved
          // Diyanet source) is a separate data workstream; this preserves the
          // layout and visual priority of the page.
          Expanded(child: _MushafPage(pageNumber: progress.currentPage)),
          const SizedBox(height: AppSpacing.l),
          Text(
            'Seite ${progress.completedPages + 1} von ${HifzPlan.totalPages}',
            textAlign: TextAlign.center,
            style: AppTypography.label,
          ),
          const SizedBox(height: AppSpacing.s),
          AppButton(
            text: 'Als abgeschlossen markieren',
            onPressed: () async {
              await ref.read(hifzProgressProvider.notifier).completeCurrentPage();
              if (context.mounted) Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class _MushafPage extends StatelessWidget {
  final int pageNumber;

  const _MushafPage({required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.gold, width: 0.5),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.menu_book_outlined,
                size: 64, color: AppColors.turquoise),
            const SizedBox(height: AppSpacing.m),
            Text('Seite $pageNumber', style: AppTypography.h1),
            const SizedBox(height: AppSpacing.xs),
            Text('Muṣḥaf', style: AppTypography.label),
          ],
        ),
      ),
    );
  }
}

class _CompletedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.m),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.verified_outlined,
                size: 72, color: AppColors.gold),
            const SizedBox(height: AppSpacing.m),
            Text('Juz ${HifzPlan.juzNumber} abgeschlossen',
                style: AppTypography.h1, textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.xs),
            const Text(
              'Māšāʾ Allāh. Setze deine Festigung (Murājaʿa) fort.',
              textAlign: TextAlign.center,
              style: AppTypography.body,
            ),
            const SizedBox(height: AppSpacing.l),
            AppButton(
              text: 'Zurück zum Dashboard',
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
