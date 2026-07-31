import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _showSavedMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profil bilgileri mock olarak kaydedildi.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController(text: 'demo.hukuk');
    final nameController = TextEditingController(text: 'DEMO - HUKUK');
    final surnameController = TextEditingController(text: '-');
    final titleController = TextEditingController(text: 'DEMO');
    final identityController = TextEditingController(text: '0');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Kullanıcı Bilgileri',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Bu ekran, kullanıcı profil bilgilerinin mobil arayüzde görüntülenmesi ve düzenlenmesi için tasarlanmıştır.',
          ),
          const SizedBox(height: 24),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: 'Kullanıcı',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Adı',
              prefixIcon: Icon(Icons.badge_outlined),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: surnameController,
            decoration: const InputDecoration(
              labelText: 'Soyadı',
              prefixIcon: Icon(Icons.badge_outlined),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Ünvanı',
              prefixIcon: Icon(Icons.work_outline),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: identityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'TC Kimlik No',
              prefixIcon: Icon(Icons.credit_card_outlined),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => _showSavedMessage(context),
            icon: const Icon(Icons.save_outlined),
            label: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }
}