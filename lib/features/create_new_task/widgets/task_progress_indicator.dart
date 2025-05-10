class TaskProgressIndicator {
  static double calculateProgress(
      DateTime taskCreatedAt,
      DateTime taskDeadline,
      ) {
    final DateTime now = DateTime.now();

    if (now.isBefore(taskCreatedAt)) return 0.0;
    if (now.isAfter(taskDeadline)) return 100.0;

    final Duration totalDuration = taskDeadline.difference(taskCreatedAt);
    final Duration elapsedDuration = now.difference(taskCreatedAt);

    double progress =
        (elapsedDuration.inMilliseconds / totalDuration.inMilliseconds) * 100;

    return double.parse(progress.toStringAsFixed(2));
  }
}