import 'dart:convert';

import '../../domain/entities/hifz_progress.dart';

/// Serialization helpers between [HifzProgress] and its stored form.
class HifzProgressModel {
  HifzProgressModel._();

  static HifzProgress fromStorage(String? source) {
    if (source == null || source.isEmpty) {
      return const HifzProgress(completedPages: 0);
    }
    final map = jsonDecode(source) as Map<String, dynamic>;
    return HifzProgress(
      completedPages: (map['completedPages'] as int?) ?? 0,
      method: HifzMethod.values.firstWhere(
        (m) => m.name == map['method'],
        orElse: () => HifzMethod.traditionalTurkishOttoman,
      ),
    );
  }

  static String toStorage(HifzProgress progress) {
    return jsonEncode({
      'completedPages': progress.completedPages,
      'method': progress.method.name,
    });
  }
}
