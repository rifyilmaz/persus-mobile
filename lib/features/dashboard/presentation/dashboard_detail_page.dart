import 'package:flutter/material.dart';

import '../data/models/dashboard_file_statistics.dart';
import '../data/models/dashboard_meeting.dart';
import '../data/services/dashboard_service.dart';

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
  final DashboardService dashboardService; 

  const DashboardDetailPage({
    super.key,
    required this.type,
    required this.dashboardService,
  });

  Future<dynamic> _fetchData() {
    switch (type) {
      case DashboardDetailType.delayedMeetings:
        return dashboardService.getDelayedMeetings();
      case DashboardDetailType.pendingMeetings:
        return dashboardService.getPendingMeetings();
      case DashboardDetailType.hearingInfo:
        return dashboardService.getHearings();
      case DashboardDetailType.fileStatistics:
        return dashboardService.getFileStatistics();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type.title),
      ),
      body: FutureBuilder(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Bir hata oluştu:\n${snapshot.error}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            );
          }

          final data = snapshot.data;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _DetailHeader(type: type),
              const SizedBox(height: 16),
              _buildContentCard(data),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContentCard(dynamic data) {
    switch (type) {
      case DashboardDetailType.delayedMeetings:
        return _MeetingTableCard(
          title: 'Gecikmiş Görüşler',
          emptyMessage: 'Gecikmiş görüş kaydı bulunamadı.',
          meetings: data as List<DashboardMeeting>,
        );

      case DashboardDetailType.pendingMeetings:
        return _MeetingTableCard(
          title: 'Bekleyen Görüşler',
          emptyMessage: 'Bekleyen görüş kaydı bulunamadı.',
          meetings: data as List<DashboardMeeting>,
        );

      case DashboardDetailType.hearingInfo:
        return _HearingInfoCard(
          hearings: data as List<DashboardMeeting>,
        );

      case DashboardDetailType.fileStatistics:
        return _FileStatisticsCard(
          statistics: data as List<DashboardFileStatistics>,
        );
    }
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
              child: Icon(
                type.icon,
                size: 30,
              ),
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
  final List<DashboardMeeting> meetings;

  const _MeetingTableCard({
    required this.title,
    required this.emptyMessage,
    required this.meetings,
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
            if (meetings.isEmpty) ...[
              Text(
                emptyMessage,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ] else ...[
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
                  rows: meetings.map((meeting) {
                    return DataRow(
                      cells: [
                        DataCell(Text(meeting.kayitId.toString())),
                        DataCell(Text(meeting.avukat)),
                        DataCell(Text(meeting.birim)),
                        DataCell(Text(meeting.geldigiYer)),
                        DataCell(Text(meeting.baslangic)),
                        DataCell(Text(meeting.bitis)),
                        DataCell(Text(meeting.konu)),
                        DataCell(Text(meeting.gelenEvrakNo)),
                        DataCell(Text(meeting.gidenEvrakNo)),
                        DataCell(Text(meeting.aciklama)),
                        DataCell(Text(meeting.durum)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
            const SizedBox(height: 12),
            const Divider(),
            Text(
              'Toplam kayıt: ${meetings.length}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HearingInfoCard extends StatelessWidget {
  final List<DashboardMeeting> hearings;

  const _HearingInfoCard({
    required this.hearings,
  });

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
            if (hearings.isEmpty) ...[
              Text(
                'Duruşma kaydı bulunamadı.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ] else ...[
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
                  rows: hearings.map((hearing) {
                    return DataRow(
                      cells: [
                        DataCell(Text(hearing.avukat)),
                        DataCell(Text(hearing.konu)),
                        DataCell(Text(hearing.baslangic)),
                        DataCell(Text(hearing.bitis)), // Saat
                        DataCell(Text(hearing.geldigiYer)),
                        DataCell(Text(hearing.aciklama)),
                        DataCell(Text(hearing.durum)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
            const SizedBox(height: 12),
            const Divider(),
            Text(
              'Toplam duruşma kaydı: ${hearings.length}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FileStatisticsCard extends StatelessWidget {
  final List<DashboardFileStatistics> statistics;

  const _FileStatisticsCard({
    required this.statistics,
  });

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
            if (statistics.isEmpty) ...[
              Text(
                'İstatistik kaydı bulunamadı.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ] else ...[
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
                  rows: statistics.map((stat) {
                    return DataRow(
                      cells: [
                        DataCell(Text(stat.avukat)),
                        DataCell(Text(stat.tcKimlik)),
                        DataCell(Text(stat.adliDerdest.toString())),
                        DataCell(Text(stat.adliObekliyor.toString())),
                        DataCell(Text(stat.adliHitam.toString())),
                        DataCell(Text(stat.idariDerdest.toString())),
                        DataCell(Text(stat.idariObekliyor.toString())),
                        DataCell(Text(stat.idariHitam.toString())),
                        DataCell(Text(stat.cezaDerdest.toString())),
                        DataCell(Text(stat.cezaObekliyor.toString())),
                        DataCell(Text(stat.cezaHitam.toString())),
                        DataCell(Text(stat.icraDerdest.toString())),
                        DataCell(Text(stat.icraObekliyor.toString())),
                        DataCell(Text(stat.icraHitam.toString())),
                        DataCell(Text(stat.toplam.toString())),
                        DataCell(Text(stat.durusma.toString())),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
            const SizedBox(height: 12),
            const Divider(),
            Text(
              'Toplam kayıt: ${statistics.length}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}