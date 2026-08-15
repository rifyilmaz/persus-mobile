import 'package:flutter/material.dart';
import '../data/models/case_model.dart';
import '../data/services/case_service.dart';
import 'case_detail_page.dart';

class CaseListPage extends StatefulWidget {
  final CaseService caseService;

  const CaseListPage({
    super.key,
    required this.caseService,
  });

  @override
  State<CaseListPage> createState() => _CaseListPageState();
}

class _CaseListPageState extends State<CaseListPage> {
  bool _isLoading = true;
  String? _errorMessage;

  List<CaseModel> _allCases = [];
  List<CaseModel> _filteredCases = [];
  
  String _searchQuery = '';
  int _itemsPerPage = 10;
  int _currentPage = 0;

  final TextEditingController _searchController = TextEditingController();

  final TextEditingController _kayitNoController = TextEditingController();
  final TextEditingController _davaciTcController = TextEditingController();
  final TextEditingController _davaliTcController = TextEditingController();

  Map<String, dynamic> _activeFilters = {};

  @override
  void initState() {
    super.initState();
    _fetchCases(); 
  }

  @override
  void dispose() {
    _searchController.dispose();
    _kayitNoController.dispose();
    _davaciTcController.dispose();
    _davaliTcController.dispose();
    super.dispose();
  }

  Future<void> _fetchCases({Map<String, dynamic>? filters}) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final cases = await widget.caseService.getCases();
      
      if (!mounted) return;

      setState(() {
        _allCases = cases;
        _activeFilters = filters ?? {};
        
        var tempCases = _allCases;
        
        if (_activeFilters.isNotEmpty) {
          final filterKayitNo = _activeFilters['kayitNo']?.toString();
          
          if (filterKayitNo != null && filterKayitNo.isNotEmpty) {
            tempCases = tempCases.where((c) => c.kayitId.toString() == filterKayitNo).toList();
          }
          
        }
        
        _filteredCases = tempCases;
        _currentPage = 0;

        if (_searchController.text.isNotEmpty) {
          _onSearchChanged(_searchController.text);
        }
        
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString().replaceFirst('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _currentPage = 0; 
      
      if (_searchQuery.isEmpty) {
        _filteredCases = _allCases;
      } else {
        _filteredCases = _allCases.where((caseItem) {
          final searchableText = '''
            ${caseItem.konu ?? ''} 
            ${caseItem.davali ?? ''} 
            ${caseItem.davaciAdSoyad ?? ''}
            ${caseItem.davaTuru}
            ${caseItem.kayitId}
          '''.toLowerCase();
          
          return searchableText.contains(_searchQuery);
        }).toList();
      }
    });
  }

  int get _totalPages => _filteredCases.isEmpty ? 1 : (_filteredCases.length / _itemsPerPage).ceil();

