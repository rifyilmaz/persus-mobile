import 'package:flutter/material.dart';

enum DashboardDetailType {
  delayedMeetings,
  pendingMeetings,
  hearingInfo,
  fileStatistics,
}

extension DashboardDetailTypeExtension on DashboardDetailType {
  String get title {
    switch (this) {
      case DashboardDetailType.delayedMeetings:
        return 'Gecikmiş Görüşler';
      case DashboardDetailType.pendingMeetings:
        return 'Bekleyen Görüşler';
      case DashboardDetailType.hearingInfo:
        return 'Duruşma Bilgileri';
      case DashboardDetailType.fileStatistics:
        return 'Dosya İstatistik';
    }
  }

  IconData get icon {
    switch (this) {
      case DashboardDetailType.delayedMeetings:
        return Icons.folder_open_outlined;
      case DashboardDetailType.pendingMeetings:
        return Icons.description_outlined;
      case DashboardDetailType.hearingInfo:
        return Icons.event_note_outlined;
      case DashboardDetailType.fileStatistics:
        return Icons.analytics_outlined;
    }
  }
}

class DashboardDetailPage extends StatelessWidget {
  final DashboardDetailType type;

  const DashboardDetailPage({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _DetailHeader(type: type),
          const SizedBox(height: 16),
          if (type == DashboardDetailType.delayedMeetings)
            const _MeetingTableCard(
              title: 'Gecikmiş Görüşler',
              emptyMessage: 'Kayıt yok.',
            )
          else if (type == DashboardDetailType.pendingMeetings)
            const _MeetingTableCard(
              title: 'Bekleyen Görüşler',
              emptyMessage: 'Kayıt yok.',
            )
          else if (type == DashboardDetailType.hearingInfo)
            const _HearingInfoCard()
          else
            const _FileStatisticsCard(),
        ],
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  final DashboardDetailType type;

  const _DetailHeader({
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              child: Icon(type.icon, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                type.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MeetingTableCard extends StatelessWidget {
  final String title;
  final String emptyMessage;

  const _MeetingTableCard({
    required this.title,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    final columns = [
      'Kayıt No',
      'Avukat',
      'Birim',
      'Geldiği Yer',
      'Başlangıç',
      'Bitiş',
      'Konu',
      'Gel.Evrak No',
      'Gid.Evrak No',
      'Açıklama',
      'Durumu',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  for (final column in columns)
                    DataColumn(
                      label: Text(
                        column,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
                rows: const [],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              emptyMessage,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(),
            const Text(
              'Toplam kayıt: 0',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _HearingInfoCard extends StatelessWidget {
  const _HearingInfoCard();

  @override
  Widget build(BuildContext context) {
    final columns = [
      'Avukat',
      'Dosya',
      'Tarih',
      'Saat(Baş.)',
      'Yer',
      'Açıklama',
      'Bilgi',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Duruşma Bilgileri',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  for (final column in columns)
                    DataColumn(
                      label: Text(
                        column,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
                rows: const [],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Kayıt yok.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(),
            const Text(
              'Toplam duruşma kaydı: 0',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _FileStatisticsCard extends StatelessWidget {
  const _FileStatisticsCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dosya İstatistik',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Tarih',
                hintText: 'gg.aa.yyyy',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Avukat')),
                  DataColumn(label: Text('TC Kimlik')),
                  DataColumn(label: Text('Adli Derdest')),
                  DataColumn(label: Text('Adli Ö.Bekliyor')),
                  DataColumn(label: Text('Adli Hitam')),
                  DataColumn(label: Text('İdari Derdest')),
                  DataColumn(label: Text('İdari Ö.Bekliyor')),
                  DataColumn(label: Text('İdari Hitam')),
                  DataColumn(label: Text('Ceza Derdest')),
                  DataColumn(label: Text('Ceza Ö.Bekliyor')),
                  DataColumn(label: Text('Ceza Hitam')),
                  DataColumn(label: Text('İcra Derdest')),
                  DataColumn(label: Text('İcra Ö.Bekliyor')),
                  DataColumn(label: Text('İcra Hitam')),
                  DataColumn(label: Text('Toplam')),
                  DataColumn(label: Text('Duruşma')),
                ],
                rows: const [],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Kayıt yok.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(),
            const Text(
              'Toplam kayıt: 0',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}