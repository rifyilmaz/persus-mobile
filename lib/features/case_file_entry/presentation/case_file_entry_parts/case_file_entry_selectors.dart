part of '../case_file_entry_page.dart';

class _HeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final CaseMainType selectedMainType;

  const _HeaderCard({
    required this.title,
    required this.subtitle,
    required this.selectedMainType,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: colorScheme.surface,
              child: const Icon(Icons.folder_copy_outlined),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(subtitle),
                  const SizedBox(height: 8),
                  Text(
                    'Seçili tür: ${selectedMainType.detailTitle}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainTypeSelector extends StatelessWidget {
  final CaseMainType selectedType;
  final ValueChanged<CaseMainType> onChanged;

  const _MainTypeSelector({
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'Dosya Türü',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final type in CaseMainType.values)
            ChoiceChip(
              label: Text(type.label),
              selected: selectedType == type,
              onSelected: (_) => onChanged(type),
            ),
        ],
      ),
    );
  }
}

class _DavaSubTypeSelector extends StatelessWidget {
  final DavaSubType selectedType;
  final ValueChanged<DavaSubType> onChanged;

  const _DavaSubTypeSelector({
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'Dava Alt Türü',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final type in DavaSubType.values)
            ChoiceChip(
              label: Text(type.label),
              selected: selectedType == type,
              onSelected: (_) => onChanged(type),
            ),
        ],
      ),
    );
  }
}

class _IcraPageSelector extends StatelessWidget {
  final IcraPageSection selectedPage;
  final ValueChanged<IcraPageSection> onChanged;

  const _IcraPageSelector({
    required this.selectedPage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'İcra Sayfası',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final page in IcraPageSection.values)
            ChoiceChip(
              avatar: Icon(
                page.icon,
                size: 18,
              ),
              label: Text(page.label),
              selected: selectedPage == page,
              onSelected: (_) => onChanged(page),
            ),
        ],
      ),
    );
  }
}

class _DavaPageSelector extends StatelessWidget {
  final DavaPageSection selectedPage;
  final ValueChanged<DavaPageSection> onChanged;

  const _DavaPageSelector({
    required this.selectedPage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'Dava Sayfası',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final page in DavaPageSection.values)
            ChoiceChip(
              avatar: Icon(
                page.icon,
                size: 18,
              ),
              label: Text(page.label),
              selected: selectedPage == page,
              onSelected: (_) => onChanged(page),
            ),
        ],
      ),
    );
  }
}

class _DigerPageSelector extends StatelessWidget {
  final DigerPageSection selectedPage;
  final ValueChanged<DigerPageSection> onChanged;

  const _DigerPageSelector({
    required this.selectedPage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'Diğer Sayfası',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final page in DigerPageSection.values)
            ChoiceChip(
              avatar: Icon(
                page.icon,
                size: 18,
              ),
              label: Text(page.label),
              selected: selectedPage == page,
              onSelected: (_) => onChanged(page),
            ),
        ],
      ),
    );
  }
}

class _BilgiBelgePageSelector extends StatelessWidget {
  final BilgiBelgePageSection selectedPage;
  final ValueChanged<BilgiBelgePageSection> onChanged;

  const _BilgiBelgePageSelector({
    required this.selectedPage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'Bilgi-Belge Sayfası',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final page
              in BilgiBelgePageSection.values)
            ChoiceChip(
              avatar: Icon(
                page.icon,
                size: 18,
              ),
              label: Text(page.label),
              selected: selectedPage == page,
              onSelected: (_) => onChanged(page),
            ),
        ],
      ),
    );
  }
}

class _SectionSelector extends StatelessWidget {
  final CaseFormSection selectedSection;
  final List<CaseFormSection> sections;
  final ValueChanged<CaseFormSection> onChanged;

  const _SectionSelector({
    required this.selectedSection,
    required this.sections,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'Form Bölümü',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final section in sections)
            ChoiceChip(
              avatar: Icon(section.icon, size: 18),
              label: Text(section.label),
              selected: selectedSection == section,
              onSelected: (_) => onChanged(section),
            ),
        ],
      ),
    );
  }
}

class _SelectorCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SelectorCard({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
