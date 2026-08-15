import 'package:flutter/material.dart';

import '../data/services/case_service.dart';
import 'case_list_page.dart';

class CaseQueryPage extends StatelessWidget {
  final CaseService caseService;

  const CaseQueryPage({
    super.key,
    required this.caseService,
  });

  @override
  Widget build(BuildContext context) {
    return CaseListPage(caseService: caseService);
  }
}