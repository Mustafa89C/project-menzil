import '../hifz_plan.dart';

enum HifzMethod { traditionalTurkishOttoman }

/// Immutable progress of the learner through the current plan.
class HifzProgress {
  final int completedPages;
  final HifzMethod method;

  const HifzProgress({
    required this.completedPages,
    this.method = HifzMethod.traditionalTurkishOttoman,
  });

  bool get isPlanComplete => completedPages >= HifzPlan.totalPages;

  /// The Mushaf page the learner should memorize next.
  int get currentPage => HifzPlan.pageForProgress(completedPages);

  HifzProgress copyWith({int? completedPages, HifzMethod? method}) {
    return HifzProgress(
      completedPages: completedPages ?? this.completedPages,
      method: method ?? this.method,
    );
  }
}
