class DashboardStatistics {
  final int pendingMeetings;
  final int delayedMeetings;
  final int hearings;
  final int files;

  const DashboardStatistics({
    required this.pendingMeetings,
    required this.delayedMeetings,
    required this.hearings,
    required this.files,
  });

  const DashboardStatistics.empty()
      : pendingMeetings = 0,
        delayedMeetings = 0,
        hearings = 0,
        files = 0;
}