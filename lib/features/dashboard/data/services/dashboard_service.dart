import '../models/dashboard_statistics.dart';
import '../models/dashboard_meeting.dart'; 
import '../models/dashboard_file_statistics.dart'; 

abstract class DashboardService {
  Future<DashboardStatistics> getStatistics();

  Future<List<DashboardMeeting>> getDelayedMeetings();
  Future<List<DashboardMeeting>> getPendingMeetings();
  Future<List<DashboardMeeting>> getHearings();
  Future<List<DashboardFileStatistics>> getFileStatistics();
}