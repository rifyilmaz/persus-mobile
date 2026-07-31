import 'package:flutter/material.dart';

class CaseFileEntryPage extends StatelessWidget {
  const CaseFileEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Dava Dosya Giriş',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Yeni dava dosyası oluşturmak veya mevcut dosya bilgilerini kaydetmek için kullanılacak mobil ekran taslağı.',
        ),
        const SizedBox(height: 24),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Dosya No',
            prefixIcon: Icon(Icons.folder_outlined),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Müvekkil / Taraf Bilgisi',
            prefixIcon: Icon(Icons.person_outline),
          ),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: 'Hukuk',
          decoration: const InputDecoration(
            labelText: 'Dosya Türü',
            prefixIcon: Icon(Icons.category_outlined),
          ),
          items: const [
            DropdownMenuItem(
              value: 'Hukuk',
              child: Text('Hukuk'),
            ),
            DropdownMenuItem(
              value: 'Ceza',
              child: Text('Ceza'),
            ),
            DropdownMenuItem(
              value: 'İcra',
              child: Text('İcra'),
            ),
            DropdownMenuItem(
              value: 'İdari',
              child: Text('İdari'),
            ),
          ],
          onChanged: (_) {},
        ),
        const SizedBox(height: 16),
        TextField(
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: 'Açıklama',
            alignLabelWithHint: true,
            prefixIcon: Icon(Icons.description_outlined),
          ),
        ),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.save_outlined),
          label: const Text('Kaydet'),
        ),
      ],
    );
  }
}