import '../models/case_model.dart';

abstract class CaseService {
  Future<List<CaseModel>> getCases({Map<String, dynamic>? filters});
}