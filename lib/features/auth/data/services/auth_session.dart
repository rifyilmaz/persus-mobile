class AuthSession {
  String? _token;

  String? get token => _token;

  bool get isAuthenticated =>
      _token != null && _token!.trim().isNotEmpty;

  void setToken(String token) {
    final normalizedToken = token.trim();

    if (normalizedToken.isEmpty) {
      throw ArgumentError('Token boş olamaz.');
    }

    _token = normalizedToken;
  }

  void clear() {
    _token = null;
  }
}