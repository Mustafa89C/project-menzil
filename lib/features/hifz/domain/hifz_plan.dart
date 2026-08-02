/// Fixed learning plan for this vertical slice.
///
/// Traditional Turkish-Ottoman method: the student begins with the final page
/// of the Juz and continues toward the previous pages in later rounds.
/// For this slice a single Juz (Juz 30 / ʿAmma) is used as the plan.
class HifzPlan {
  HifzPlan._();

  static const int juzNumber = 30;

  /// Juz 30 spans pages 582–604 in the standard Medina Mushaf (23 pages).
  static const int totalPages = 23;
  static const int lastPage = 604;

  /// Physical Mushaf page for the given number of completed pages,
  /// counting downward from the final page of the Juz.
  static int pageForProgress(int completedPages) {
    final page = lastPage - completedPages;
    return page < (lastPage - totalPages + 1) ? (lastPage - totalPages + 1) : page;
  }
}
