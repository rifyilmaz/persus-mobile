import 'package:flutter/material.dart';

class HearingListPage extends StatelessWidget {
  const HearingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hearings = [
      {
        'fileNo': '2026/101',
        'court': 'Antalya 1. Asliye Hukuk Mahkemesi',
        'date': '28.07.2026',
        'time': '10:30',
        'description': 'Ön inceleme duruşması',
      },
      {
        'fileNo': '2026/205',
        'court': 'Antalya 3. İş Mahkemesi',
        'date': '30.07.2026',
        'time': '14:00',
        'description': 'Tanık dinlenmesi',
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Duruşma Listesi',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Yaklaşan duruşmaların tarih, saat, mahkeme ve açıklama bilgileri bu ekranda listelenir.',
        ),
        const SizedBox(height: 24),
        for (final hearing in hearings) ...[
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.gavel_outlined),
              ),
              title: Text(hearing['court']!),
              subtitle: Text(
                'Dosya No: ${hearing['fileNo']}\n'
                'Tarih: ${hearing['date']} - Saat: ${hearing['time']}\n'
                '${hearing['description']}',
              ),
              isThreeLine: true,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}