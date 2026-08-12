import '../../../../core/network/api_client.dart';
import '../models/dashboard_statistics.dart';
import '../models/dashboard_meeting.dart';
import '../models/dashboard_file_statistics.dart';
import 'dashboard_service.dart';

class RealDashboardService implements DashboardService {
  final ApiClient apiClient;

  const RealDashboardService({
    required this.apiClient,
  });

  @override
  Future<DashboardStatistics> getStatistics() async {
    final pending = await _getCount('/law/statistics/main/bekleyengorusler');
    final delayed = await _getCount('/law/statistics/main/gecikengorusler');
    final hearings = await _getCount('/law/statistics/main/durusmalar');
    final files = await _getCount('/law/statistics/main/dosyalar');

    return DashboardStatistics(
      pendingMeetings: pending,
      delayedMeetings: delayed,
      hearings: hearings,
      files: files,
    );
  }

  Future<int> _getCount(String path) async {
    try {
      final response = await apiClient.get(path);
      return _readToplam(response);
    } catch (_) {
      return 0; 
    }
  }

  @override
  Future<List<DashboardMeeting>> getPendingMeetings() async {
    final response = await apiClient.get('/law/statistics/main/bekleyengorusler');
    return _parseMeetingList(response);
  }

  @override
  Future<List<DashboardMeeting>> getDelayedMeetings() async {
    final response = await apiClient.get('/law/statistics/main/gecikengorusler');
    return _parseMeetingList(response);
  }

  @override
  Future<List<DashboardMeeting>> getHearings() async {
    final response = await apiClient.get('/law/statistics/main/durusmalar');
    return _parseMeetingList(response);
  }

  @override
  Future<List<DashboardFileStatistics>> getFileStatistics() async {
    final response = await apiClient.get('/law/statistics/main/dosyalar');
    final results = response['results'];
    
    if (results is List) {
      return results
          .map((e) => DashboardFileStatistics.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  int _readToplam(Map<String, dynamic> response) {
    final value = response['toplam'];
    if (value is int) return value;
    if (value is num) return value.toInt();
    return 0;
  }

  List<DashboardMeeting> _parseMeetingList(Map<String, dynamic> response) {
    final results = response['results'];
    if (results is List) {
      return results
          .map((e) => DashboardMeeting.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}