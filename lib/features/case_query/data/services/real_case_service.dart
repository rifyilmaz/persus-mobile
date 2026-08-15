import '../../../../core/network/api_client.dart';
import '../models/case_model.dart';
import 'case_service.dart';

class RealCaseService implements CaseService {
  final ApiClient apiClient;

  const RealCaseService({
    required this.apiClient,
  });

  @override
  Future<List<CaseModel>> getCases({Map<String, dynamic>? filters}) async {
    try {
      final response = await apiClient.get('/law');

      final results = response['results'];

      if (results is List) {
        return results
            .map((e) => CaseModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      return [];
    } catch (e) {
      rethrow;
    }
  }
}