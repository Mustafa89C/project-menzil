import '../entities/hifz_progress.dart';

/// Persistence boundary for learner progress.
abstract class HifzRepository {
  Future<HifzProgress> loadProgress();
  Future<void> saveProgress(HifzProgress progress);
}
