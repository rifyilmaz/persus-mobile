import 'package:flutter/material.dart';

class CaseQueryPage extends StatefulWidget {
  const CaseQueryPage({super.key});

  @override
  State<CaseQueryPage> createState() => _CaseQueryPageState();
}

class _CaseQueryPageState extends State<CaseQueryPage> {
  final TextEditingController _queryController = TextEditingController();
  bool _hasSearched = false;

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  void _searchCase() {
    setState(() {
      _hasSearched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Dava Sorgu',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Dosya numarası, taraf bilgisi veya kayıt numarası ile dava dosyası sorgulama ekranı.',
        ),
        const SizedBox(height: 24),
        TextField(
          controller: _queryController,
          decoration: const InputDecoration(
            labelText: 'Dosya No / Taraf / Kayıt No',
            prefixIcon: Icon(Icons.search_outlined),
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: _searchCase,
          icon: const Icon(Icons.search),
          label: const Text('Sorgula'),
        ),
        const SizedBox(height: 24),
        if (_hasSearched)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Örnek Sorgu Sonucu',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text('Dosya No: 2026/101'),
                  Text('Dosya Türü: Hukuk'),
                  Text('Mahkeme: Antalya 1. Asliye Hukuk Mahkemesi'),
                  Text('Durum: Derdest'),
                  Text('Son İşlem: Ön inceleme duruşması bekleniyor.'),
                ],
              ),
            ),
          ),
      ],
    );
  }
}