import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repositories/hifz_repository_impl.dart';
import '../domain/entities/hifz_progress.dart';
import '../domain/repositories/hifz_repository.dart';

/// Provided once at startup via a [ProviderScope] override in main.dart.
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('sharedPreferencesProvider must be overridden'),
);

final hifzRepositoryProvider = Provider<HifzRepository>(
  (ref) => HifzRepositoryImpl(ref.watch(sharedPreferencesProvider)),
);

final hifzProgressProvider =
    AsyncNotifierProvider<HifzProgressNotifier, HifzProgress>(HifzProgressNotifier.new);

class HifzProgressNotifier extends AsyncNotifier<HifzProgress> {
  @override
  Future<HifzProgress> build() {
    return ref.watch(hifzRepositoryProvider).loadProgress();
  }

  /// Marks the current page complete and persists it locally.
  Future<void> completeCurrentPage() async {
    final current = state.value ?? const HifzProgress(completedPages: 0);
    if (current.isPlanComplete) return;

    final updated = current.copyWith(completedPages: current.completedPages + 1);
    state = AsyncData(updated);
    await ref.read(hifzRepositoryProvider).saveProgress(updated);
  }
}
