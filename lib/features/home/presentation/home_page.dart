import 'package:flutter/material.dart';

import '../../auth/data/models/login_response.dart';

class HomePage extends StatelessWidget {
  final LoginResponse loginResponse;

  const HomePage({
    super.key,
    required this.loginResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persus Mobil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Giriş başarılı',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text('Kullanıcı ID: ${loginResponse.userId}'),
                Text('Kullanıcı Adı: ${loginResponse.username}'),
                Text('Ad Soyad: ${loginResponse.fullName}'),
                Text('Token Türü: ${loginResponse.tokenType}'),
                const SizedBox(height: 12),
                const Text(
                  'Mock Token:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SelectableText(loginResponse.token),
              ],
            ),
          ),
        ),
      ),
    );
  }
}