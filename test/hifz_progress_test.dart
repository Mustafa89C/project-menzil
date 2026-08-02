import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:projects_hifz_rehberi/features/hifz/application/hifz_providers.dart';
import 'package:projects_hifz_rehberi/features/hifz/data/repositories/hifz_repository_impl.dart';
import 'package:projects_hifz_rehberi/features/hifz/domain/entities/hifz_progress.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('repository persists and reloads progress', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final repo = HifzRepositoryImpl(prefs);

    expect((await repo.loadProgress()).completedPages, 0);

    await repo.saveProgress(const HifzProgress(completedPages: 3));
    expect((await repo.loadProgress()).completedPages, 3);
  });

  test('completeCurrentPage increments and persists', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
    addTearDown(container.dispose);

    // Ensure initial async load resolves.
    await container.read(hifzProgressProvider.future);
    await container.read(hifzProgressProvider.notifier).completeCurrentPage();

    expect(container.read(hifzProgressProvider).value?.completedPages, 1);
    // Persisted value survives via a fresh repository instance.
    expect((await HifzRepositoryImpl(prefs).loadProgress()).completedPages, 1);
  });
}