  List<CaseModel> get _currentDisplayList {
    if (_filteredCases.isEmpty) return [];
    
    final startIndex = _currentPage * _itemsPerPage;
    var endIndex = startIndex + _itemsPerPage;
    
    if (endIndex > _filteredCases.length) {
      endIndex = _filteredCases.length;
    }
    
    return _filteredCases.sublist(startIndex, endIndex);
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (_, scrollController) {
            return DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Detaylı Dava Sorgu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  const TabBar(
                    tabs: [
                      Tab(text: 'Sorgu Parametresi'),
                      Tab(text: 'Ek Parametre'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView(
                          controller: scrollController,
                          padding: const EdgeInsets.all(16),
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _kayitNoController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Kayıt No',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'İç Takip Id',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Grup',
                                      border: OutlineInputBorder(),
                                    ),
                                    items: const [
                                      DropdownMenuItem(value: '1', child: Text('DAVA DOSYALARI')),
                                      DropdownMenuItem(value: '2', child: Text('GÖRÜŞ DOSYALARI')),
                                    ],
                                    onChanged: (v) {},
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      labelText: 'AltGrup',
                                      border: OutlineInputBorder(),
                                    ),
                                    items: const [],
                                    onChanged: (v) {},
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Dava Türü',
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(value: '1', child: Text('ALACAK')),
                                DropdownMenuItem(value: '2', child: Text('DİSİPLİN CEZASI')),
                                DropdownMenuItem(value: '3', child: Text('GÖRÜŞ')),
                              ],
                              onChanged: (v) {},
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Yetkili Mahkeme',
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.search),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  flex: 1,
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      labelText: 'Bul [Şehir]',
                                      border: OutlineInputBorder(),
                                    ),
                                    items: const [],
                                    onChanged: (v) {},
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _davaciTcController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Davacı / Tc Kimlik No',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextFormField(
                                    controller: _davaliTcController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Davalı / Tc Kimlik No',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      labelText: 'Avukat',
                                      border: OutlineInputBorder(),
                                    ),
                                    items: const [],
                                    onChanged: (v) {},
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      labelText: 'Durumu',
                                      border: OutlineInputBorder(),
                                    ),
                                    items: const [
                                      DropdownMenuItem(value: '1', child: Text('DERDEST')),
                                      DropdownMenuItem(value: '2', child: Text('KARARA ÇIKMIŞ')),
                                    ],
                                    onChanged: (v) {},
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Konu',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Karar Tarihi',
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.calendar_month, size: 20),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Olay Tarihi',
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.calendar_month, size: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            CheckboxListTile(
                              title: const Text('Sadece Seri Dosyalar'),
                              value: false,
                              onChanged: (bool? value) {},
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ],
                        ),

                        ListView(
                          controller: scrollController,
                          padding: const EdgeInsets.all(16),
                          children: [
                            const Text(
                              'Dilekçe Tebliğ / Verme Tarih',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Başlangıç',
                                      hintText: 'gg.aa.yyyy',
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.calendar_month, size: 20),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Bitiş',
                                      hintText: 'gg.aa.yyyy',
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.calendar_month, size: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'Kayıt Tarihi',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Başlangıç',
                                      hintText: 'gg.aa.yyyy',
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.calendar_month, size: 20),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Bitiş',
                                      hintText: 'gg.aa.yyyy',
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.calendar_month, size: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              _kayitNoController.clear();
                              _davaciTcController.clear();
                              _davaliTcController.clear();
                              setState(() {
                                _activeFilters.clear();
                              });
                            },
                            icon: const Icon(Icons.clear_all),
                            label: const Text('Temizle'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              
                              final newFilters = <String, dynamic>{};
                              if (_kayitNoController.text.isNotEmpty) {
                                newFilters['kayitNo'] = _kayitNoController.text;
                              }
                              if (_davaciTcController.text.isNotEmpty) {
                                newFilters['davaciTc'] = _davaciTcController.text;
                              }
                              if (_davaliTcController.text.isNotEmpty) {
                                newFilters['davaliTc'] = _davaliTcController.text;
                              }
                              
                              _fetchCases(filters: newFilters);
                            },
                            icon: const Icon(Icons.search),
                            label: const Text('Ara'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      hintText: 'Konu, Taraf, Kayıt No...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.tune),
                        tooltip: 'Gelişmiş Filtreleme',
                        onPressed: () => _showFilterBottomSheet(context),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: DropdownButtonFormField<int>(
                    isExpanded: true,
                    initialValue: _itemsPerPage,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: 10, child: Text('10 Adet')),
                      DropdownMenuItem(value: 20, child: Text('20 Adet')),
                      DropdownMenuItem(value: 50, child: Text('50 Adet')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _itemsPerPage = value;
                          _currentPage = 0;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          
          if (_isLoading)
            const Expanded(child: Center(child: CircularProgressIndicator()))
          else if (_errorMessage != null)
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Kayıtlar yüklenirken hata oluştu:\n$_errorMessage',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colorScheme.error),
                  ),
                ),
              ),
            )
          else ...[
            Expanded(
              child: _filteredCases.isEmpty
                  ? const Center(child: Text('Kayıt bulunamadı.'))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _currentDisplayList.length,
                      itemBuilder: (context, index) {
                        final item = _currentDisplayList[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          clipBehavior: Clip.antiAlias, 
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CaseDetailPage(caseItem: item),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: colorScheme.primaryContainer,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          item.davaGrup,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: colorScheme.onPrimaryContainer,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Kayıt No: ${item.kayitId}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    item.konu ?? item.davaTuru,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  if (item.davali != null && item.davali!.isNotEmpty)
                                    Text('Davalı: ${item.davali}'),
                                  if (item.davaciAdSoyad != null && item.davaciAdSoyad!.isNotEmpty)
                                    Text('Davacı: ${item.davaciAdSoyad}'),
                                  const SizedBox(height: 8),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item.durum,
                                        style: TextStyle(
                                          color: item.durum == 'DERDEST'
                                              ? Colors.orange
                                              : Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        item.davaTarihi.split(' ').first,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),

            if (_filteredCases.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      offset: const Offset(0, -2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Toplam: ${_filteredCases.length} kayıt',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: _currentPage > 0
                              ? () {
                                  setState(() {
                                    _currentPage--;
                                  });
                                }
                              : null,
                          icon: const Icon(Icons.chevron_left),
                        ),
                        Text(
                          'Sayfa ${_currentPage + 1} / $_totalPages',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                          onPressed: _currentPage < _totalPages - 1
                              ? () {
                                  setState(() {
                                    _currentPage++;
                                  });
                                }
                              : null,
                          icon: const Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }
}