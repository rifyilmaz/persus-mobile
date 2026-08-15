import 'package:flutter/material.dart';
import '../data/models/case_model.dart';

class CaseDetailPage extends StatelessWidget {
  final CaseModel caseItem;

  const CaseDetailPage({
    super.key,
    required this.caseItem,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dosya Detayı - ${caseItem.kayitId}'),
          bottom: const TabBar(
            isScrollable: true, 
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'Temel Bilgiler'),
              Tab(text: 'Taraflar'),
              Tab(text: 'Duruşma ve Aşamalar'),
              Tab(text: 'Evraklar'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTemelBilgiler(context),
            _buildTaraflar(context),
            _buildDurusmalar(context), 
            _buildEvraklar(context),  
          ],
        ),
      ),
    );
  }

  Widget _buildTemelBilgiler(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDetailRow(context, 'Dava Türü', caseItem.davaTuru),
        _buildDetailRow(context, 'Durumu', caseItem.durum),
        _buildDetailRow(context, 'Dava Grubu', caseItem.davaGrup),
        _buildDetailRow(context, 'Kayıt Tarihi', caseItem.davaTarihi),
        _buildDetailRow(context, 'Yetkili Mahkeme', caseItem.yetkiliMahkeme),
        const SizedBox(height: 16),
        const Text(
          'Konu',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(caseItem.konu ?? '-'),
      ],
    );
  }

  Widget _buildTaraflar(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDetailRow(context, 'Avukat', caseItem.avukatAdSoyad),
        const Divider(height: 32),
        _buildDetailRow(context, 'Davacı', caseItem.davaciAdSoyad ?? '-'),
        const Divider(height: 32),
        _buildDetailRow(context, 'Davalı', caseItem.davali ?? '-'),
      ],
    );
  }
  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDurusmalar(BuildContext context) {
    final durusmalar = [
      {'tarih': '12.09.2026', 'saat': '10:30', 'aciklama': 'Ön İnceleme Duruşması', 'durum': 'Tamamlandı'},
      {'tarih': '15.11.2026', 'saat': '14:00', 'aciklama': 'Tanıkların Dinlenmesi', 'durum': 'Bekliyor'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: durusmalar.length,
      itemBuilder: (context, index) {
        final durusma = durusmalar[index];
        final isCompleted = durusma['durum'] == 'Tamamlandı';

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isCompleted 
                  ? Colors.green.withValues(alpha: 0.2) 
                  : Colors.orange.withValues(alpha: 0.2),
              child: Icon(
                Icons.gavel,
                color: isCompleted ? Colors.green : Colors.orange,
              ),
            ),
            title: Text(
              durusma['aciklama']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${durusma['tarih']} - Saat: ${durusma['saat']}'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isCompleted 
                    ? Colors.green.withValues(alpha: 0.1) 
                    : Colors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                durusma['durum']!,
                style: TextStyle(
                  color: isCompleted ? Colors.green : Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEvraklar(BuildContext context) {
    final evraklar = [
      {'ad': 'Dava Dilekçesi.pdf', 'tarih': '08.08.2026', 'boyut': '2.4 MB'},
      {'ad': 'Bilirkişi Raporu.pdf', 'tarih': '10.08.2026', 'boyut': '5.1 MB'},
      {'ad': 'Vekaletname.png', 'tarih': '11.08.2026', 'boyut': '1.2 MB'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: evraklar.length,
      itemBuilder: (context, index) {
        final evrak = evraklar[index];
        final isPdf = evrak['ad']!.endsWith('.pdf');

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Icon(
              isPdf ? Icons.picture_as_pdf : Icons.image,
              color: isPdf ? Colors.red : Colors.blue,
              size: 32,
            ),
            title: Text(
              evrak['ad']!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text('Yüklenme: ${evrak['tarih']} • Boyut: ${evrak['boyut']}'),
            trailing: IconButton(
              icon: const Icon(Icons.download_rounded),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${evrak['ad']} indiriliyor...')),
                );
              },
            ),
          ),
        );
      },
    );
  }
}