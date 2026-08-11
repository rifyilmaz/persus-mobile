import '../../../../core/network/api_client.dart';

import '../models/security_item.dart';
import '../models/security_menu.dart';

import 'security_service.dart';

class RealSecurityService implements SecurityService {
  final ApiClient apiClient;

  const RealSecurityService({
    required this.apiClient,
  });

  @override
  Future<List<SecurityItem>> getServers() async {
    final data = await apiClient.get(
      '/security/servers',
    );

    return _parseSecurityItems(data);
  }

  @override
  Future<List<SecurityItem>> getRoles() async {
    final data = await apiClient.get(
      '/security/roles',
    );

    return _parseSecurityItems(data);
  }

  @override
  Future<List<SecurityItem>> getOrganizations() async {
    final data = await apiClient.get(
      '/security/organizations',
    );

    return _parseSecurityItems(data);
  }

  @override
  Future<List<SecurityMenu>> getMenus() async {
    final data = await apiClient.get(
      '/security/menus',
    );

    final results = data['results'];

    if (results == null) {
      return [];
    }

    if (results is! List) {
      throw Exception(
        'Security menü yanıtında "results" alanı geçersiz.',
      );
    }

    return results
        .whereType<Map<String, dynamic>>()
        .map(SecurityMenu.fromJson)
        .toList();
  }

  List<SecurityItem> _parseSecurityItems(
    Map<String, dynamic> data,
  ) {
    final results = data['results'];

    if (results == null) {
      return [];
    }

    if (results is! List) {
      throw Exception(
        'Security API yanıtında "results" alanı geçersiz.',
      );
    }

    return results
        .whereType<Map<String, dynamic>>()
        .map(SecurityItem.fromJson)
        .toList();
  }
}