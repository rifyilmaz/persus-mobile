part of '../case_query_page.dart';

extension _CaseQueryResultTable on _CaseQueryPageState {
  Widget _resultTable() {
    final records = _hasSearched ? _mockRecords : const <Map<String, String>>[];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kayıt Listesi',
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
                  for (final column in _queryResultColumns)
                    DataColumn(
                      label: Text(
                        column,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
                rows: [
                  for (final record in records)
                    DataRow(
                      cells: [
                        for (final column in _queryResultColumns)
                          DataCell(
                            Text(record[column] ?? ''),
                          ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            if (records.isEmpty)
              Text(
                'Kayıt yok.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              )
            else
              Text(
                '${records.length} kayıt listeleniyor.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            const SizedBox(height: 12),
            const Divider(),
            Text(
              'Toplam kayıt: ${records.length}',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}