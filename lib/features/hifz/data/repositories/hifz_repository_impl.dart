import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/hifz_progress.dart';
import '../../domain/repositories/hifz_repository.dart';
import '../models/hifz_progress_model.dart';

class HifzRepositoryImpl implements HifzRepository {
  static const String _key = 'hifz_progress';

  final SharedPreferences prefs;

  HifzRepositoryImpl(this.prefs);

  @override
  Future<HifzProgress> loadProgress() async {
    return HifzProgressModel.fromStorage(prefs.getString(_key));
  }

  @override
  Future<void> saveProgress(HifzProgress progress) async {
    await prefs.setString(_key, HifzProgressModel.toStorage(progress));
  }
}
