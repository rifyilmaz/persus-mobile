import '../models/security_item.dart';
import '../models/security_menu.dart';

abstract class SecurityService {
  Future<List<SecurityItem>> getServers();

  Future<List<SecurityItem>> getRoles();

  Future<List<SecurityItem>> getOrganizations();

  Future<List<SecurityMenu>> getMenus();
}